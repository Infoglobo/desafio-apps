package com.globo.oglobo.app.views.adapters;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.globo.oglobo.app.R;
import com.globo.oglobo.app.helpers.ConteudoInfoHelper;
import com.globo.oglobo.app.helpers.ImageHelper;
import com.globo.oglobo.app.pojo.Conteudo;
import com.globo.oglobo.app.views.activities.NoticiaDetalhesActivity;

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
    public void onBindViewHolder(final NoticiaViewHolder holder, int position) {
        final Conteudo conteudo = conteudos.get(position);
        if (conteudo != null) {
            holder.setConteudo(conteudo);
        }

        holder.view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, NoticiaDetalhesActivity.class);
                intent.putExtra(NoticiaDetalhesActivity.CONTEUDO, conteudo);
                context.startActivity(intent);
            }
        });
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

        private View view;
        private ImageView imgFoto;
        private TextView txtEditoria;
        private TextView txtTitulo;

        NoticiaViewHolder(View itemView) {
            super(itemView);

            view = itemView;
            imgFoto = (ImageView) itemView.findViewById(R.id.imgFoto);
            txtEditoria = (TextView) itemView.findViewById(R.id.txtEditoria);
            txtTitulo = (TextView) itemView.findViewById(R.id.txtTitulo);
        }

        void setConteudo(Conteudo conteudo) {
            String urlImagem = ConteudoInfoHelper.getUrlImagem(conteudo);
            if (urlImagem != null)
                ImageHelper.loadImages(context, urlImagem, imgFoto);
            else
                imgFoto.setVisibility(View.GONE);
            txtEditoria.setText(ConteudoInfoHelper.getNomeSecao(conteudo));
            txtTitulo.setText(conteudo.getTitulo());
        }
    }

}