package com.alancamargo.desafioinfoglobo.viewmodel

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.repository.ArticleRepository

class ArticleViewModel(application: Application) : AndroidViewModel(application) {

    fun getArticles(productIndex: Int): LiveData<List<Article>> {
        return ArticleRepository.getArticles(productIndex)
    }

}