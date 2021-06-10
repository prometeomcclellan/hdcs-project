<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);
    $idControlMantenimiento = (isset($_POST['idControlMantenimiento'])) ? $_POST['idControlMantenimiento'] : '';
    $fechaNotificacion = (isset($_POST['fechaNotificacion'])) ? $_POST['fechaNotificacion'] : '';

    $sql = "INSERT INTO notificacion (idControlMantenimiento, idEstadoNotificacion, estadoNotificacion, fechaNotificacion)
    VALUES ('".$idControlMantenimiento."', 1, 'unread', '".$fechaNotificacion."')";
    $result = $conn->query($sql);

    if($result){
        echo 1;
    }else{
        echo 0;
    }