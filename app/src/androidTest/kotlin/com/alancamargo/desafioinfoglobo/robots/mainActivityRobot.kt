package com.alancamargo.desafioinfoglobo.robots

import br.com.concretesolutions.kappuccino.actions.ClickActions.click
import br.com.concretesolutions.kappuccino.custom.recyclerView.RecyclerViewInteractions.recyclerView
import com.alancamargo.desafioinfoglobo.R

fun mainActivity(func: MainActivityRobot.() -> Unit) = MainActivityRobot().apply(func)

class MainActivityRobot {

    private var articlePosition = 0

    fun articlePositionIs(articlePosition: Int) {
        this.articlePosition = articlePosition
    }

    infix fun clickCoverArticle(func: MainActivityResult.() -> Unit) {
        click {
            id(R.id.img_cover)
        }

        applyResult(func)
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
        // TODO: implement
    }

}