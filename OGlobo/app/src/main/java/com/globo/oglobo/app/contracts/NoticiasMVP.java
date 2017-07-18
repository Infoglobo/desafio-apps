package com.globo.oglobo.app.contracts;

import com.globo.oglobo.app.pojo.Conteudo;

import java.util.List;

/**
 * Created by Andre on 17/07/17.
 */

public interface NoticiasMVP {

    interface NoticiasModelImpl {
        void buscarNoticias();
    }

    interface NoticiasViewImpl extends APICallback<List<Conteudo>> {
        void exibirProgressBar(int visibility);
    }

    interface NoticiasPresenterImpl {
        void buscarNoticias();
        void showProgressBar(boolean status);
        void updateNoticias(List<Conteudo> conteudos);
    }

}