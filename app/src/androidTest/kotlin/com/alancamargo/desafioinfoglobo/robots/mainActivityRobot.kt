package com.alancamargo.desafioinfoglobo.robots

import br.com.concretesolutions.kappuccino.custom.intent.IntentMatcherInteractions.sentIntent
import br.com.concretesolutions.kappuccino.custom.recyclerView.RecyclerViewInteractions.recyclerView
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.activities.ArticleDetailsActivity

fun mainActivity(func: MainActivityRobot.() -> Unit) = MainActivityRobot().apply(func)

class MainActivityRobot {

    private var articlePosition = 0

    fun articlePositionIs(articlePosition: Int) {
        this.articlePosition = articlePosition
    }

    infix fun clickArticleInList(func: MainActivityResult.() -> Unit) {
        recyclerView(R.id.recycler_view) {
            atPosition(articlePosition) {
                click()
            }
        }

        applyResult(func)
    }

    private fun applyResult(func: MainActivityResult.() -> Unit) {
        MainActivityResult().apply(func)
    }

}

class MainActivityResult {

    fun redirectToArticleDetailsActivity() {
        sentIntent {
            className(ArticleDetailsActivity::class.java.name)
        }
    }

}