<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $idDepto = (isset($_POST['deptoId'])) ? $_POST['deptoId'] : '';

    //$idDepto = 9;
    $idDepartamentoN = 0;
    $estadoControlMantenimiento = "";
    $fechaSolicitudMantenimiento;
    $equipoCodSol; $elEquipoDescripcion;
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
            $idControlMantenimiento = $row["idControlMantenimiento"];
            $idEstadoControlMantenimiento = $row["idEstadoControlMantenimiento"];
            $tituloControlmantenimiento = $row["tituloControlmantenimiento"];
            $fechaControlMantenimiento = $row["fechaControlMantenimiento"];
            $idTipoMantenimiento = $row["idTipoMantenimiento"];
            $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
            $observacion = $row["observacion"];

            

            $sqlSolicitudControl = "SELECT * FROM solicitudmantenimiento WHERE idSolicitudMantenimiento   = '".$idSolicitudMantenimiento."'";
            $resultSolicitud = $conn->query($sqlSolicitudControl);
            // estadoControlMantenimiento
            while ( $rowSolicitud = $resultSolicitud ->fetch_assoc()) {
                $fechaSolicitudMantenimiento = $rowSolicitud["fechaSolicitudMantenimiento"];
                $equipoCodSol = $rowSolicitud["codEquipo"];
            }

            $sqlEquipoSol = "SELECT * FROM equipo WHERE codEquipo =  '".$equipoCodSol."'";
            $resultEquipoSol = $conn->query($sqlEquipoSol);

            while($rowEquipoSol = $resultEquipoSol->fetch_assoc()) {
                $elEquipoIdTipo = $rowEquipoSol["idTipoEquipo"];
                $elEquipoIdModelo = $rowEquipoSol["idModelo"];
                $elEquipoDescripcion = $rowEquipoSol["descripcionEquipo"];
            }
            

            $sqlEstadoControl = "SELECT * FROM estadocontrolmantenimiento WHERE idEstadoControlMantenimiento   = '".$idEstadoControlMantenimiento."'";
            $resultEC = $conn->query($sqlEstadoControl);
            // estadoControlMantenimiento
            while ( $rowEC = $resultEC ->fetch_assoc()) {
                $estadoControlMantenimiento = $rowEC["estadoControlMantenimiento"];
            }
            
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
                        if ((intval($idDepartamentoN)-$idDepto) == 0) {

                            $response = array(
                                'status' => 200,
                                'idUsuario' => $idUsuario,
                                'idControlMantenimiento' => $idControlMantenimiento,
                                'estadoControlMantenimiento' => $estadoControlMantenimiento,
                                'tituloControlmantenimiento' => $tituloControlmantenimiento,
                                'fechaControlMantenimiento' => $fechaControlMantenimiento,
                                'fechaSolicitudMantenimiento' => $fechaSolicitudMantenimiento,
                                'idTipoMantenimiento' => $idTipoMantenimiento,
                                'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
                                'observacion' => $observacion,
                                'descripcion' => $elEquipoDescripcion,
                                'idDepartamento' => $idDepartamento,
                                'idCargo' => $idCargo
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
    