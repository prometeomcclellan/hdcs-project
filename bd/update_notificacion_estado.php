<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);
    $idControlMantenimiento = (isset($_POST['idControlMantenimiento'])) ? $_POST['idControlMantenimiento'] : '';

    $sql =  "UPDATE notificacion SET idEstadoNotificacion = 2, estadoNotificacion = 'read' WHERE idControlMantenimiento = '".$idControlMantenimiento."'";
    //$sql = "SELECT * FROM notificacion WHERE idEstadoNotificacion = 1 ORDER BY fechaNotificacion DESC";
    $result = $conn->query($sql);
    //$row_cnt = $result->num_rows;

    if($result){
        echo 1;
    }else{
        echo 0;
    }