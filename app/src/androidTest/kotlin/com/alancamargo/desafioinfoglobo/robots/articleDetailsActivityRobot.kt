package com.alancamargo.desafioinfoglobo.robots

import androidx.test.rule.ActivityTestRule
import com.alancamargo.desafioinfoglobo.ArticleDetailsActivityTest
import com.alancamargo.desafioinfoglobo.activities.ArticleDetailsActivity
import com.alancamargo.desafioinfoglobo.model.Article

fun ArticleDetailsActivityTest.articleDetailsActivity(func: ArticleDetailsActivityRobot.() -> Unit)
        : ArticleDetailsActivityRobot {
    return ArticleDetailsActivityRobot(rule).apply(func)
}

class ArticleDetailsActivityRobot(private val rule: ActivityTestRule<ArticleDetailsActivity>) {

    fun articleIs(article: Article) {
        // TODO: implement
    }

}