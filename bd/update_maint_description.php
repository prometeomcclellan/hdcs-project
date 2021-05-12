<?php

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	require_once('conn.php');
	$conn = new mysqli($servername, $username, $password, $dbname);
	$data = array();

	$descripcion = (isset($_POST['descripcion'])) ? $_POST['descripcion'] : '';
    $idControlMantenimiento = (isset($_POST['idControlMantenimiento'])) ? $_POST['idControlMantenimiento'] : '';

    $sql2 = "SELECT * FROM controlmantenimiento WHERE idControlMantenimiento = '".$idControlMantenimiento."'";
            $result2 = $conn->query($sql2);
            if($result2){
                while($row = $result2->fetch_assoc()) {
                    $idSolicitudMantenimiento = $row["idSolicitudMantenimiento"];
                    $sql2b = "SELECT * FROM solicitudmantenimiento WHERE idSolicitudMantenimiento = '".$idSolicitudMantenimiento."'";
                    $result2b = $conn->query($sql2b);
                    if($result2b){
                        while($row2 = $result2b->fetch_assoc()) {
                            $codEquipo = $row2["codEquipo"];
                            $sql3 = "UPDATE equipo SET descripcionEquipo = '".$descripcion."' WHERE codEquipo = '".$codEquipo."'";
                            $result3 = $conn->query($sql3);
                            if($result3){
                                $response = array(
                                'status' => 200
                                );
                                array_push($data, $response);
                            }else{
                                $response = array(
                                    'status' => 500
                                );
                                array_push($data, $response);
                            }

                            echo json_encode($data, JSON_UNESCAPED_UNICODE);
                            $conexion=null;
                            
                        }
                    }
                }
            }