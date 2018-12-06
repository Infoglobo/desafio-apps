package com.alancamargo.desafioinfoglobo

import com.alancamargo.desafioinfoglobo.base.BaseActivityTest
import com.alancamargo.desafioinfoglobo.robots.mainActivity
import org.junit.Test

class MainActivityTest : BaseActivityTest<MainActivity>(MainActivity::class.java) {

    @Test
    fun whenClickingOnCoverArticle_shouldShowDetails() {
        mainActivity {
        } clickCoverArticle {
            redirectToArticleDetailsActivity()
        }
    }

    @Test
    fun whenClickingOnArticleInList_shouldShowDetails() {
        // TODO: mock API response
        mainActivity {
            articlePositionIs(0)
        } clickArticleInList {
            redirectToArticleDetailsActivity()
        }
    }

}