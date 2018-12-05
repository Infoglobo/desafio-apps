package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Content(@SerializedName("autores") val authors: List<String>,
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
                   val videos: List<Any>,
                   val id: Long,
                   val url: String)