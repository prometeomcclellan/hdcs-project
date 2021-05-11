<?php

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	require_once('conn.php');
	$conn = new mysqli($servername, $username, $password, $dbname);
	$data = array();

    $idDeUsuario = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
	$hash = (isset($_POST['hash'])) ? $_POST['hash'] : '';
  
/*
$sql = "SELECT * FROM accesos WHERE idUsuario = '".$idDeUsuario."' 
AND accesoEstado = 1 AND accessToken = '".$hash."'";
*/
$sql = "SELECT * FROM accesos WHERE idUsuario = '".$idDeUsuario."'
AND accesoEstado = 1 AND accessToken = '".$hash."'";
    
    $result = $conn->query($sql);
    $num_rows = mysqli_num_rows($result);
//echo $num_rows;

    if($num_rows > 0){
        $response = array(
            'status' => 200
        );
        array_push($data, $response);

        /*
        while($row = $result->fetch_assoc()) {
            $accessToken = $row["accessToken"];
            $accesoEstado = $row["accesoEstado"];
            
            $response = array(
                'status' => 200,
                'accessToken' => $accessToken,
                'accesoEstado' => $accesoEstado
            );
            array_push($data, $response);
        }
        */
        
    }else{
        $response = array(
            'status' => 500
        );
        array_push($data, $response);
    }
/**/
echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conexion=null;