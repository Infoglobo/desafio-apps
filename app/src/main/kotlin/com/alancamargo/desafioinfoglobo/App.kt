package com.alancamargo.desafioinfoglobo

import android.app.Application

@Suppress("unused")
class App : Application() {

    override fun onCreate() {
        super.onCreate()
        DependencyInjection.init(PRODUCT_API_BASE_URL)
    }

    private companion object {
        const val PRODUCT_API_BASE_URL = "https://raw.githubusercontent.com/"
    }

}