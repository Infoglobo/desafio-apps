package com.alancamargo.desafioinfoglobo

import android.app.Application
import com.alancamargo.desafioinfoglobo.images.AppImageHelper

@Suppress("unused")
class App : Application() {

    override fun onCreate() {
        super.onCreate()
        DependencyInjection.init(PRODUCT_API_BASE_URL, AppImageHelper)
    }

    private companion object {
        const val PRODUCT_API_BASE_URL = "https://raw.githubusercontent.com/"
    }

}