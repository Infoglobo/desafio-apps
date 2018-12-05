package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Image(@SerializedName("autor") val author: String,
                 @SerializedName("fonte") val source: String,
                 @SerializedName("legenda") val caption: String,
                 @SerializedName("url") val url: String)