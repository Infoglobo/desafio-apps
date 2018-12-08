package com.alancamargo.desafioinfoglobo

import android.content.Intent
import androidx.test.platform.app.InstrumentationRegistry
import com.alancamargo.desafioinfoglobo.activities.ArticleDetailsActivity
import com.alancamargo.desafioinfoglobo.base.BaseActivityTest
import com.alancamargo.desafioinfoglobo.model.Article
import com.alancamargo.desafioinfoglobo.model.Image
import com.alancamargo.desafioinfoglobo.model.Section
import com.alancamargo.desafioinfoglobo.robots.articleDetailsActivity
import org.junit.Before
import org.junit.Test

class ArticleDetailsActivityTest : BaseActivityTest<ArticleDetailsActivity>(ArticleDetailsActivity::class.java,
    autoLaunch = false) {

    private lateinit var article: Article

    @Before
    override fun setup() {
        super.setup()
        prepareArticle()
        launch()
    }

    @Test
    fun shouldLoadCorrectArticle() {
        articleDetailsActivity {
            articleIs(article)
        }
    }

    @Test
    fun shouldDisplayCorrectArticleInfo() {
        articleDetailsActivity {
            articleInfoIsDisplayed(article)
        }
    }

    override fun intent(): Intent {
        val context = InstrumentationRegistry.getInstrumentation().targetContext
        return ArticleDetailsActivity.getIntent(context, article)
    }

    private fun prepareArticle() {
        article = Article(authors = listOf("O GLOBO"),
            subHeadline = "MPF denuncia doleiro Juca Bala, acusado de movimentar US\$ 3 milhões para o ex-governador",
            text = "\\n\\nRIO — O ex-governador do Rio Sérgio Cabral foi denunciado nesta quarta-feira pela sexta vez na Operação Lava-Jato. Nesta denúncia, a força-tarefa do Ministério Público Federal aponta ao ex-governador 25 crimes de evasão de divisas, 30 crimes de lavagem de dinheiro e 9 crimes de corrupção passiva decorrentes da Operação Eficiência, que prendeu o empresário Eike Batista. A denúncia foi apresentada à 7ª Vara Federal Criminal do Rio, cujo responsável é o juiz Marcelo Bretas. Cabral já é réu em cinco processos — quatro tramitam na 7ª Vara, com Bretas, e um na 13ª Vara Federal de Curitiba, com o juiz Sérgio Moro.\\n\\nENTENDA O QUE PESA CONTRA SÉRGIO CABRAL\\n\\nO MPF também denunciou o ex-secretário Wilson Carlos, os supostos operadores do esquema Carlos Miranda e Sérgio Castro de Oliveira, o “Serjão”, os doleiros Vinicius Claret, conhecido como “Juca Bala”, e Claudio de Souza, conhecido pelos apelidos “Tony” e “Peter”; além de Timothy Scorah Lynn. (Veja abaixo os crimes imputados a cada um)\\n\\nOutras duas pessoas que fizeram acordo de delação premiada também foram denunciadas. O MPF não divulgou seus nomes.\\n\\nNesta denúncia, os procuradores afirmam que Juca Bala movimentou US\$ 3.081.460 para Cabral. O doleiro usou o Banco BPA de Andorra, através de contrato de fachada firmado com empresa em nome de um dos colaboradores e Timothy Scorah Lynn.  Juca Bala e Cláudio de Souza foram presos no Uruguai na última sexta-feira.\\n\\nIRMÃOS CHEBAR DELATARAM ESQUEMA\\n\\nO esquema envolvendo Cabral e Juca Bala foi revelado pelos doleiros Renato e Marcelo Chebar, que firmaram acordo de colaboração. Os irmãos contaram aos investigadores que Cabral e outros envolvidos no esquema ocultaram e lavaram valores que somam R\$ 318.554.478,91.\\n\\nDesse total, cerca de R\$ 39 milhões foram movimentados e guardados no Brasil, US\$ 100 milhões em contas no exterior, € 1 milhão em diamantes, US\$ 1 milhão também em diamantes e US\$ 247 mil em barras de ouro.\\n\\nSegundo os investigadores, o acordo de delação dos irmãos Chebar permitiu que o MPF recuperasse cerca de US\$ 85 milhões.\\n\\nNesta denúncia, os procuradores voltaram a afirmar que Cabral era o comandante de uma organização criminosa. O MPF afirmou que o esquema utilizou quatro formas de lavar dinheiro no exterior: realizaram depósitos em nome de terceiros, realizavam pagamentos em joias, compravam ouro e diamantes e fizeram transferências bancárias para parentes de Carlos Miranda. \\n\\nDETALHES DA DENÚNCIA\\n\\nWilson Carlos — 25 crimes de evasão de divisas e 18 de lavagem de dinheiro.\\n\\nCarlos Miranda — 25 crimes de evasão de divisas e 21 crimes de lavagem de dinheiro.\\n\\nSérgio Castro de Oliveira, o “Serjão” — 8 crimes de evasão de divisas.\\n\\nVinicius Claret, o “Juca Bala” — 25 crimes de evasão de divisas, 9 de corrupção passiva, 9 de lavagem de dinheiro e crime de pertencimento à organização criminosa.\\n\\nClaudio de Souza, o “Tony” ou “Peter” — 25 crimes de evasão de divisas, 9 de corrupção passiva, 9 de lavagem de dinheiro e crime de pertencimento à organização criminosa.\\n\\nTimothy Scorah Lynn — 9 crimes de corrupção ativa e 9 de lavagem de dinheiro.",
            dateUpdated = "2017-03-08T13:25:03-0300",
            section = Section("Brasil"),
            headline = "Sérgio Cabral é denunciado pela sexta vez na Lava-Jato",
            images = listOf(
                Image(source = "Agência O Globo / 17-11-2016",
                caption = "O ex-governador do Rio Sérgio Cabral ao ser preso pela Polícia Federal em novembro",
                url = "https://ogimg.infoglobo.com.br/in/20620804-669-05e/FT1086A/cabral-preso.jpg"
                )
            )
        )
    }

}