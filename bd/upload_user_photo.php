<?php

header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
	
require_once('conn.php');
    
    $data = array();
    $path = '../inicio/dist/img/';


   

	$conn = new mysqli($servername, $username, $password, $dbname);
	
	if(!$conn->set_charset("utf8")){
    printf("Error cargando el conjunto de caracteres utf8: %\n", $conn->error);
    exit();
    }

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
    }

    if (isset($_FILES['file'])) {
    
        $userId = $_POST['userId'];
        $codeB64 = $_POST['file'];
        $data = array();
        
        $errors= array();
        $file_name = $_FILES['file']['name'];
        $file_size =$_FILES['file']['size'];
        $file_tmp =$_FILES['file']['tmp_name'];
        $file_type=$_FILES['file']['type'];
        $file_ext=strtolower(end(explode('.',$_FILES['file']['name'])));
        
        $extensions= array("jpeg","jpg","png");
      
        if(in_array($file_ext,$extensions)=== false){
           $errors[]="extension not allowed, please choose a JPEG or PNG file.";
        }
      
        if($file_size > 2097152){
           $errors[]='File size must be excately 2 MB';
        }
        
        if(empty($errors)==true){
           move_uploaded_file($file_tmp, $path.$file_name);
           
           $imageUrl = $path.$file_name;
           $sql = "UPDATE usuario SET fotoUsuario = '".$imageUrl."'
			WHERE idUsuario = '".$userId."'";
			$result = $conn->query($sql);
           
            $response = array(
                'status' => 200,
                'image_url' => $path.$file_name,
                'message' => "Yeah"
            );
    
            array_push($data, $response);
           //echo "Success";
        }else{
           //print_r($errors);
           
            $response = array(
                'status' => 200,
                'image_name' => $file_name,
                'message' => "Yeah"
            );
    
            array_push($data, $response);
        }

        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }
/* */
?>
