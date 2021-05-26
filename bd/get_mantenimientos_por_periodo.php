<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);
    
    $from=date('Y-m-d',strtotime($_POST['from']));
    $to=date('Y-m-d',strtotime($_POST['to']));

    $sql = "SELECT * FROM controlmantenimiento
    WHERE fechaControlMantenimiento  BETWEEN '".$from."' AND '".$to."'";
    
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;

    //echo $row_cnt;
    if ($row_cnt == 0) {
        $response = array(
			'status' => 500,
			'row_cnt' => $row_cnt
		);

        array_push($data, $response);
    }else{
        while($row = $result->fetch_assoc()) {
            $fechaControlMantenimiento = $row["fechaControlMantenimiento"];
            $idUsuario = $row["idUsuario"];
            $idTipoMantenimiento = $row["idTipoMantenimiento"];
            $idControlMantenimiento = $row["idControlMantenimiento"];
            $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
            $observacion = $row["observacion"];
            $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];
            $idDepartamento = $row["idDepartamento"];

            $sqlDept = "SELECT * FROM departamento
            WHERE idDepartamento = '".$idDepartamento."'";
            $resultDepto = $conn->query($sqlDept);

            while($rowDepto = $resultDepto->fetch_assoc()) {
                $departamentoP = $rowDepto["departamento"];
            

            $sqlNombres = "SELECT * FROM usuario
            WHERE idUsuario = '".$idUsuario."'";
            $resultNombres = $conn->query($sqlNombres);
            if($resultNombres){
                while($rowNombresx = $resultNombres->fetch_assoc()) {
                    $nombre = $rowNombresx["userName"];
                    
                    $sqlEquipoC = "SELECT * FROM asignacionequipo
                    WHERE idUsuario = '".$idUsuario."'";
                    $resultEquipoC = $conn->query($sqlEquipoC);
                    if($resultEquipoC){
                        while($rowEquipoC = $resultEquipoC->fetch_assoc()) {
                            $codEquipoC = $rowEquipoC["codEquipo"];

                            $sqlEquipo = "SELECT * FROM equipo
                            WHERE codEquipo = '".$codEquipoC."'";
                            $resultEquipo = $conn->query($sqlEquipo);

                            if($resultEquipo){
                                while($rowEquipo = $resultEquipo->fetch_assoc()) {
                                    $descripcionEquipo = $rowEquipo["descripcionEquipo"];
                                    
                                    $sqlEstado = "SELECT * FROM estadocontrolmantenimiento
                                    WHERE idEstadoControlMantenimiento = '".$idEstadoControlMantenimiento."'";
                                    $resultEstado = $conn->query($sqlEstado);
                                    
                                    if($resultEstado){
                                        while($rowEstado = $resultEstado->fetch_assoc()) {
                                            $estadoControlMantenimiento = $rowEstado["estadoControlMantenimiento"];
                                            
                                            $sqlSolicitud = "SELECT * FROM solicitudmantenimiento
                                            WHERE idUsuario = '".$idUsuario."'";
                                            $resultSolicitud = $conn->query($sqlSolicitud);
                                            
                                            if($resultSolicitud){
                                                while($rowSolicitud = $resultSolicitud->fetch_assoc()) {
                                                    $fechaSolicitudMantenimiento = $rowSolicitud["fechaSolicitudMantenimiento"];
                                                    if($row_cnt > 0){
                                                        $response = array(
                                                            'status' => 200,
                                                            'fechaControlMantenimiento' => $fechaControlMantenimiento,
                                                            'idUsuario' => $idUsuario,
                                                            'idTipoMantenimiento' => $idTipoMantenimiento,
                                                            'idControlMantenimiento' => $idControlMantenimiento,
                                                            'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                                                            'observacion' => $observacion,
                                                            'idEstadoControlMantenimiento' => $idEstadoControlMantenimiento,
                                                            'descripcionEquipo' => $descripcionEquipo,
                                                            'estadoControlMantenimiento' => $estadoControlMantenimiento,
                                                            'fechaSolicitudMantenimiento' => $fechaSolicitudMantenimiento,
                                                            'departamentoP' => $departamentoP,
                                                            'nombre' => $nombre
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
                                                
                                            }
                                        }
                                    }else{
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            } 
            }
             
        }
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);