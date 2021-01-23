package com.alancamargo.desafioinfoglobo.model

import android.os.Parcel
import android.os.Parcelable
import com.google.gson.annotations.SerializedName

data class Image(@SerializedName("fonte") var source: String = "",
                 @SerializedName("legenda") var caption: String = "",
                 @SerializedName("url") var url: String = ""): Parcelable {

    companion object CREATOR : Parcelable.Creator<Image> {
        override fun createFromParcel(source: Parcel): Image = Image(source)

        override fun newArray(size: Int): Array<Image?> = arrayOfNulls(size)
    }

    constructor(parcel: Parcel): this() {
        with(parcel) {
            source = readString()!!
            caption = readString()!!
            url = readString()!!
        }
    }

    override fun writeToParcel(dest: Parcel?, flags: Int) {
        dest?.let {
            it.writeString(source)
            it.writeString(caption)
            it.writeString(url)
        }
    }

    override fun describeContents() = 0

}