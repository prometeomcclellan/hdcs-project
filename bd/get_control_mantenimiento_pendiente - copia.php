<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');


    $conn = new mysqli($servername, $username, $password, $dbname);

    $codEmpleado = "";
    $idDepartamento = "";
    $departamentoP = "DEGT";

    $sql = "SELECT * FROM controlmantenimiento WHERE idEstadoControlMantenimiento < 3 ORDER BY idDepartamento";
    $result = $conn->query($sql);

    if($result){
        
        while($row = $result->fetch_assoc()) {
            $fechaControlMantenimiento = $row["fechaControlMantenimiento"];
            $idUsuario = $row["idUsuario"];
            $idTipoMantenimiento = $row["idTipoMantenimiento"];
            $idControlMantenimiento = $row["idControlMantenimiento"];
            $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
            $observacion = $row["observacion"];
            $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];


          /*  $sqlEmpleado = "SELECT * FROM usuario WHERE idUsuario   = '".$idUsuario."'";
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
                        $sqlDept = "SELECT * FROM departamento
                        WHERE idDepartamento = '".$idDepartamento."'";
                        $resultDepto = $conn->query($sqlDept);

                        while($rowDepto = $resultDepto->fetch_assoc()) {
                            $departamentoP = $rowDepto["departamento"];
                        }
                    }

                }
            }*/

            

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
                            'elEquipoIdTipo' => $elEquipoIdTipo,
                            'elEquipoIdModelo' => $elEquipoIdModelo,
                            'elEquipoDescripcion' => $elEquipoDescripcion,
                            'elEquipo' => $elEquipo,
                            'departamentoP' => $departamentoP
                        );
                        array_push($data, $response);
                    }

           


        }
        
    }
    
                                        
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    //$conexion=null;
    