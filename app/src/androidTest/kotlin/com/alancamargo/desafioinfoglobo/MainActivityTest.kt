package com.alancamargo.desafioinfoglobo

import com.alancamargo.desafioinfoglobo.activities.MainActivity
import com.alancamargo.desafioinfoglobo.base.BaseActivityTest
import com.alancamargo.desafioinfoglobo.robots.mainActivity
import okhttp3.mockwebserver.MockResponse
import org.junit.Before
import org.junit.Ignore
import org.junit.Test

class MainActivityTest : BaseActivityTest<MainActivity>(MainActivity::class.java) {

    @Before
    override fun setup() {
        super.setup()
        mockApiResponse()
    }

    // FIXME: this test is only passing when executed individually
    @Test
    @Ignore
    fun whenClickingOnCoverArticle_shouldShowDetails() {
        mainActivity {
        } clickCoverArticle {
            redirectToArticleDetailsActivity()
        }
    }

    @Test
    fun whenClickingOnArticleInList_shouldShowDetails() {
        mainActivity {
            articlePositionIs(0)
        } clickArticleInList {
            redirectToArticleDetailsActivity()
        }
    }

    private fun mockApiResponse() {
        val body = getJsonFromAsset("fixtures/response_articles.json")
        mockArticleApi.enqueue(MockResponse().setResponseCode(200).setBody(body))
    }

}