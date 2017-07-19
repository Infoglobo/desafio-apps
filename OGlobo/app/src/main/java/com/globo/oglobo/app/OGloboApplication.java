package com.globo.oglobo.app;

import android.app.Application;

import com.globo.oglobo.app.helpers.InternetHelper;

import java.io.File;

/**
 * Created by Andre on 18/07/17.
 */

public class OGloboApplication extends Application {

    private static OGloboApplication instance;

    @Override
    public void onCreate() {
        super.onCreate();

        instance = this;
    }

    public static boolean isNetworkAvailable() {
        return InternetHelper.isNetworkAvailable(instance.getApplicationContext());
    }

    public static File getFileCacheDir() {
        return instance.getCacheDir();
    }

}