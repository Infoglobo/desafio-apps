package com.alancamargo.desafioinfoglobo.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.alancamargo.desafioinfoglobo.R

class ArticleDetailsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_article_details)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
    }

}