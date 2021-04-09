<?php

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();

	
	$sessionTime = 365 * 24 * 60 * 60; // 1 año de duración
	session_set_cookie_params($sessionTime, '/', 'localhost.com');
	session_start();

	//print_r($conexion);   probamos si esta bien la conexión con la base de datos.

	//recepción de datos enviados mediante POST desde ajax
	$usuario = (isset($_POST['usuario'])) ? $_POST['usuario'] : '';
	$password = (isset($_POST['password'])) ? $_POST['password'] : '';

	$pass = md5($password); //encripto la clave enviada por el usuario para compararla con la clava encriptada y almacenada en la BD

    $consulta = "CALL sp_verificarUsuario(?, ?) ";        
    $resultado = $conexion->prepare($consulta);
    $resultado->bindValue(1, $usuario);
    $resultado->bindValue(2, $pass); 
    $resultado->execute();
    $dataX = $resultado->fetchAll(PDO::FETCH_ASSOC);

    foreach($dataX as $dat) {     
	    $nombreEmpleado = $dat["empleado"]; 
	    $idUsuario = $dat["idUsuario"];     
	    $codEmpleado = $dat["codEmpleado"];
	    $estado = $dat["estado"];

	    $estado = intval($estado);

		$response = array(
			'status' => 200,
			'nombreEmpleado' => $nombreEmpleado,
			'idUsuario' => $idUsuario,
			'codEmpleado' => $codEmpleado,
			'estado' => $estado
		);

		array_push($data, $response);
    } 

    //$dataX =null;
    if($resultado->rowCount() > 0){

		$_SESSION["s_usuario"] = $usuario; // variables de sesión
		$_SESSION["s_idUsuario"] = $idUsuario; 
		$_SESSION["s_estadoUsuario"] = $estado; 
		$_SESSION["s_codEmpleado"] = $codEmpleado;
		//$_SESSION["s_fotoUsuario"] = $fotoUsuario;
		$dataX = $nombreEmpleado;

		setcookie('usuario_cookie', $idUsuario,  $sessionTime);
    }else{
	    $_SESSION["s_usuario"] = null;
	   	$_SESSION["s_idUsuario"] = null; 
	    $_SESSION["s_estadoUsuario"] = null; 
	    $_SESSION["s_codEmpleado"] = null;
		//$_SESSION["s_fotoUsuario"] = null;
		
		$response = array(
			'status' => 500
		);

		array_push($data, $response);
	}

//print json_encode($data);
echo json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion=null;

/**/
