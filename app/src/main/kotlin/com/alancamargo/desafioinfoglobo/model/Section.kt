package com.alancamargo.desafioinfoglobo.model

import android.os.Parcel
import android.os.Parcelable
import com.google.gson.annotations.SerializedName

data class Section(@SerializedName("nome") var name: String = "",
                   @SerializedName("url") var url: String = ""): Parcelable {

    companion object CREATOR : Parcelable.Creator<Section> {
        override fun createFromParcel(source: Parcel): Section = Section(source)

        override fun newArray(size: Int): Array<Section?> = arrayOfNulls(size)
    }

    constructor(parcel: Parcel): this() {
        with(parcel) {
            name = readString()!!
            url = readString()!!
        }
    }

    override fun writeToParcel(dest: Parcel?, flags: Int) {
        dest?.let {
            it.writeString(name)
            it.writeString(url)
        }
    }

    override fun describeContents() = 0

}