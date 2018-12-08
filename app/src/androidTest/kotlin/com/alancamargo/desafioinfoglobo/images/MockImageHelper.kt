package com.alancamargo.desafioinfoglobo.images

import android.widget.ImageView
import com.alancamargo.desafioinfoglobo.R

object MockImageHelper : ImageHelper {

    override fun loadImage(imageUrl: String, target: ImageView) {
        target.setImageResource(R.drawable.cabral_preso)
    }

}