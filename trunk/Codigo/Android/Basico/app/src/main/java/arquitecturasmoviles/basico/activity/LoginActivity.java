package arquitecturasmoviles.basico.activity;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import arquitecturasmoviles.basico.R;
import arquitecturasmoviles.basico.webservice.ApiClient;
import arquitecturasmoviles.basico.webservice.ApiService;

public class LoginActivity extends AppCompatActivity {

    private TextView txtViewRegistro;
    private Button btnIngresar;
    private EditText edtEmail;
    private EditText edtContrasenia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        txtViewRegistro = (TextView) findViewById(R.id.txt_login_registro);
        btnIngresar = (Button) findViewById(R.id.btn_login_ingresar);
        edtEmail = (EditText) findViewById(R.id.edt_login_correo_electronico);
        edtContrasenia = (EditText) findViewById(R.id.edt_login_contrasenia);

        txtViewRegistro.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                LoginActivity.this.startActivity(new Intent(LoginActivity.this, RegistroActivity.class));
            }
        });

        btnIngresar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String email = edtEmail.getText().toString();
                String contrasenia = edtContrasenia.getText().toString();

                View focusView = null;

                if(TextUtils.isEmpty(email)){
                    edtEmail.setError("Correo electrónico requerido");
                    edtEmail.requestFocus();
                    return;
                }

                if(TextUtils.isEmpty(contrasenia)){
                    edtContrasenia.setError("Contraseña requerida");
                    edtContrasenia.requestFocus();
                    return;
                }

                btnIngresar.setEnabled(false);
                LoginAsyncTask loginAsyncTask = new LoginAsyncTask(email, contrasenia);
                loginAsyncTask.execute();
            }
        });

    }

    /**
     * Tarea asíncrona encargada de realizar el login contra la api.
     *
     */
    public class LoginAsyncTask extends AsyncTask<Void, Void, Boolean> {

        private String email;
        private String contrasenia;
        private boolean loginExitoso = false;

        ApiClient apiClient = null;

        LoginAsyncTask(String email, String contrasenia) {
            this.email = email;
            this.contrasenia = contrasenia;
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            apiClient = new ApiClient();

            if(apiClient.login(getApplicationContext(), email, contrasenia)){
                return true;
            }

            return false;
        }

        @Override
        protected void onPostExecute(Boolean resultado) {

            if(resultado){
                Intent intent = new Intent(getApplicationContext(), EventosActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }else{
                btnIngresar.setEnabled(true);
                Toast.makeText(getApplicationContext(), apiClient.getMensaje(), Toast.LENGTH_LONG).show();
            }

        }

        @Override
        protected void onCancelled() {

        }
    }

}
