package com.alancamargo.desafioinfoglobo.utils

import android.os.Build.VERSION.SDK_INT
import android.os.Build.VERSION_CODES.N
import android.text.Html
import android.text.Spanned
import java.text.SimpleDateFormat
import java.util.*

@Suppress("DEPRECATION")
fun getHtmlFormattedText(rawHtmlText: String): Spanned {
    return if (SDK_INT >= N)
        Html.fromHtml(rawHtmlText, Html.FROM_HTML_MODE_LEGACY)
    else
        Html.fromHtml(rawHtmlText)
}

fun formatDateString(dateString: String): String {
    val time = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.getDefault()).parse(dateString).time
    return SimpleDateFormat("dd/MM/yy HH:mm", Locale.getDefault()).format(time)
}