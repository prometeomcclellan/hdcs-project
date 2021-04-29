<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
require_once('conn.php');
$conn = new mysqli($servername, $username, $password, $dbname);
$data = array();

$hash = (isset($_POST['hash'])) ? $_POST['hash'] : '';

/*
   $sql = "SELECT * FROM accesos
   WHERE accessToken = '".$hash."'";
*/

   $sql =  "UPDATE accesos SET accesoEstado = 0 WHERE accessToken = '".$hash."'";
   $result = $conn->query($sql);
   if($result){
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

    echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conexion=null;