<?php
include_once 'conexion.php';
$conn = new mysqli("localhost", "root", "", "hdcs");
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$data = array();

$source = (isset($_POST['source'])) ? $_POST['source'] : '';
$imageName = (isset($_POST['imageName'])) ? $_POST['imageName'] : '';
$identificador = (isset($_POST['identificador'])) ? $_POST['identificador'] : '';

if (file_exists($source)) {
    $sql = "DELETE FROM equipoimagenes WHERE idEquipoImagen ='".$identificador."'";
    $result = $conn->query($sql);
    if($result){
        unlink($source);
        $response = array(
            'status' => 200
        );
    
        array_push($data, $response);
    }else{
        $response = array(
            'status' => 500
        );
    
        array_push($data, $response);
    }
    
  } else {
    $response = array(
        'status' => 500
    );

    array_push($data, $response);
  }



echo json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion=null;