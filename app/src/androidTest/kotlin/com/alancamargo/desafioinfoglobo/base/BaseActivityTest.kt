package com.alancamargo.desafioinfoglobo.base

import android.content.Intent
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.test.espresso.intent.Intents
import androidx.test.espresso.intent.rule.IntentsTestRule
import androidx.test.rule.ActivityTestRule
import br.com.concretesolutions.kappuccino.utils.doWait
import com.alancamargo.desafioinfoglobo.DependencyInjection
import com.alancamargo.desafioinfoglobo.images.MockImageHelper
import okhttp3.mockwebserver.MockWebServer
import org.junit.After
import org.junit.Before
import org.junit.Rule
import java.io.InputStream

open class BaseActivityTest<T: AppCompatActivity>(activityClass: Class<T>,
                                                  private val autoLaunch: Boolean = true) {

    val mockArticleApi = MockWebServer()

    @Rule
    @JvmField
    val rule = if (autoLaunch) {
        IntentsTestRule(activityClass, true, false)
    } else {
        ActivityTestRule(activityClass, true, false)
    }

    @Before
    open fun setup() {
        DependencyInjection.init(mockArticleApi.url("/articles/").toString(), MockImageHelper)

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
        doWait(300)
    }

    open fun intent() = Intent()

    fun getJsonFromAsset(fileName: String): String {
        val json: String

        try {
            val inputStream: InputStream = rule.activity.assets.open(fileName)
            json = inputStream.bufferedReader().use { it.readText() }
        } catch (e: Exception) {
            Log.e(LOG_TAG, e.message, e)
            return ""
        }

        Log.d(LOG_TAG, json)
        return json.replace("\n", "")
    }

    private companion object {
        const val LOG_TAG = "androidTest"
    }

}