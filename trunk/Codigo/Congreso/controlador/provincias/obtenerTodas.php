<?php
    $camposGET = array();
    $camposPOST = array();

    /*
     * SCRIPT REQUERIDOS 
     */	
    require_once("../validacionCampos.php");   
    require_once('../../conexionBD.php');
    /*
     * ESTABLECER CONSULTA
     */
    $query = "
            SELECT 	
                p.id AS DT_RowId,
                p.nombre,
                CONCAT(pa.id,' - ',pa.nombre) AS pais
            FROM			
                provincia AS p INNER JOIN pais AS pa ON
                p.pais_id = pa.id";

    exit(realizarConsulta($query, $conexionbd, "aaData"));
?>