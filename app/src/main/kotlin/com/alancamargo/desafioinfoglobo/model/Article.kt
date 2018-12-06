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
        override fun createFromParcel(source: Parcel): Article = Article(source)

        override fun newArray(size: Int): Array<Article?> = arrayOfNulls(size)
    }

    @Suppress("unchecked_cast")
    constructor(parcel: Parcel): this() {
        with(parcel) {
            authors = readArrayList(javaClass.classLoader) as ArrayList<String>
            hasAds = readString()!!.toBoolean()
            subHeadline = readString()!!
            text = readString()!!
            dateUpdated = readString()!!
            datePublished = readString()!!
            section = readParcelable(javaClass.classLoader) as Section
            type = readString()!!
            headline = readString()!!
            originalUrl = readString()!!
            images = readParcelableArray(javaClass.classLoader)!!.toList() as List<Image>
            videos = readArrayList(javaClass.classLoader)!!
            id = readLong()
            url = readString()!!
        }
    }

    override fun writeToParcel(dest: Parcel?, flags: Int) {
        dest?.let {
            it.writeList(authors)
            it.writeString(hasAds.toString())
            it.writeString(subHeadline)
            it.writeString(text)
            it.writeString(dateUpdated)
            it.writeString(datePublished)
            it.writeParcelable(section, flags)
            it.writeString(type)
            it.writeString(headline)
            it.writeString(originalUrl)
            it.writeParcelableArray(images.toTypedArray(), flags)
            it.writeList(videos)
            it.writeLong(id)
            it.writeString(url)
        }
    }

    override fun describeContents() = 0

}