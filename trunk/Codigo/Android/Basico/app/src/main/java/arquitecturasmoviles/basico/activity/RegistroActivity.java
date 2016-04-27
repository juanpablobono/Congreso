package arquitecturasmoviles.basico.activity;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import arquitecturasmoviles.basico.R;
import arquitecturasmoviles.basico.util.Preferencias;
import arquitecturasmoviles.basico.webservice.ApiClient;

public class RegistroActivity extends AppCompatActivity {

    private EditText edtNombre;
    private EditText edtApellido;
    private EditText edtEmail;
    private EditText edtContrasenia;
    private EditText edtConfirmacionContrasenia;
    private Button btnRegistrarse;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        edtNombre = (EditText) findViewById(R.id.edt_registro_nombre);
        edtApellido = (EditText) findViewById(R.id.edt_registro_apellido);
        edtEmail = (EditText) findViewById(R.id.edt_registro_correo_electronico);
        edtContrasenia = (EditText) findViewById(R.id.edt_registro_contrasenia);
        edtConfirmacionContrasenia = (EditText) findViewById(R.id.edt_registro_repita_contrasenia);
        btnRegistrarse = (Button) findViewById(R.id.btn_registro_registrarse);

        btnRegistrarse.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String nombre = edtNombre.getText().toString();
                String apellido = edtApellido.getText().toString();
                String email = edtEmail.getText().toString();
                String contrasenia = edtContrasenia.getText().toString();
                String confirmacionContrasenia = edtConfirmacionContrasenia.getText().toString();

                if(inputsValidos(nombre, apellido, email, contrasenia, confirmacionContrasenia)){
                    btnRegistrarse.setEnabled(false);
                    RegistroAsyncTask registroAsyncTask = new RegistroAsyncTask(getApplicationContext(), nombre, apellido, email, contrasenia);
                    registroAsyncTask.execute();
                }
            }
        });

    }

    private boolean inputsValidos(String nombre, String apellido, String email, String contrasenia, String confirmacionContrasenia){

        if(TextUtils.isEmpty(nombre)){
            edtNombre.requestFocus();
            edtNombre.setError("Nombre requerido");
            return false;
        }

        if(TextUtils.isEmpty(apellido)){
            edtApellido.requestFocus();
            edtApellido.setError("Apellido requerido");
            return false;
        }

        if(TextUtils.isEmpty(email)){
            edtEmail.requestFocus();
            edtEmail.setError("Correo electrónico requerido");
            return false;
        }

        if(TextUtils.isEmpty(contrasenia)){
            edtContrasenia.requestFocus();
            edtContrasenia.setError("Contraseña requerido");
            return false;
        }

        if(TextUtils.isEmpty(confirmacionContrasenia) || !confirmacionContrasenia.equals(contrasenia)){
            edtConfirmacionContrasenia.requestFocus();
            edtConfirmacionContrasenia.setError("Las contraseñas no coinciden");
            return false;
        }

        return true;
    }


    /**
     * Tarea asíncrona encargada de realizar registrar el usuario contra la api.
     *
     */
    public class RegistroAsyncTask extends AsyncTask<Void, Void, Integer> {

        private String nombre;
        private String apellido;
        private String email;
        private String contrasenia;
        private Context contexto;

        ApiClient apiClient = null;

        RegistroAsyncTask(Context contexto, String nombre, String apellido, String email, String contrasenia) {
            this.contexto = contexto;
            this.nombre = nombre;
            this.apellido = apellido;
            this.email = email;
            this.contrasenia = contrasenia;
        }

        @Override
        protected Integer doInBackground(Void... params) {
            apiClient = new ApiClient();

            if(apiClient.registro(nombre, apellido, email, contrasenia)){
                if(apiClient.login(contexto, email, contrasenia)){
                    return Preferencias.LOGIN_OK;
                }else{
                    return Preferencias.LOGIN_ERROR;
                }
            }
            return Preferencias.REGISTRO_ERROR;
        }

        @Override
        protected void onPostExecute(Integer resultado) {

            switch (resultado){
                case Preferencias.REGISTRO_ERROR:
                    btnRegistrarse.setEnabled(true);
                    Toast.makeText(getApplicationContext(), apiClient.getMensaje(), Toast.LENGTH_LONG).show();
                    break;
                case Preferencias.LOGIN_OK:
                    Intent intent = new Intent(getApplicationContext(), EventosActivity.class);
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(intent);
                    break;
                case Preferencias.LOGIN_ERROR:
                    Intent intentLogin = new Intent(getApplicationContext(), LoginActivity.class);
                    intentLogin.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(intentLogin);
                    break;
            }
        }

        @Override
        protected void onCancelled() {}
    }
}
