<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
    $elEquipo = ""; $elUsuario = "";
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql = "SELECT * FROM notificacion WHERE idEstadoNotificacion = 1 ORDER BY fechaNotificacion DESC";
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;

    if($result){
        while($row = $result->fetch_assoc()) {
            $idControlMantenimiento = $row["idControlMantenimiento"];
            $fechaNotificacion = $row["fechaNotificacion"];
            $estadoNotificacion = $row["estadoNotificacion"];

            $sqlSol = "SELECT * FROM solicitudmantenimiento WHERE idSolicitudMantenimiento =  '".$idControlMantenimiento."'";
            $resultSol = $conn->query($sqlSol);
            $row_cntSol = $resultSol->num_rows;

            if($resultSol){
                while($rowSol = $resultSol->fetch_assoc()) {
                    
                    $equipoCodSol = $rowSol["codEquipo"];
                    $preDiagnostico = $rowSol["preDiagnostico"];
                    $idUsuario = $rowSol["idUsuario"];

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

                        $sqlUsuario = "SELECT * FROM usuario WHERE idUsuario =  '".$idUsuario."'";
                        $resultUsuario = $conn->query($sqlUsuario);
                        $rowUsuario = $resultUsuario->fetch_assoc();
                        $elUsuarioCode = $rowUsuario["codEmpleado"];

                        $sqlNombre = "SELECT * FROM empleado WHERE codEmpleado =  '".$elUsuarioCode."'";
                        $resultNombre = $conn->query($sqlNombre);
                        $rowNombre = $resultNombre->fetch_assoc();
                        $elUsuarioNombre = $rowNombre["nombres"];
                        $elUsuarioApellido = $rowNombre["apellidos"];
                        $elUsuario = $elUsuarioNombre." ".$elUsuarioApellido;

                        $response = array(
                            'status' => 200,
                            'idControlMantenimiento' => $idControlMantenimiento,
                            'fechaNotificacion' => $fechaNotificacion,
                            'estadoNotificacion' => $estadoNotificacion,
                            'preDiagnostico' => $preDiagnostico,
                            'elEquipoIdTipo' => $elEquipoIdTipo,
                            'elEquipoIdModelo' => $elEquipoIdModelo,
                            'elEquipoDescripcion' => $elEquipoDescripcion,
                            'elEquipo' => $elEquipo,
                            'elUsuario' => $elUsuario,
                            'row_cnt' => $row_cnt
                        );
                        array_push($data, $response);
                    }                    
                }
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }
    