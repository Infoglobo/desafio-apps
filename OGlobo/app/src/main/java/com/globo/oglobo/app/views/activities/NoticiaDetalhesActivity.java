package com.globo.oglobo.app.views.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.globo.oglobo.app.R;
import com.globo.oglobo.app.contracts.NoticiaDetalhesMVP;
import com.globo.oglobo.app.helpers.ImageHelper;
import com.globo.oglobo.app.pojo.Conteudo;
import com.globo.oglobo.app.presenters.NoticiaDetalhesPresenter;

public class NoticiaDetalhesActivity extends AppCompatActivity implements NoticiaDetalhesMVP.NoticiaDetalhesViewImpl {

    public final static String CONTEUDO = "conteudo";

    private Conteudo conteudo;

    private TextView txtEditoria, txtTitulo, txtSubTitulo, txtAutor, txtDataPublicacao, txtLegendaImagem, txtTexto;
    private ImageView imgFoto;
    private RelativeLayout lytImagem;

    private NoticiaDetalhesPresenter presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_noticia_detalhes);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);

        conteudo = (Conteudo) getIntent().getSerializableExtra(CONTEUDO);

        txtEditoria = (TextView) findViewById(R.id.txtEditoria);
        txtTitulo = (TextView) findViewById(R.id.txtTitulo);
        txtSubTitulo = (TextView) findViewById(R.id.txtSubTitulo);
        txtAutor = (TextView) findViewById(R.id.txtAutor);
        txtDataPublicacao = (TextView) findViewById(R.id.txtDataPublicacao);
        txtLegendaImagem = (TextView) findViewById(R.id.txtLegendaImagem);
        txtTexto = (TextView) findViewById(R.id.txtTexto);
        imgFoto = (ImageView) findViewById(R.id.imgFoto);
        lytImagem = (RelativeLayout) findViewById(R.id.lytImagem);

        presenter = new NoticiaDetalhesPresenter(this);
        presenter.preencherConteudo(conteudo);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home)
            supportFinishAfterTransition();
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void exibirEditoria(String editoria) {
        txtEditoria.setText(editoria);
    }

    @Override
    public void exibirTitulo(String titulo, int visibility) {
        txtTitulo.setText(titulo);
        txtTitulo.setVisibility(visibility);
    }

    @Override
    public void exibirSubTitulo(String subTitulo, int visibility) {
        txtSubTitulo.setText(subTitulo);
        txtSubTitulo.setVisibility(visibility);
    }

    @Override
    public void exibirAutor(String autor, int visibility) {
        txtAutor.setText(autor);
        txtAutor.setVisibility(visibility);
    }

    @Override
    public void exibirData(String data, int visibility) {
        txtDataPublicacao.setText(data);
        txtDataPublicacao.setVisibility(visibility);
    }

    @Override
    public void exibirLegenda(String legenda, int visibility) {
        txtLegendaImagem.setText(legenda);
        txtLegendaImagem.setVisibility(visibility);
    }

    @Override
    public void exibirTexto(String texto, int visibility) {
        txtTexto.setText(texto);
        txtTexto.setVisibility(visibility);
    }

    @Override
    public void exibirImagem(String imagem, int visibility) {
        ImageHelper.loadImages(this, imagem, imgFoto);
        lytImagem.setVisibility(visibility);
    }

}