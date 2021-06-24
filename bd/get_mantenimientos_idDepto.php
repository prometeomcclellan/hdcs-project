<?php

include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    //$idDepto = (isset($_POST['deptoIdPie'])) ? $_POST['deptoIdPie'] : '';

    $idDepto = 9;
    $idDepartamentoN = 0;
    $idEstadoControlMantenimiento = "";
    $row_cnt = 0;
    $d_count = 0;
    $p_count = 0;
    $f_count = 0;

    $hasWork = false;

    //echo $idDepto.", ".$idDepto+1;

    $sql = "SELECT * FROM controlmantenimiento";

    $result = $conn->query($sql);

    if($result){
        while($row = $result->fetch_assoc()) {
            
            $idUsuario = $row["idUsuario"];
            $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];

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
                        $idDepartamentoN = intval($idDepartamento);
                        if ((intval($idDepartamentoN)-intval($idDepto)) == 0) {
                            $row_cnt++;
                            $response = array(
                                'status' => 200,
                                'idEstadoControlMantenimiento' => $idEstadoControlMantenimiento,
                                'idDepartamento' => $idDepartamentoN,
                                'row_cnt' => $row_cnt
                            );
                            array_push($data, $response);
                        }
                        
                    }
                }
            }
        }

        
        
    }

    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    $conexion=null;
