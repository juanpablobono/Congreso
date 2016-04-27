package arquitecturasmoviles.basico.model;

import com.google.gson.annotations.SerializedName;

import org.parceler.Parcel;

import java.text.SimpleDateFormat;
import java.util.Date;

@Parcel
public class Curso {

    @SerializedName("id")
    protected long id;

    @SerializedName("nombre")
    protected String nombre;

    @SerializedName("dia_hora")
    private Date fecha;

    @SerializedName("descripcion")
    private String descripcion;

    @SerializedName("duracion")
    private short duracion;

    @SerializedName("disertante")
    private String disertante;

    @SerializedName("evento_id")
    private long eventoId;


    private boolean asistir;

    public Curso(long id, String nombre, Date fecha, String descripcion, short duracion, String disertante) {
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.disertante = disertante;
    }

    public Curso(){}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDia(String patron) {
        SimpleDateFormat sdf = new SimpleDateFormat(patron);
        return sdf.format(fecha);
    }

    public String getHora(String patron) {
        SimpleDateFormat sdf = new SimpleDateFormat(patron);
        return sdf.format(fecha);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public short getDuracion() {
        return duracion;
    }

    public void setDuracion(short duracion) {
        this.duracion = duracion;
    }

    public String getDisertante() {
        return disertante;
    }

    public void setDisertante(String disertante) {
        this.disertante = disertante;
    }

    public void registrarme(){
        this.asistir = true;
    }

    public void noRegistrarme(){
        this.asistir = true;
    }

    public boolean estoyRegistrado(){
        return asistir;
    }

    public void setAsistir(boolean asistir){
        this.asistir = asistir;
    }

    public Date getFecha() {
        return fecha;
    }

    public long getFechaMS(){
        return fecha.getTime();
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public long getEventoId() {
        return eventoId;
    }

    public void setEventoId(long eventoId) {
        this.eventoId = eventoId;
    }
}
