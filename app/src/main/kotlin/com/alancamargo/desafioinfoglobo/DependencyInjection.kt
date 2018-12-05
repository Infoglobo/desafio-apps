package com.alancamargo.desafioinfoglobo

object DependencyInjection {

    lateinit var productApiBaseUrl: String
        private set

    fun init(productApiBaseUrl: String) {
        this.productApiBaseUrl = productApiBaseUrl
    }

}