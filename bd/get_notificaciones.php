<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql = "SELECT * FROM notificacion WHERE idEstadoNotificacion = 1 ORDER BY fechaNotificacion DESC";
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;

    if($result){
        while($row = $result->fetch_assoc()) {
            $idControlMantenimiento = $row["idControlMantenimiento"];
            $fechaNotificacion = $row["fechaNotificacion"];
            $estadoNotificacion = $row["estadoNotificacion"];

            $response = array(
                'status' => 200,
                'idControlMantenimiento' => $idControlMantenimiento,
                'fechaNotificacion' => $fechaNotificacion,
                'estadoNotificacion' => $estadoNotificacion,
                'row_cnt' => $row_cnt
            );
            array_push($data, $response);
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }
    