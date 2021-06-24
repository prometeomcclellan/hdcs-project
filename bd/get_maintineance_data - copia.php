<?php

    header('Content-Type: application/json');

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);
    $codEmpleado = "";
    $idDepartamento = 0;
    $departamentoP = "";
    $sql = "SELECT * FROM controlmantenimiento";
$result = $conn->query($sql);

//if($result){
    while($row = $result->fetch_assoc()) {
        $idControlMantenimiento = $row["idControlMantenimiento"];
        $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
        $fechaControlMantenimiento = $row["fechaControlMantenimiento"];
        $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];
        $observacion = $row["observacion"];
	    $idUsuario = $row["idUsuario"];

            $sqlEmpleado = "SELECT * FROM usuario WHERE idUsuario   = '".$idUsuario."'";
            $resultEmpleado = $conn->query($sqlEmpleado);

            while ( $rowEmpleado = $resultEmpleado ->fetch_assoc()) {
                $codEmpleado = $rowEmpleado["codEmpleado"];
                $sqlCargo = "SELECT * FROM empleado WHERE codEmpleado = '".$codEmpleado."'";
                $resulCargo = $conn->query($sqlCargo);

                while ( $rowCargo = $resulCargo ->fetch_assoc() ) {
                    $idCargo = $rowCargo["idCargo"];
                    $sqlIdCargo = "SELECT * FROM cargo WHERE idCargo = '".$idCargo."'";
                    $resultIdCargo = $conn->query($sqlIdCargo);

                    while ($rowIdCargo = $resultIdCargo ->fetch_assoc()) {
                        $idDepartamento = $rowIdCargo["idDepartamento"];

                        $response = array(
                            'status' => 200,
                            'idControlMantenimiento' => $idControlMantenimiento,
                            'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                            'fechaControlMantenimiento' => $fechaControlMantenimiento,
                            'idEstadoControlMantenimiento' => $idEstadoControlMantenimiento,
                            'observacion' => $observacion,
                            'idUsuario' => $idUsuario,
                            'idDepartamento' => $idDepartamento
                        );
    
                        array_push($data, $response);

                       
                    }

                }
            }        
            
            
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
/*}else{
    $response = array(
        'status' => 500
    );

    array_push($data, $response);
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
}*/


$conexion=null;