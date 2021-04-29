<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
require_once('conn.php');
$conn = new mysqli($servername, $username, $password, $dbname);
$data = array();

$hash = (isset($_POST['hash'])) ? $_POST['hash'] : '';

   $sql = "SELECT * FROM accesos
   WHERE accessToken = '".$hash."'";
   $result = $conn->query($sql);
   if($result){
       
       while($row = $result->fetch_assoc()) {
           $estadoSesion = $row["accesoEstado"];

           if ($estadoSesion == 1) {
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
       }
    }else{
        $response = array(
            'status' => 500,
            'estado' => null
           );
           array_push($data, $response);
    }

    echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conexion=null;