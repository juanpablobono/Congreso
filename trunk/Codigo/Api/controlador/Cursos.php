<?php

class ControladorCursos {
    
    /**
     * Devuelve todos los cursos del sistema
     *
     * @url GET /cursos/todos
     */
    public function todos() {
        $db = new MySQL();
        $query = "
            SELECT  
                c.id, 
                c.nombre,
                c.descripcion,
                c.dia_hora,
                c.Duracion,
                c.Eventos_idEvento
            FROM            
                cursos as c ";
        $cursos = $db->consultaArray($query);

        return array("cursos" => $cursos);
    }
    
}
