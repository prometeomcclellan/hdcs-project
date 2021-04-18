<?php

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	require_once('conn.php');
	$conn = new mysqli($servername, $username, $password, $dbname);
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

	//echo $resultado->rowCount();

	if($resultado->rowCount() > 0){
		foreach($dataX as $dat) {     
			$nombreEmpleado = $dat["empleado"]; 
			$idUsuario = $dat["idUsuario"];     
			$codEmpleado = $dat["codEmpleado"];
			$estado = $dat["estado"];

			$sqlCargo = "SELECT * FROM empleado
            WHERE codEmpleado = '".$codEmpleado."'";
			$resultCargo = $conn->query($sqlCargo);
            if($resultCargo){
			  while($rowCargo = $resultCargo->fetch_assoc()) {
				$idCargo = $rowCargo["idCargo"];
				
				$sqlCargoN = "SELECT * FROM cargo
				WHERE idCargo = '".$idCargo."'";
				$resultCargoN = $conn->query($sqlCargoN);
				
				if($resultCargoN){
					$rowCargoN = $resultCargoN->fetch_assoc();
					$cargo = $rowCargoN["cargo"];

					$estado = intval($estado);

					$_SESSION["s_usuario"] = $usuario; // variables de sesión
					$_SESSION["s_idUsuario"] = $idUsuario; 
					$_SESSION["s_estadoUsuario"] = $estado; 
					$_SESSION["s_codEmpleado"] = $codEmpleado;
					$_SESSION["s_cargo"] = $cargo;
					$dataX = $nombreEmpleado;

					$response = array(
						'status' => 200,
						'nombreEmpleado' => $nombreEmpleado,
						'idUsuario' => $idUsuario,
						'codEmpleado' => $codEmpleado,
						'cargo' => $cargo,
						'estado' => $estado
					);
					array_push($data, $response);
				}
			  }
			}

			
	
			setcookie('usuario_cookie', $idUsuario,  $sessionTime);
		}
	}else{
			$_SESSION["s_usuario"] = null;
			   $_SESSION["s_idUsuario"] = null; 
			$_SESSION["s_estadoUsuario"] = null; 
			$_SESSION["s_codEmpleado"] = null;
			$_SESSION["s_cargo"] = null;
			
			$response = array(
				'status' => 500
			);
	
			array_push($data, $response);
	}

echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conexion=null;

/**/
