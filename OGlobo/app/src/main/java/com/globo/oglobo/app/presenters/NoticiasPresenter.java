package com.globo.oglobo.app.presenters;

import android.view.View;

import com.globo.oglobo.app.contracts.NoticiasMVP;
import com.globo.oglobo.app.models.NoticiasModel;
import com.globo.oglobo.app.pojo.Conteudo;

import java.util.List;

/**
 * Created by Andre on 17/07/17.
 */

public class NoticiasPresenter implements NoticiasMVP.NoticiasPresenterImpl {

    private NoticiasMVP.NoticiasViewImpl view;

    public NoticiasPresenter(NoticiasMVP.NoticiasViewImpl view) {
        this.view = view;
    }

    public void buscarNoticias() {
        showProgressBar(true);
        new NoticiasModel(this).buscarNoticias();
    }

    @Override
    public void showProgressBar(boolean status) {
        view.exibirProgressBar(status ? View.VISIBLE : View.GONE);
    }

    @Override
    public void updateNoticias(List<Conteudo> conteudos) {
        if (conteudos != null)
            view.onSuccess(conteudos);
        else
            view.onFailed();

        showProgressBar(false);
    }

}