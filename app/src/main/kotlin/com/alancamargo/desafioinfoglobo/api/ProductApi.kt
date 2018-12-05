package com.alancamargo.desafioinfoglobo.api

import android.content.Context
import android.net.ConnectivityManager
import com.alancamargo.desafioinfoglobo.model.Product
import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Call
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

interface ProductApi {

    @GET("Infoglobo/desafio-apps/master/capa.json")
    fun getProducts(): Call<List<Product>>

    companion object {
        fun getApi(baseUrl: String, context: Context): ProductApi {
            return Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .client(createHttpClient(context))
                .build()
                .create(ProductApi::class.java)
        }

        private fun createHttpClient(context: Context): OkHttpClient {
            val cacheSize = (5 * 1024 * 1024).toLong()
            val myCache = Cache(context.cacheDir, cacheSize)

            return OkHttpClient.Builder()
                .cache(myCache)
                .addInterceptor { chain ->
                    var request = chain.request()

                    // If there is network, look for the response cached up to 5 seconds ago
                    val maxAge = 5

                    // If the cache is older than 7 days, delete it
                    val maxStale = 60 * 60 * 24 * 7

                    request = if (hasNetwork(context))
                        request.newBuilder().header("Cache-Control", "public, max-age=$maxAge").build()
                    else
                        request.newBuilder().header("Cache-Control", "public, only-if-cached, max-stale=$maxStale").build()
                    chain.proceed(request)
                }
                .build()
        }

        private fun hasNetwork(context: Context): Boolean {
            val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val activeNetwork = connectivityManager.activeNetworkInfo
            return activeNetwork.isConnected
        }
    }

}