<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $idU = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
    //$idU = 116;

    $sql = "SELECT * FROM solicitudmantenimiento 
    WHERE idUsuario = '".$idU."' 
    ORDER BY fechaSolicitudMantenimiento DESC 
    LIMIT 1";
    $result = $conn->query($sql);

    
    if ($result) {
        while($row = $result->fetch_assoc()) {
            $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
            $fechaSolicitudMantenimiento = $row["fechaSolicitudMantenimiento"];
            $response = array(
                'status' => 200,
                'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                'fechaSolicitudMantenimiento' => $fechaSolicitudMantenimiento
            );
                    
            array_push($data, $response);
        }
    }
    
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    $conexion=null;