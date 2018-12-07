package com.alancamargo.desafioinfoglobo

import android.content.Intent
import androidx.test.platform.app.InstrumentationRegistry
import com.alancamargo.desafioinfoglobo.activities.ArticleDetailsActivity
import com.alancamargo.desafioinfoglobo.base.BaseActivityTest
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.robots.articleDetailsActivity
import org.junit.Before
import org.junit.Test

class ArticleDetailsActivityTest : BaseActivityTest<ArticleDetailsActivity>(ArticleDetailsActivity::class.java) {

    private lateinit var article: Article

    @Before
    override fun setup() {
        article = Article()
        super.setup()
    }

    @Test
    fun shouldDisplayCorrectArticle() {
        articleDetailsActivity {
            articleIs(article)
        }
    }

    override fun intent(): Intent {
        val context = InstrumentationRegistry.getInstrumentation().targetContext
        return ArticleDetailsActivity.getIntent(context, article)
    }

}