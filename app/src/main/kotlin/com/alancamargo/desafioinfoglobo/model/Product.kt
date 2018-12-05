package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Product(@SerializedName("conteudos") val contents: List<Content>,
                   @SerializedName("produto") val name: String)