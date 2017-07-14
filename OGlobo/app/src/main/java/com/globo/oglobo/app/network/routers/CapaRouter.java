package com.globo.oglobo.app.network.routers;

import com.globo.oglobo.app.contracts.APICallback;
import com.globo.oglobo.app.network.api.API;
import com.globo.oglobo.app.pojo.Capa;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by Andre on 13/07/17.
 */

public class CapaRouter {

    private API api;
    private APICallback<Capa> callback;

    public CapaRouter(API api, APICallback<Capa> callback) {
        this.api = api;
        this.callback = callback;
    }

    public void getCapa() {
        if (api != null) {
            api.getCapa().enqueue(new Callback<Capa>() {
                @Override
                public void onResponse(Call<Capa> call, Response<Capa> response) {
                    if (response.isSuccessful()) {
                        Capa capa = response.body();
                        if (capa != null && callback != null)
                            callback.onSuccess(capa);
                    }
                }

                @Override
                public void onFailure(Call<Capa> call, Throwable t) {
                    if (callback != null)
                        callback.onFailed();
                }
            });
        }
    }

}