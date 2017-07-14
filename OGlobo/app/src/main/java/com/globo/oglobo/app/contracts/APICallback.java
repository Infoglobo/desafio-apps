package com.globo.oglobo.app.contracts;

/**
 * Created by Andre on 13/07/17.
 */

public interface APICallback<T> {

    void onSuccess(T model);
    void onFailed();

}