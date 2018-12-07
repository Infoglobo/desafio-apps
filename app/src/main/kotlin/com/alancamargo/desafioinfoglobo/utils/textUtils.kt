package com.alancamargo.desafioinfoglobo.utils

import android.os.Build.VERSION.SDK_INT
import android.os.Build.VERSION_CODES.N
import android.text.Html
import android.text.Spanned

@Suppress("DEPRECATION")
fun getHtmlFormattedText(rawHtmlText: String): Spanned {
    return if (SDK_INT >= N)
        Html.fromHtml(rawHtmlText, Html.FROM_HTML_MODE_LEGACY)
    else
        Html.fromHtml(rawHtmlText)
}