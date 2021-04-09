<?php


header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
	
    require_once('conn.php');
    
    
    $data = array();

	$user_id = $_POST['userId'];
	$passW = $_POST['uNames'];
	
	
	$conn = new mysqli($servername, $username, $password, $dbname);
	
	if(!$conn->set_charset("utf8")){
    printf("Error cargando el conjunto de caracteres utf8: %\n", $conn->error);
    exit();
    }

	
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	

    //$sql =  "UPDATE usuario SET UsuarioPassword = AES_ENCRYPT('".$passW."', 'somos-educacion.') WHERE UsuarioId = '".$user_id."'";
	$sql =  "UPDATE usuario SET UsuarioPassword = '".$passW."' WHERE UsuarioId = '".$user_id."'";
	$result = $conn->query($sql);
	
	if ($result) {
        $response = array(
			'status' => 200,
			'userId' => $user_id,
			'message' => "Se actualizo la contrasena con exito"
		);
		array_push($data, $response);
	} else {
		$response = array(
			"status" => 500,
			'message' => "Error!"
		);
		array_push($data, $response);
	}
    
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
	
/**/

?>