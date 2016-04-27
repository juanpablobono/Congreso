package arquitecturasmoviles.basico.webservice;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.squareup.okhttp.OkHttpClient;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import arquitecturasmoviles.basico.model.Curso;
import arquitecturasmoviles.basico.model.Evento;
import arquitecturasmoviles.basico.util.Preferencias;
import arquitecturasmoviles.basico.webservice.pojo.CursosResponse;
import arquitecturasmoviles.basico.webservice.pojo.EventosResponse;
import arquitecturasmoviles.basico.webservice.pojo.GenericResponse;
import arquitecturasmoviles.basico.webservice.pojo.LoginResponse;
import retrofit.RestAdapter;
import retrofit.client.OkClient;
import retrofit.converter.GsonConverter;


public class ApiClient {

    private static String BASE_URL = "http://190.246.157.102/demos/congreso/trunk/Codigo/Api/";
    private ApiService apiService;
    private String mensaje;


    public ApiClient(){

        int minutes = 4 * 60;

        final OkHttpClient okHttpClient = new OkHttpClient();
        okHttpClient.setReadTimeout(minutes, TimeUnit.SECONDS);
        okHttpClient.setConnectTimeout(minutes, TimeUnit.SECONDS);

        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create();

        RestAdapter restAdapter = new RestAdapter.Builder()
                .setLogLevel(RestAdapter.LogLevel.FULL)
                .setEndpoint(BASE_URL)
                .setClient(new OkClient(okHttpClient))
                .setErrorHandler(new CustomErrorHandler())
                .setConverter(new GsonConverter(gson))
                .build();

        apiService = restAdapter.create(ApiService.class);
    }



    public boolean login(Context contexto, String email, String contrasenia){

        LoginResponse response = apiService.login(email, contrasenia);
        if(response.isError()){
            mensaje = response.getMensaje();
            return false;
        }else{
            Preferencias preferencias = new Preferencias(contexto);
            preferencias.setEmailUsuario(email);
            preferencias.setContraseniaUsuario(contrasenia);
            preferencias.setToken(response.getToken());
            return true;
        }
    }

    public boolean registro(String nombre, String apellido, String email, String contrasenia){
        GenericResponse response = apiService.registro(nombre, apellido, email, contrasenia);
        if(response.isError()){
            mensaje = response.getMensaje();
            return false;
        }else{
            return true;
        }
    }

    public ArrayList<Evento> obtenerEventos(){
        EventosResponse response = apiService.getEventos();
        return response.getEventos();
    }

    public ArrayList<Curso> obtenerCursos(){
        CursosResponse response = apiService.getCursos();
        return response.getCursos();
    }



    /*public ArrayList<CabeceraPedido> obtenerPedidosPendientes(Context context) throws RetrofitError {

        ArrayList<CabeceraPedido> temp = new ArrayList<>();
        VentasResponse response = apiService.getPedidosPendientes();

        if(response == null)
            return temp;
        else if(!response.isSuccess())
            return temp;
        else
            return response.getCabeceraPedidos();
    }


    public boolean descontarStock(Context context, long id, int stock) throws RetrofitError{
        GenericResponse genericResponse = apiService.descontarStock(id, stock);
        return genericResponse.isSuccess();
    }*/

    public String getMensaje(){
        return mensaje;
    }


}
