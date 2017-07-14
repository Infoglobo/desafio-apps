package com.globo.oglobo.app.network.api;

import com.globo.oglobo.app.pojo.Capa;

import retrofit2.Call;
import retrofit2.http.GET;

/**
 * Created by Andre on 13/07/17.
 */

public interface API {

    String END_POINT = "https://raw.githubusercontent.com/Infoglobo/desafio-apps/";

    @GET("/master/capa.json")
    Call<Capa> getCapa();

}