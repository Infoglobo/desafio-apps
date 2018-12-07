import com.alancamargo.desafioinfoglobo.utils.formatDateString
import org.hamcrest.CoreMatchers.`is`
import org.junit.Assert.assertThat
import org.junit.Test

class TextUtilsTest {

    @Test
    fun shouldFormatDateString() {
        val expected = "08/03/17 14:39"
        val actual = formatDateString("2017-03-08T14:39:44-0300")

        assertThat(actual, `is`(expected))
    }

}