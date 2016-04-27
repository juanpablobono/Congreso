package arquitecturasmoviles.basico.activity;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import arquitecturasmoviles.basico.R;
import arquitecturasmoviles.basico.adapter.ListaEventosAdapter;
import arquitecturasmoviles.basico.dao.CursoDAO;
import arquitecturasmoviles.basico.dao.EventoDAO;
import arquitecturasmoviles.basico.model.Curso;
import arquitecturasmoviles.basico.model.Evento;
import arquitecturasmoviles.basico.webservice.ApiClient;

public class EventosActivity extends AppCompatActivity {

    private ListView lstEventos;
    private ListaEventosAdapter listaEventosAdapter;
    private List<Evento> eventos;

    private ProgressBar progressBar;
    private LinearLayout linearLayout;

    private EventoDAO eventoDAO = null;
    private CursoDAO cursoDAO = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_eventos);

        lstEventos = (ListView) findViewById(R.id.lst_eventos);
        progressBar = (ProgressBar) findViewById(R.id.progress);
        linearLayout = (LinearLayout) findViewById(R.id.vista_eventos);

        eventoDAO = new EventoDAO(getApplicationContext());
        cursoDAO = new CursoDAO(getApplicationContext());

        eventos = new ArrayList<>();


        listaEventosAdapter = new ListaEventosAdapter(eventos, this);
        lstEventos.setAdapter(listaEventosAdapter);

        lstEventos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int posicion, long l) {

                Evento eventoSeleccionado =
                        (Evento) listaEventosAdapter.getItem(posicion);
                Intent intent = new Intent(getApplicationContext(), CursosActivity.class);
                intent.putExtra("evento", eventoSeleccionado);
                startActivity(intent);
            }
        });

        mostrarProgress(true);
        SincronizarAsyncTask sincronizarAsyncTask = new SincronizarAsyncTask();
        sincronizarAsyncTask.execute();
    }

    private void mostrarProgress(boolean mostrar){
        progressBar.setVisibility(mostrar ? View.VISIBLE : View.GONE);
        linearLayout.setVisibility(mostrar ? View.GONE : View.VISIBLE);
    }

    /**
     * Tarea asíncrona encargada de obtener eventos y cursos.
     *
     */
    public class SincronizarAsyncTask extends AsyncTask<Void, Void, Boolean> {

        ApiClient apiClient = null;

        SincronizarAsyncTask() {}

        @Override
        protected Boolean doInBackground(Void... params) {
            apiClient = new ApiClient();

            eventoDAO.limpiarTabla();
            cursoDAO.limpiarTabla();

            ArrayList<Evento> eventos = apiClient.obtenerEventos();
            for(Evento evento : eventos){
                eventoDAO.insertar(evento);
            }

            ArrayList<Curso> cursos = apiClient.obtenerCursos();
            for(Curso curso : cursos){
                cursoDAO.insertar(curso);
            }

            return false;
        }

        @Override
        protected void onPostExecute(Boolean resultado) {
            mostrarProgress(false);
            eventos = eventoDAO.obtenerTodos();
            listaEventosAdapter.actualizarEventos(eventos);
        }

        @Override
        protected void onCancelled() {

        }
    }
}
