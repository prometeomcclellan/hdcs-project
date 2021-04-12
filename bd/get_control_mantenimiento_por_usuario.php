<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    $idU = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
    //$idU = 116;

    $sql = "SELECT * FROM controlmantenimiento
    WHERE idUsuario = '".$idU."'";
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;

    if ($result) {
        while($row = $result->fetch_assoc()) {

        }
    }

    $sqlNombre = "SELECT userName, codEmpleado FROM usuario
    WHERE idUsuario = '".$idU."'";
    $resultNombre = $conn->query($sqlNombre);

    //$s = "select * from `login` where login_date between '$from' and '$to'"
    

    if($resultNombre){
        
        while($rowNombres = $resultNombre->fetch_assoc()) {
            $userName = $rowNombres["userName"];
            $codEmpleado = $rowNombres["codEmpleado"];

            
            $sqlNombres = "SELECT * FROM empleado
            WHERE codEmpleado = '".$codEmpleado."'";
            $resultNombres = $conn->query($sqlNombres);
            if($resultNombres){
                while($rowNombresx = $resultNombres->fetch_assoc()) {
                    $nombre = $rowNombresx["nombres"];
                    $apellido = $rowNombresx["apellidos"];
                    $telefono = $rowNombresx["telefono"];
                    $celular = $rowNombresx["celular"];
                    $extension = $rowNombresx["extension"];
                    $idCargo = $rowNombresx["idCargo"];
                    $estado = $rowNombresx["estado"];
                    $nombreapellido = $nombre." ".$apellido;

                    $sqlAsign = "SELECT cargo FROM cargo
                    WHERE idCargo = '".$idCargo."'";
                    $resultAsign = $conn->query($sqlAsign);

                    if($resultAsign){
                        while($rowA = $resultAsign->fetch_assoc()) {
                            $cargo = $rowA["cargo"];
                            $response = array(
                                'status' => 200,
                                'telefono' => $telefono,
                                'celular' => $celular,
                                'extension' => $extension,
                                'idCargo' => $idCargo,
                                'cargo' => $cargo,
                                'estado' => $estado,
                                'row_cnt' => $row_cnt,
                                'nombre' => $nombre
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