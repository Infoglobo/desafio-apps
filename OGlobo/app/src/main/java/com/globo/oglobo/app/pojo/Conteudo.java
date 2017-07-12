package com.globo.oglobo.app.pojo;

import java.util.Date;
import java.util.List;

/**
 * Created by Andre on 12/07/17.
 */

public class Conteudo {

    private List<String> autores;
    private boolean informePublicitario;
    private String subTitulo;
    private String texto;
    private List<String> videos;
    private Date atualizadoEm;
    private long id;
    private Date publicadoEm;
    private Secao secao;
    private String tipo;
    private String titulo;
    private String url;
    private String urlOriginal;
    private List<Imagem> imagens;

    public List<String> getAutores() {
        return autores;
    }

    public void setAutores(List<String> autores) {
        this.autores = autores;
    }

    public boolean isInformePublicitario() {
        return informePublicitario;
    }

    public void setInformePublicitario(boolean informePublicitario) {
        this.informePublicitario = informePublicitario;
    }

    public String getSubTitulo() {
        return subTitulo;
    }

    public void setSubTitulo(String subTitulo) {
        this.subTitulo = subTitulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public List<String> getVideos() {
        return videos;
    }

    public void setVideos(List<String> videos) {
        this.videos = videos;
    }

    public Date getAtualizadoEm() {
        return atualizadoEm;
    }

    public void setAtualizadoEm(Date atualizadoEm) {
        this.atualizadoEm = atualizadoEm;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getPublicadoEm() {
        return publicadoEm;
    }

    public void setPublicadoEm(Date publicadoEm) {
        this.publicadoEm = publicadoEm;
    }

    public Secao getSecao() {
        return secao;
    }

    public void setSecao(Secao secao) {
        this.secao = secao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrlOriginal() {
        return urlOriginal;
    }

    public void setUrlOriginal(String urlOriginal) {
        this.urlOriginal = urlOriginal;
    }

    public List<Imagem> getImagens() {
        return imagens;
    }

    public void setImagens(List<Imagem> imagens) {
        this.imagens = imagens;
    }

}