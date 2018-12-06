package com.alancamargo.desafioinfoglobo.model

import com.google.gson.annotations.SerializedName

data class Section(@SerializedName("nome") var name: String = "",
                   @SerializedName("url") var url: String = "")