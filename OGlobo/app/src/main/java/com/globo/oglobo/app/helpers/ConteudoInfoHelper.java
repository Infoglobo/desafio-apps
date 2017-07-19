package com.globo.oglobo.app.helpers;

import com.globo.oglobo.app.pojo.Conteudo;
import com.globo.oglobo.app.pojo.Imagem;
import com.globo.oglobo.app.pojo.Secao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Andre on 18/07/17.
 */

public class ConteudoInfoHelper {

    public static String getUrlImagem(final Conteudo conteudo) {
        if (conteudo != null) {
            List<Imagem> imagens = conteudo.getImagens();
            if (imagens != null && imagens.size() > 0) {
                Imagem imagem = imagens.get(0);
                if (imagem != null)
                    return imagem.getUrl();
            }
        }
        return null;
    }

    public static String getAutor(final Conteudo conteudo) {
        if (conteudo != null) {
            List<String> autores = conteudo.getAutores();
            if (autores != null && autores.size() > 0) {
                return "POR " + autores.get(0).toUpperCase();
            }
        }
        return null;
    }

    public static String getNomeSecao(final Conteudo conteudo) {
        if (conteudo != null) {
            Secao secao = conteudo.getSecao();
            if (secao != null) {
                String nomeSecao = secao.getNome();
                if (nomeSecao != null)
                    return nomeSecao.toUpperCase();
            }
        }
        return null;
    }

    public static String getDataPublicacao(Conteudo conteudo) {
        if (conteudo != null) {
            Date publicadoEm = conteudo.getPublicadoEm();
            if (publicadoEm != null)
                return new SimpleDateFormat("dd/MM/yyyy hh:mm").format(publicadoEm).toString();
        }
        return null;
    }

    public static String getLegenda(Conteudo conteudo) {
        if (conteudo != null) {
            List<Imagem> imagens = conteudo.getImagens();
            if (imagens != null && imagens.size() > 0) {
                Imagem imagem = imagens.get(0);
                if (imagem != null) {
                    return imagem.getLegenda() + (!imagem.getFonte().isEmpty() ? " Foto: " + imagem.getFonte() : "");
                }
            }
        }
        return null;
    }

}