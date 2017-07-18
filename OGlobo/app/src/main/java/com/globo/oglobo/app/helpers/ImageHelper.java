package com.globo.oglobo.app.helpers;

import android.content.Context;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.globo.oglobo.app.R;

/**
 * Created by Andre on 17/07/17.
 */

public class ImageHelper {

    public static void loadImages(Context context, String file, ImageView img) {
        Glide.with(context)
                .load(file)
                .fitCenter()
                .centerCrop()
                .diskCacheStrategy(DiskCacheStrategy.ALL)
                .skipMemoryCache(true)
                .error(R.drawable.no_image)
                .placeholder(R.drawable.no_image)
                .into(img);
    }

}