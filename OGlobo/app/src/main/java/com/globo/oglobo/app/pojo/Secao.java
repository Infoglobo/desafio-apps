package com.globo.oglobo.app.pojo;

import java.io.Serializable;

/**
 * Created by Andre on 12/07/17.
 */

public class Secao implements Serializable {

    private String nome;
    private String url;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}