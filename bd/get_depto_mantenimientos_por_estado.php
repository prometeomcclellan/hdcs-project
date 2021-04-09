<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $idDepto = (isset($_POST['deptoId'])) ? $_POST['deptoId'] : '';

    $sql = "SELECT * FROM controlmantenimiento
    WHERE idDepartamento = '".$idDepto."'";
    
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;
    $d_count = 0;
    $p_count = 0;
    $f_count = 0;

    if($result){
        while($row = $result->fetch_assoc()) {
            $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];
            if($idEstadoControlMantenimiento == "1"){$d_count++;}
            if($idEstadoControlMantenimiento == "2"){$p_count++;}
            if($idEstadoControlMantenimiento == "3"){$f_count++;}
        }
        $response = array(
            'status' => 200,
            'd_count' => $d_count,
            'p_count' => $p_count,
            'f_count' => $f_count,
            'row_cnt' => $row_cnt
        );
        array_push($data, $response);
    }

    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    $conexion=null;