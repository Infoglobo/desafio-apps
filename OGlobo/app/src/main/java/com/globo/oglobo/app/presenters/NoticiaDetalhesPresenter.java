package com.globo.oglobo.app.presenters;

import android.view.View;

import com.globo.oglobo.app.contracts.NoticiaDetalhesMVP;
import com.globo.oglobo.app.helpers.ConteudoInfoHelper;
import com.globo.oglobo.app.pojo.Conteudo;

/**
 * Created by Andre on 18/07/17.
 */

public class NoticiaDetalhesPresenter implements NoticiaDetalhesMVP.NoticiaDetalhesPresenterImpl {

    private NoticiaDetalhesMVP.NoticiaDetalhesViewImpl view;

    public NoticiaDetalhesPresenter(NoticiaDetalhesMVP.NoticiaDetalhesViewImpl view) {
        this.view = view;
    }

    @Override
    public void preencherConteudo(Conteudo conteudo) {
        String titulo = conteudo.getTitulo();
        view.exibirTitulo(titulo, pegarVisibilidade(titulo));

        String subTitulo = conteudo.getSubTitulo();
        view.exibirSubTitulo(subTitulo, pegarVisibilidade(subTitulo));

        String autor = ConteudoInfoHelper.getAutor(conteudo);
        view.exibirAutor(autor, pegarVisibilidade(autor));

        String dataPublicacao = ConteudoInfoHelper.getDataPublicacao(conteudo);
        view.exibirData(dataPublicacao, pegarVisibilidade(dataPublicacao));

        String urlImagem = ConteudoInfoHelper.getUrlImagem(conteudo);
        view.exibirImagem(urlImagem, pegarVisibilidade(urlImagem));

        String legenda = ConteudoInfoHelper.getLegenda(conteudo);
        view.exibirLegenda(legenda, pegarVisibilidade(legenda));

        String texto = conteudo.getTexto();
        view.exibirTexto(texto, pegarVisibilidade(texto));
    }

    @Override
    public int pegarVisibilidade(String texto) {
        return texto == null || texto.isEmpty() ? View.GONE : View.VISIBLE;
    }

}