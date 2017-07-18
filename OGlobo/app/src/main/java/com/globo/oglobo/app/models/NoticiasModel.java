package com.globo.oglobo.app.models;

import com.globo.oglobo.app.contracts.NoticiasMVP;
import com.globo.oglobo.app.network.retrofit.Service;
import com.globo.oglobo.app.network.routers.CapaRouter;

/**
 * Created by Andre on 17/07/17.
 */

public class NoticiasModel implements NoticiasMVP.NoticiasModelImpl {

    private NoticiasMVP.NoticiasPresenterImpl presenter;

    public NoticiasModel(NoticiasMVP.NoticiasPresenterImpl presenter) {
        this.presenter = presenter;
    }

    @Override
    public void buscarNoticias() {
        new CapaRouter(Service.getService(), presenter).getCapa();
    }

}