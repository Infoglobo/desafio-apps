package com.alancamargo.desafioinfoglobo

import com.alancamargo.desafioinfoglobo.images.ImageHelper

object DependencyInjection {

    lateinit var productApiBaseUrl: String
        private set

    lateinit var imageHelper: ImageHelper
        private set

    fun init(productApiBaseUrl: String,
             imageHelper: ImageHelper) {
        this.productApiBaseUrl = productApiBaseUrl
        this.imageHelper = imageHelper
    }

}