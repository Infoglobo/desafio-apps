package com.globo.oglobo.app.views.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.globo.oglobo.app.R;
import com.globo.oglobo.app.contracts.NoticiasMVP;
import com.globo.oglobo.app.pojo.Conteudo;
import com.globo.oglobo.app.presenters.NoticiasPresenter;
import com.globo.oglobo.app.views.adapters.NoticiasAdapter;

import java.util.ArrayList;
import java.util.List;

public class NoticiasActivity extends AppCompatActivity implements NoticiasMVP.NoticiasViewImpl {

    protected static final String STATE_CONTEUDOS = "conteudos";

    private RecyclerView rvNoticias;
    private NoticiasAdapter adapter;
    private NoticiasPresenter presenter;

    private List<Conteudo> conteudos = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_noticias);

        rvNoticias = (RecyclerView) findViewById(R.id.rvNoticias);
        rvNoticias.setHasFixedSize(true);
        rvNoticias.setLayoutManager(new LinearLayoutManager(this));

        adapter = new NoticiasAdapter(this, conteudos);
        rvNoticias.setAdapter(adapter);

        if (presenter == null)
            presenter = new NoticiasPresenter(this);

        if (savedInstanceState != null) {
            List<Conteudo> conteudoArrayList = (ArrayList<Conteudo>) savedInstanceState.getSerializable(STATE_CONTEUDOS);
            if (conteudoArrayList != null && conteudoArrayList.size() > 0) {
                conteudos.addAll(conteudoArrayList);
            }
        } else {
            presenter.buscarNoticias();
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);

        ArrayList<Conteudo> conteudos = new ArrayList<>();
        conteudos.addAll(this.conteudos);
        outState.putSerializable(STATE_CONTEUDOS, conteudos);
    }

    @Override
    public void onSuccess(List<Conteudo> conteudos) {
        this.conteudos.addAll(conteudos);
        adapter.updateConteudos(conteudos);
    }

    @Override
    public void onFailed() {

    }

    @Override
    public void exibirProgressBar(int visibility) {
        findViewById(R.id.includeProgressBar).setVisibility(visibility);
    }

}