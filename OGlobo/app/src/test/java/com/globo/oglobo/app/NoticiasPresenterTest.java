package com.globo.oglobo.app;

import com.globo.oglobo.app.contracts.NoticiasMVP;
import com.globo.oglobo.app.presenters.NoticiasPresenter;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

/**
 * Created by Andre on 17/07/17.
 */
@RunWith(MockitoJUnitRunner.class)
public class NoticiasPresenterTest {

    @Mock
    private NoticiasMVP.NoticiasViewImpl view;
    private NoticiasPresenter presenter;

    @Before
    public void setUp() throws Exception {
        presenter = new NoticiasPresenter(view);
    }

}