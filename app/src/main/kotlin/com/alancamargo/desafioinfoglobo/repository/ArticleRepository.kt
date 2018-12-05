package com.alancamargo.desafioinfoglobo.repository

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.alancamargo.desafioinfoglobo.DependencyInjection
import com.alancamargo.desafioinfoglobo.api.ProductApi
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.model.Product
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

object ArticleRepository {

    private const val LOG_TAG = "ARTICLE_REPOSITORY"

    private val api: ProductApi = ProductApi.getApi(DependencyInjection.productApiBaseUrl)

    fun getArticles(productIndex: Int): LiveData<List<Article>> {
        val articles = MutableLiveData<List<Article>>()

        api.getProducts().enqueue(object : Callback<List<Product>> {
            override fun onResponse(call: Call<List<Product>>, response: Response<List<Product>>) {
                Log.d(LOG_TAG, "Response received")
                val products = response.body()
                if (response.isSuccessful && products != null) {
                    val product = products[productIndex]
                    articles.value = product.articles
                }
            }

            override fun onFailure(call: Call<List<Product>>, t: Throwable) {
                Log.e(LOG_TAG, "Error receiving response", t)
                articles.value = null
            }
        })

        return articles
    }

}