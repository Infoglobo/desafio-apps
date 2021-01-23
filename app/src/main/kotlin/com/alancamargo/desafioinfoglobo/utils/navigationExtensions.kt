package com.alancamargo.desafioinfoglobo.utils

import androidx.appcompat.app.AppCompatActivity
import com.alancamargo.desafioinfoglobo.activities.ArticleDetailsActivity
import com.alancamargo.desafioinfoglobo.model.Article

fun AppCompatActivity.launchArticleDetailsActivity(article: Article) {
    val intent = ArticleDetailsActivity.getIntent(this, article)
    startActivity(intent)
}