package com.alancamargo.desafioinfoglobo.robots

import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.intent.matcher.IntentMatchers.hasExtra
import androidx.test.espresso.matcher.ViewMatchers
import androidx.test.espresso.matcher.ViewMatchers.withEffectiveVisibility
import androidx.test.espresso.matcher.ViewMatchers.withId
import br.com.concretesolutions.kappuccino.assertions.VisibilityAssertions.displayed
import br.com.concretesolutions.kappuccino.custom.intent.IntentMatcherInteractions.stubIntent
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.utils.formatDateString

fun articleDetailsActivity(func: ArticleDetailsActivityRobot.() -> Unit): ArticleDetailsActivityRobot {
    return ArticleDetailsActivityRobot().apply(func)
}

class ArticleDetailsActivityRobot {

    fun articleIs(article: Article) {
        stubIntent {
            customMatcher(hasExtra("com.alancamargo.desafioinfoglobo.EXTRA_ARTICLE", article))

            respondWith {
                ok()
            }
        }
    }

    fun articleInfoIsDisplayed(article: Article) {
        headlineIsDisplayed(article)
        subHeadlineIsDisplayed(article)
        dateUpdatedIsDisplayed(article)
        headlinePhotoIsDisplayed(article)
        textIsDisplayed(article)
    }

    fun imageViewIsNotVisible() {
        onView(withId(R.id.img_headline_photo)).check(matches(withEffectiveVisibility(ViewMatchers.Visibility.GONE)))
    }

    private fun headlineIsDisplayed(article: Article) {
        displayed(scroll = true) {
            allOf {
                id(R.id.txt_headline)
                text(article.headline)
            }
        }
    }

    private fun subHeadlineIsDisplayed(article: Article) {
        displayed(scroll = true) {
            allOf {
                id(R.id.txt_sub_headline)
                text(article.subHeadline)
            }
        }
    }

    private fun dateUpdatedIsDisplayed(article: Article) {
        displayed(scroll = true) {
            allOf {
                id(R.id.txt_date_updated)
                text(formatDateString(article.dateUpdated))
            }
        }
    }

    private fun headlinePhotoIsDisplayed(article: Article) {
        displayed(scroll = true) {
            allOf {
                id(R.id.img_headline_photo)
                image(R.drawable.cabral_preso)
            }
        }
    }

    private fun textIsDisplayed(article: Article) {
        displayed(scroll = true) {
            allOf {
                id(R.id.txt_article_text)
                text(article.text)
            }
        }
    }

}
