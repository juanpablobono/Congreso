package arquitecturasmoviles.basico.model;


import com.google.gson.annotations.SerializedName;

import org.parceler.Parcel;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Parcel
public class Evento implements Serializable{

    @SerializedName("id")
    protected long id;

    @SerializedName("nombre")
    protected String nombre;

    @SerializedName("descripcion")
    private String descripcion;

    @SerializedName("fecha_inicio")
    private Date inicio;

    @SerializedName("fecha_fin")
    private Date fin;

    @SerializedName("lugar")
    private String lugar;
    private List<Curso> cursos;

    public Evento(long id, String nombre, String descripcion, Date fechaInicio, Date fechaFin, String lugar, List<Curso> cursos){
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.inicio = fechaInicio;
        this.fin = fechaFin;
        this.lugar = lugar;
        this.cursos = cursos;
    }

    public Evento(){}

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

    public List<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date fechaInicio) {
        this.inicio = fechaInicio;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fechaFin) {
        this.fin = fechaFin;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getFechaInicio(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(inicio);
    }

    public long getFechaInicioMS(){
        return inicio.getTime();
    }

    public String getFechaFin(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(fin);
    }

    public long getFechaFinMS(){
        return fin.getTime();
    }

    public String getFechaInicioPorPatron(String patron){
        SimpleDateFormat sdf = new SimpleDateFormat(patron);
        return sdf.format(inicio);
    }

    public String getFechaFinPorPatron(String patron){
        SimpleDateFormat sdf = new SimpleDateFormat(patron);
        return sdf.format(fin);
    }
}
