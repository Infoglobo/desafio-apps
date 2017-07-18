package com.globo.oglobo.app.network.routers;

import com.globo.oglobo.app.contracts.NoticiasMVP;
import com.globo.oglobo.app.network.api.API;
import com.globo.oglobo.app.pojo.Capa;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by Andre on 13/07/17.
 */

public class CapaRouter {

    private API api;
    private NoticiasMVP.NoticiasPresenterImpl callback;

    public CapaRouter(API api, NoticiasMVP.NoticiasPresenterImpl callback) {
        this.api = api;
        this.callback = callback;
    }

    public void getCapa() {
        if (api != null) {
            api.getCapa().enqueue(new Callback<List<Capa>>() {
                @Override
                public void onResponse(Call<List<Capa>> call, Response<List<Capa>> response) {
                    if (callback != null) {
                        if (response.isSuccessful()) {
                            List<Capa> capas = response.body();
                            if (capas != null) {
                                Capa capa = capas.get(0);
                                callback.updateNoticias(capa.getConteudos());
                            }
                        } else {
                            callback.updateNoticias(null);
                        }
                    }
                }

                @Override
                public void onFailure(Call<List<Capa>> call, Throwable t) {
                    if (callback != null)
                        callback.updateNoticias(null);
                }
            });
        }
    }

}