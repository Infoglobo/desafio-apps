package com.globo.oglobo.app.views.adapters;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.globo.oglobo.app.R;
import com.globo.oglobo.app.helpers.ImageHelper;
import com.globo.oglobo.app.pojo.Conteudo;
import com.globo.oglobo.app.pojo.Imagem;
import com.globo.oglobo.app.pojo.Secao;

import java.util.List;

/**
 * Created by Andre on 17/07/17.
 */

public class NoticiasAdapter extends RecyclerView.Adapter<NoticiasAdapter.NoticiaViewHolder> {

    private Context context;
    private List<Conteudo> conteudos;

    public NoticiasAdapter(Context context, List<Conteudo> conteudos) {
        this.context = context;
        this.conteudos = conteudos;
    }

    @Override
    public NoticiaViewHolder onCreateViewHolder(ViewGroup parent, int position) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(position == 0 ? R.layout.noticia_item_large_list_layout : R.layout.noticia_item_list_layout, parent, false);
        return new NoticiaViewHolder(view);
    }

    @Override
    public void onBindViewHolder(NoticiaViewHolder holder, int position) {
        Conteudo conteudo = conteudos.get(position);
        if (conteudo != null) {
            holder.setConteudo(conteudo);
        }
    }

    @Override
    public int getItemViewType(int position) {
        return position;
    }

    @Override
    public int getItemCount() {
        return conteudos != null ? conteudos.size() : 0;
    }

    public void updateConteudos(List<Conteudo> conteudos) {
        this.conteudos.clear();
        this.conteudos.addAll(conteudos);
        notifyDataSetChanged();
    }

    class NoticiaViewHolder extends RecyclerView.ViewHolder {

        private ImageView imgFoto;
        private TextView txtEditoria;
        private TextView txtTitulo;

        NoticiaViewHolder(View itemView) {
            super(itemView);

            imgFoto = (ImageView) itemView.findViewById(R.id.imgFoto);
            txtEditoria = (TextView) itemView.findViewById(R.id.txtEditoria);
            txtTitulo = (TextView) itemView.findViewById(R.id.txtTitulo);
        }

        void setConteudo(Conteudo conteudo) {
            List<Imagem> imagens = conteudo.getImagens();
            if (imagens != null && imagens.size() == 1) {
                Imagem imagem = imagens.get(0);
                if (imagem != null)
                    ImageHelper.loadImages(context, imagem.getUrl(), imgFoto);
            }

            Secao secao = conteudo.getSecao();
            if (secao != null) {
                String nomeSecao = secao.getNome();
                if (nomeSecao != null)
                    txtEditoria.setText(nomeSecao.toUpperCase());
            }

            txtTitulo.setText(conteudo.getTitulo());
        }
    }

}