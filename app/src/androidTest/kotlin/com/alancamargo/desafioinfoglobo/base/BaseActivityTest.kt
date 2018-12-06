package com.alancamargo.desafioinfoglobo.base

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import androidx.test.espresso.intent.Intents
import androidx.test.espresso.intent.rule.IntentsTestRule
import androidx.test.rule.ActivityTestRule
import org.junit.After
import org.junit.Before
import org.junit.Rule

open class BaseActivityTest<T: AppCompatActivity>(activityClass: Class<T>,
                                                  private val autoLaunch: Boolean = true) {

    @Rule
    @JvmField
    val rule = if (autoLaunch) {
        IntentsTestRule(activityClass, true, false)
    } else {
        ActivityTestRule(activityClass, true, false)
    }

    @Before
    open fun setup() {
        if (autoLaunch)
            launch()
        else
            Intents.init()
    }

    @After
    open fun afterTest() {
        if (!autoLaunch)
            Intents.release()
    }

    open fun launch() {
        rule.launchActivity(intent())
    }

    open fun intent() = Intent()

}