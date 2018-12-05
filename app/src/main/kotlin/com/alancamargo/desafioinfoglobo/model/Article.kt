package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Article(@SerializedName("autores") val authors: List<String>,
                   @SerializedName("informePublicitario") val hasAds: Boolean,
                   @SerializedName("subTitulo") val subHeadline: String,
                   @SerializedName("texto") val text: String,
                   @SerializedName("atualizadoEm") val dateUpdated: String,
                   @SerializedName("publicadoEm") val datePublished: String,
                   @SerializedName("secao") val section: Section,
                   @SerializedName("tipo") val type: String,
                   @SerializedName("titulo") val headline: String,
                   @SerializedName("urlOriginal") val originalUrl: String,
                   @SerializedName("imagens") val images: List<Image>,
                   @SerializedName("videos") val videos: List<Any>,
                   @SerializedName("id") val id: Long,
                   @SerializedName("url") val url: String)