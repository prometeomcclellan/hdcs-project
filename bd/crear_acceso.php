<?php

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	require_once('conn.php');
	$conn = new mysqli($servername, $username, $password, $dbname);
	$data = array();

    $idDeUsuario = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
	$accessUrl = (isset($_POST['accessUrl'])) ? $_POST['accessUrl'] : '';
    $usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
	$password = (isset($_POST['password'])) ? $_POST['password'] : '';
    $fechaAcceso = (isset($_POST['fechaAcceso'])) ? $_POST['fechaAcceso'] : '';

    $keyWord = $usuario.$password.strval($idDeUsuario).strval($fechaAcceso);
    $hash = password_hash($keyWord, PASSWORD_DEFAULT);

    $sql = "INSERT INTO accesos (idUsuario, accessToken, accessUrl, accesosFecha, accesoEstado)
    VALUES ('".$idDeUsuario."', '".$hash."', '".$accessUrl."', '".$fechaAcceso."', 1)";
    $result = $conn->query($sql);
    if($result){
        //echo $hash;
        $response = array(
            'status' => 200,
            'hash' => $hash
        );
        array_push($data, $response);
        //while($row = $result->fetch_assoc()) {}
    }else{
        $response = array(
            'status' => 500,
            'hash' => ""
        );
        array_push($data, $response);
    }

echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conexion=null;

    //echo $hash;