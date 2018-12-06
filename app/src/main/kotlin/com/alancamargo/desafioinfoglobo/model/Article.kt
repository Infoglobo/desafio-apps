package com.alancamargo.desafioinfoglobo.model

import android.os.Parcel
import android.os.Parcelable
import com.google.gson.annotations.SerializedName

data class Article(@SerializedName("autores") var authors: List<String> = listOf(),
                   @SerializedName("informePublicitario") var hasAds: Boolean = false,
                   @SerializedName("subTitulo") var subHeadline: String = "",
                   @SerializedName("texto") var text: String = "",
                   @SerializedName("atualizadoEm") var dateUpdated: String = "",
                   @SerializedName("publicadoEm") var datePublished: String = "",
                   @SerializedName("secao") var section: Section = Section(),
                   @SerializedName("tipo") var type: String = "",
                   @SerializedName("titulo") var headline: String = "",
                   @SerializedName("urlOriginal") var originalUrl: String = "",
                   @SerializedName("imagens") var images: List<Image> = listOf(),
                   @SerializedName("videos") var videos: List<Any> = listOf(),
                   @SerializedName("id") var id: Long = 0L,
                   @SerializedName("url") var url: String = "") : Parcelable {

    companion object CREATOR : Parcelable.Creator<Article> {
        override fun createFromParcel(source: Parcel?): Article {

        }

        override fun newArray(size: Int): Array<Article?> = arrayOfNulls(size)
    }

    override fun writeToParcel(dest: Parcel?, flags: Int) {

    }

    override fun describeContents() = 0

}