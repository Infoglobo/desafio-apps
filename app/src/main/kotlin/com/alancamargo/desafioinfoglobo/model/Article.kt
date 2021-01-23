package com.alancamargo.desafioinfoglobo.model

import android.os.Parcel
import android.os.Parcelable
import com.google.gson.annotations.SerializedName

data class Article(@SerializedName("autores") var authors: List<String> = listOf(),
                   @SerializedName("subTitulo") var subHeadline: String = "",
                   @SerializedName("texto") var text: String = "",
                   @SerializedName("atualizadoEm") var dateUpdated: String = "",
                   @SerializedName("secao") var section: Section = Section(),
                   @SerializedName("titulo") var headline: String = "",
                   @SerializedName("imagens") var images: List<Image> = listOf()) : Parcelable {

    companion object CREATOR : Parcelable.Creator<Article> {
        override fun createFromParcel(source: Parcel): Article = Article(source)

        override fun newArray(size: Int): Array<Article?> = arrayOfNulls(size)
    }

    @Suppress("unchecked_cast")
    constructor(parcel: Parcel): this() {
        with(parcel) {
            authors = readArrayList(javaClass.classLoader) as ArrayList<String>
            subHeadline = readString()!!
            text = readString()!!
            dateUpdated = readString()!!
            section = readParcelable(Section::class.java.classLoader) as Section
            headline = readString()!!
            images = readParcelableArray(Image::class.java.classLoader)!!.toList() as List<Image>
        }
    }

    override fun writeToParcel(dest: Parcel?, flags: Int) {
        dest?.let {
            it.writeList(authors)
            it.writeString(subHeadline)
            it.writeString(text)
            it.writeString(dateUpdated)
            it.writeParcelable(section, flags)
            it.writeString(headline)
            it.writeParcelableArray(images.toTypedArray(), flags)
        }
    }

    override fun describeContents() = 0

}