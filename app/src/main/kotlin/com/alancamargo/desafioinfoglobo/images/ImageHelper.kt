package com.alancamargo.desafioinfoglobo.images

import android.widget.ImageView

interface ImageHelper {
    fun loadImage(imageUrl: String, target: ImageView)
}