<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);
    $idControlMantenimiento = (isset($_POST['idControlMantenimiento'])) ? $_POST['idControlMantenimiento'] : '';

    $sql =  "UPDATE notificacion SET idEstadoNotificacion = 2, estadoNotificacion = 'read' WHERE idControlMantenimiento = '".$idControlMantenimiento."'";
    $result = $conn->query($sql);

    if($result){
        echo 1;
    }else{
        echo 0;
    }