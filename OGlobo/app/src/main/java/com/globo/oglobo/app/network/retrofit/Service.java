package com.globo.oglobo.app.network.retrofit;

import com.globo.oglobo.app.network.api.API;

/**
 * Created by Andre on 13/07/17.
 */

public class Service {

    public static API getService() {
        return Client.getClient().create(API.class);
    }

}