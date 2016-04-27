package arquitecturasmoviles.basico.webservice.pojo;

import com.google.gson.annotations.SerializedName;

import org.parceler.Parcel;


@Parcel
public class LoginResponse {

    @SerializedName("error")
    protected boolean error;

    @SerializedName("mensaje")
    protected String mensaje;

    @SerializedName("token")
    protected String token;


    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
