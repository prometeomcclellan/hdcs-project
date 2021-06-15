<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    $response = array();
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
            }

            $sqlSolicitud = "SELECT * FROM solicitudmantenimiento
            WHERE idSolicitudMantenimiento = '".$idSolicitudMantenimiento."'";
            $resultSolicitud = $conn->query($sqlSolicitud);

            while($rowSoli = $resultSolicitud->fetch_assoc()) {
                $fechaSolicitud = $rowSoli["fechaSolicitudMantenimiento"];
                $equipoCodSol = $rowSoli["codEquipo"];
            }

            $sqlEquipoSol = "SELECT * FROM equipo WHERE codEquipo =  '".$equipoCodSol."'";
                    $resultEquipoSol = $conn->query($sqlEquipoSol);
                    while($rowEquipoSol = $resultEquipoSol->fetch_assoc()) {
                        $elEquipoIdTipo = $rowEquipoSol["idTipoEquipo"];
                        $elEquipoIdModelo = $rowEquipoSol["idModelo"];
                        $elEquipoDescripcion = $rowEquipoSol["descripcionEquipo"];

                        $sqlEquipoTipo = "SELECT * FROM tipoequipo WHERE idTipoEquipo =  '".$elEquipoIdTipo."'";
                        $resultEquipoTipo = $conn->query($sqlEquipoTipo);
                        $rowEquipoTipo = $resultEquipoTipo->fetch_assoc();
                        $elEquipoTipo = $rowEquipoTipo["tipoEquipo"];

                        $sqlEquipoIdModelo = "SELECT * FROM modelo WHERE idModelo =  '".$elEquipoIdModelo."'";
                        $resultEquipoModelo = $conn->query($sqlEquipoIdModelo);
                        $rowEquipoModelo = $resultEquipoModelo->fetch_assoc();
                        $elEquipoModelo = $rowEquipoModelo["modelo"];
                        $elEquipoIdMarca = $rowEquipoModelo["idMarca"];

                        $sqlEquipoMarca = "SELECT * FROM marca WHERE idMarca =  '".$elEquipoIdMarca."'";
                        $resultEquipoMarca = $conn->query($sqlEquipoMarca);
                        $rowEquipoMarca = $resultEquipoMarca->fetch_assoc();
                        $elEquipoMarca = $rowEquipoMarca["marca"];
                        $elEquipo = $elEquipoTipo." ".$elEquipoMarca." ".$elEquipoModelo;

                        $sqlEstado = "SELECT * FROM estadocontrolmantenimiento
                        WHERE idEstadoControlMantenimiento = '".$idEstadoControlMantenimiento."'";
                        $resultEstado = $conn->query($sqlEstado);

                        while($rowStat = $resultEstado->fetch_assoc()) {
                            $estadoControlMantenimiento = $rowStat["estadoControlMantenimiento"];
                        }


                        $response = array(
                            'status' => 200,
                            'fechaControlMantenimiento' => $fechaControlMantenimiento,
                            'fechaSolicitudMantenimiento' => $fechaSolicitud,
                            'idUsuario' => $idUsuario,
                            'idTipoMantenimiento' => $idTipoMantenimiento,
                            'idControlMantenimiento' => $idControlMantenimiento,
                            'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                            'observacion' => $observacion,
                            'estadoControlMantenimiento' => $estadoControlMantenimiento,
                            'idDepartamento' => $idDepartamento,
                            'elEquipoIdTipo' => $elEquipoIdTipo,
                            'elEquipoIdModelo' => $elEquipoIdModelo,
                            'elEquipoDescripcion' => $elEquipoDescripcion,
                            'elEquipo' => $elEquipo,
                            'departamentoP' => $departamentoP
                            
                        );
                
                        array_push($data, $response);
                    }  

                
            

            
/*
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
             */
        }
        
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);