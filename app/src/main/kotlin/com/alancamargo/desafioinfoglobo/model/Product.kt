package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Product(@SerializedName("conteudos") val articles: List<Article>,
                   @SerializedName("produto") val name: String)