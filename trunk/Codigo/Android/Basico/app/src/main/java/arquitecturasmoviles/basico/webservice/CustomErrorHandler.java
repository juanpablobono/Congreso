package arquitecturasmoviles.basico.webservice;

import android.util.Log;

import retrofit.ErrorHandler;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class CustomErrorHandler implements ErrorHandler {
    @Override
    public Throwable handleError(RetrofitError cause) {
        Response r = cause.getResponse();
        if (r != null) {
            Log.v("REQUEST", "HUBO UN ERROR EN UN REQUEST: " + r.getStatus());

            //return new Exception();
        }
        return cause;
    }
}