package com.alancamargo.desafioinfoglobo

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.alancamargo.desafioinfoglobo.adapter.ArticleAdapter
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.viewmodel.ArticleViewModel
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), ArticleAdapter.OnItemClickListener {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setupRecyclerView()
    }

    override fun onItemClick(article: Article) {

    }

    private fun setupRecyclerView() {
        val adapter = ArticleAdapter()
        recycler_view.let {
            it.layoutManager = LinearLayoutManager(this)
            val divider = DividerItemDecoration(this, DividerItemDecoration.HORIZONTAL)
            it.addItemDecoration(divider)
            it.setHasFixedSize(true)
            it.adapter = adapter
        }

        val viewModel = ViewModelProviders.of(this).get(ArticleViewModel::class.java)
        viewModel.getArticles(productIndex = 0).observe(this, Observer { articles ->
            val coverArticle = articles[0]
            if (coverArticle.images.isNotEmpty())
                Picasso.get().load(coverArticle.images[0].url).into(img_cover)
            else
                Picasso.get().load(R.drawable.ic_image).into(img_cover)
            txt_subject.text = coverArticle.section.name
            txt_headline.text = coverArticle.headline

            val otherArticles = articles.subList(1, articles.lastIndex)
            adapter.setData(otherArticles)
        })

        adapter.setOnItemClickListener(this)
    }

}