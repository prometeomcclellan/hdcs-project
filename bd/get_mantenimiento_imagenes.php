<?php
include_once 'conexion.php';
$conn = new mysqli("localhost", "root", "", "hdcs");
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$data = array();

$sql = "SELECT * FROM equipoimagenes";
$result = $conn->query($sql);

if($result){

    while($row = $result->fetch_assoc()) {
        $fotoUrl = $row["imagenEquipoUrl"];
        $fotoId = $row["idEquipoImagen"];
        $fotoMantenimientoId = $row["idControlMantenimiento"];
        $response = array(
			'status' => 200,
			'fotoUrl' => $fotoUrl,
            'fotoId' => $fotoId,
			'fotoMantenimientoId' => $fotoMantenimientoId
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