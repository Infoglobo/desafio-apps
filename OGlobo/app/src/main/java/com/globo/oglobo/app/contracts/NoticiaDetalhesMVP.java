package com.globo.oglobo.app.contracts;

import com.globo.oglobo.app.pojo.Conteudo;

/**
 * Created by Andre on 17/07/17.
 */

public interface NoticiaDetalhesMVP {

    interface NoticiaDetalhesViewImpl {
        void exibirEditoria(String editoria);
        void exibirTitulo(String titulo, int visibility);
        void exibirSubTitulo(String subTitulo, int visibility);
        void exibirAutor(String autor, int visibility);
        void exibirData(String data, int visibility);
        void exibirLegenda(String legenda, int visibility);
        void exibirTexto(String texto, int visibility);
        void exibirImagem(String imagem, int visibility);
    }

    interface NoticiaDetalhesPresenterImpl {
        void preencherConteudo(Conteudo conteudo);
        int pegarVisibilidade(String texto);
    }

}