package com.alancamargo.desafioinfoglobo.activities

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View.GONE
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.utils.formatDateString
import com.alancamargo.desafioinfoglobo.utils.formatHtmlText
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_article_details.*

class ArticleDetailsActivity : AppCompatActivity() {

    private lateinit var article: Article

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_article_details)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        parseIntent()
        changeTitle()
        fillViews()
    }

    private fun parseIntent() {
        article = intent.getParcelableExtra(EXTRA_ARTICLE)
    }

    private fun changeTitle() {
        title = article.section.name.toUpperCase()
    }

    private fun fillViews() {
        with(article) {
            txt_headline.text = headline
            txt_sub_headline.text = subHeadline

            // TODO: Remove articles without author or text
            if (authors.isNotEmpty()) {
                authors[0].let {
                    val rawHtmlAuthorText = getString(R.string.author_format, authors[0])
                    txt_author.setText(formatHtmlText(rawHtmlAuthorText), TextView.BufferType.SPANNABLE)
                }
            } else {
                txt_author.visibility = GONE
            }

            txt_date_updated.text = formatDateString(dateUpdated)

            if (images.isNotEmpty()) {
                images[0].let {
                    Picasso.get().load(it.url).into(img_headline_photo)
                    txt_caption.text = getString(R.string.caption_format, it.caption, it.source)
                }
            } else {
                img_headline_photo.visibility = GONE
            }

            txt_article_text.text = text
        }
    }

    companion object {
        private const val EXTRA_ARTICLE = "com.alancamargo.desafioinfoglobo.EXTRA_ARTICLE"

        fun getIntent(context: Context, article: Article): Intent {
            return Intent(context, ArticleDetailsActivity::class.java)
                .putExtra(EXTRA_ARTICLE, article)
        }
    }

}