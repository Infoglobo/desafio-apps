package com.alancamargo.desafioinfoglobo.images

import android.widget.ImageView
import com.squareup.picasso.Picasso

object AppImageHelper : ImageHelper {

    override fun loadImage(imageUrl: String, target: ImageView) {
        Picasso.get().load(imageUrl).into(target)
    }

}