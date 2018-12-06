package com.alancamargo.desafioinfoglobo.activities

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.model.Article

class ArticleDetailsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_article_details)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
    }

    companion object {
        private const val EXTRA_ARTICLE = "com.alancamargo.desafioinfoglobo.EXTRA_ARTICLE"

        fun getIntent(context: Context, article: Article): Intent {
            return Intent(context, ArticleDetailsActivity::class.java)
                .putExtra(EXTRA_ARTICLE, article)
        }
    }

}