package com.alancamargo.desafioinfoglobo.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.alancamargo.desafioinfoglobo.DependencyInjection
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.adapter.ArticleAdapter
import com.alancamargo.desafioinfoglobo.adapter.DividerItemDecoration
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.utils.launchArticleDetailsActivity
import com.alancamargo.desafioinfoglobo.viewmodel.ArticleViewModel
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), ArticleAdapter.OnItemClickListener {

    private lateinit var viewModel: ArticleViewModel

    private var adapter = ArticleAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        title = getString(R.string.title_main_activity).toUpperCase()
        setupRecyclerView()
        loadArticles()
    }

    override fun onItemClick(article: Article) {
        showArticleDetails(article)
    }

    private fun setupRecyclerView() {
        recycler_view.let {
            it.layoutManager = LinearLayoutManager(this)
            val divider = DividerItemDecoration(this)
            it.addItemDecoration(divider)
            it.setHasFixedSize(true)
            it.adapter = adapter
        }

        adapter.setOnItemClickListener(this)
    }

    private fun loadArticles() {
        viewModel = ViewModelProviders.of(this).get(ArticleViewModel::class.java)
        viewModel.getArticles(productIndex = 0).observe(this, Observer { articles ->
            val coverArticle = articles[0]
            fillCover(coverArticle)

            val otherArticles = articles.subList(1, articles.lastIndex).filter {
                it.authors.isNotEmpty() && it.text.isNotEmpty()
            }
            adapter.setData(otherArticles)
        })
    }

    private fun showArticleDetails(article: Article) {
        launchArticleDetailsActivity(article)
    }

    private fun fillCover(coverArticle: Article) {
        with(coverArticle) {
            if (images.isNotEmpty())
                DependencyInjection.imageHelper.loadImage(images[0].url, img_cover)

            txt_subject.text = section.name
            txt_headline.text = headline

            img_cover.setOnClickListener {
                showArticleDetails(this)
            }
        }
    }

}