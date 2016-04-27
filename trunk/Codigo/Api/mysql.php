<?php

class MySQL {

    private $conexion;
    private $archivo_config = "config.ini";
    private $parametros;

    public function MySQL() {
        if (!isset($this->conexion)) {
            $this->parametros = $this->parametrosDB();

            $this->conexion = (mysql_connect($this->parametros["host"], $this->parametros["usuario"], $this->parametros["contrasenia"])) or die(mysql_error());
            mysql_select_db($this->parametros["base"], $this->conexion) or die(mysql_error());
            mysql_query("SET NAMES 'utf8'");
            mysql_query("SET AUTOCOMMIT=0;", $this->conexion);
        }
    }

    private function parametrosDB() {
        $array_ini = parse_ini_file($this->archivo_config, true);
        return $array_ini["base_de_datos"];
    }

    public function consultaRegistroArray($query) {
        $datos = array();

        $result = mysql_query($query, $this->conexion);
        if (mysql_num_rows($result) == 1) {

            while ($arr = mysql_fetch_array($result, MYSQL_ASSOC)) {
                $datos[] = $arr;
            }
        }

        return($datos);
    }

    public function consultaArray($query) {
        $datos = array();

        $result = mysql_query($query, $this->conexion);
        if (mysql_num_rows($result) > 0) {

            while ($arr = mysql_fetch_array($result, MYSQL_ASSOC)) {
                $datos[] = $arr;
            }
        }
        return $datos;
    }

    public function realizarOperacion($query, $permitirCeroAfectados = false) {

        $result = mysql_query($query, $this->conexion) or onDieOperacion();
        if (!$permitirCeroAfectados) {
            if ($result && mysql_affected_rows() > 0) {
                return "exito_" . mysql_insert_id();
            } else {
                return "Error al realizar la operacion.";
            }
        } else {
            if ($result) {
                return "exito_" . mysql_insert_id();
            } else {
                return "Error al realizar la operacion.";
            }
        }
    }

    public function comenzarTransaccion() {
        $sql = "BEGIN;";
        $resultado = mysql_query($sql, $this->conexion);
        return $resultado;
    }

    public function finalizarTransaccion($resultado) {
        if ($resultado) {
            $sql = "COMMIT";
            $resultado = mysql_query($sql, $this->conexion);
        } else {
            $sql = "ROLLBACK;";
            $resultado = mysql_query($sql, $this->conexion);
        }

        return $resultado;
    }

}
