package arquitecturasmoviles.basico.webservice.pojo;

import com.google.gson.annotations.SerializedName;

import org.parceler.Parcel;

import java.util.ArrayList;

import arquitecturasmoviles.basico.model.Evento;

@Parcel
public class EventosResponse {

    @SerializedName("eventos")
    private ArrayList<Evento> eventos;

    public ArrayList<Evento> getEventos(){
        return eventos;
    }

}
