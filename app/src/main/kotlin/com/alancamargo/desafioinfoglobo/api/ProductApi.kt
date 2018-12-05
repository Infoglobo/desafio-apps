package com.alancamargo.desafioinfoglobo.api

import com.alancamargo.desafioinfoglobo.model.Product
import com.google.gson.GsonBuilder
import retrofit2.Call
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

interface ProductApi {

    @GET("")
    fun getProducts(): Call<List<Product>>

    companion object {
        fun getApi(baseUrl: String): ProductApi {
            val gson = GsonBuilder().setLenient().create()

            return Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build()
                .create(ProductApi::class.java)
        }
    }

}