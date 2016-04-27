package arquitecturasmoviles.basico.webservice.pojo;

import com.google.gson.annotations.SerializedName;

import org.parceler.Parcel;

@Parcel
public class GenericResponse {

    @SerializedName("error")
    protected boolean error;

    @SerializedName("mensaje")
    protected String mensaje;

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
}
