<?php
	function validarPatente($patente, $conexionbd){
		$query = "
                    SELECT 	
                        p.id
                    FROM			
                        producto AS p
                    WHERE
                        p.patente = '$patente'";
				
		$result = mysql_query($query, $conexionbd);
		
		$datos = array();
			
		if(mysql_num_rows($result) == 1){
			
			while($arr = mysql_fetch_array($result, MYSQL_ASSOC)){			
				$datos[] = $arr;
			}
		}	
		
		return $datos;
	}	
?>