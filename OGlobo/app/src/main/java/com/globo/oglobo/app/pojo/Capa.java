package com.globo.oglobo.app.pojo;

import java.util.List;

/**
 * Created by Andre on 12/07/17.
 */

public class Capa {

    private List<Conteudo> conteudos;
    private String produto;

    public List<Conteudo> getConteudos() {
        return conteudos;
    }

    public void setConteudos(List<Conteudo> conteudos) {
        this.conteudos = conteudos;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

}