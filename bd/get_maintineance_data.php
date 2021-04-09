<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql = "SELECT * FROM controlmantenimiento";
$result = $conn->query($sql);

if($result){
    while($row = $result->fetch_assoc()) {
        $idControlMantenimiento = $row["idControlMantenimiento"];
        $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
        $fechaControlMantenimiento = $row["fechaControlMantenimiento"];
        $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];
        $observacion = $row["observacion"];
	    $idUsuario = $row["idUsuario"];
        $idDepartamento = $row["idDepartamento"];
        
            $response = array(
                'status' => 200,
                'idControlMantenimiento' => $idControlMantenimiento,
                'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                'fechaControlMantenimiento' => $fechaControlMantenimiento,
                'idEstadoControlMantenimiento' => $idEstadoControlMantenimiento,
                'observacion' => $observacion,
                'idUsuario' => $idUsuario,
                'idDepartamento' => $idDepartamento
            );
    
            array_push($data, $response);
            
    }
    
}else{
    $response = array(
        'status' => 500
    );

    array_push($data, $response);
}

echo json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion=null;