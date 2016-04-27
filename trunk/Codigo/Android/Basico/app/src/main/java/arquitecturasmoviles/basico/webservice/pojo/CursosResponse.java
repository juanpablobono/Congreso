package arquitecturasmoviles.basico.webservice.pojo;


import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;

import arquitecturasmoviles.basico.model.Curso;

public class CursosResponse {

    @SerializedName("cursos")
    private ArrayList<Curso> cursos;

    public ArrayList<Curso> getCursos(){
        return cursos;
    }
}
