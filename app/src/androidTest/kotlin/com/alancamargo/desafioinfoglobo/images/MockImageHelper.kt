package com.alancamargo.desafioinfoglobo.images

import android.widget.ImageView

object MockImageHelper : ImageHelper {

    override fun loadImage(imageUrl: String, target: ImageView) {
        target.setImageResource(android.R.drawable.ic_menu_gallery)
    }

}