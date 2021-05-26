<?php

    session_start();
    $usuario = intval($_SESSION["s_idUsuario"]);

    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();


    $idSM   = (isset($_POST['idSM'])) ? $_POST['idSM'] : '';
    $fechaSM   = (isset($_POST['fechaSM'])) ? $_POST['fechaSM'] : '';
    $selectEquipo   = (isset($_POST['selectEquipo'])) ? $_POST['selectEquipo'] : '';
    $preDiag   = (isset($_POST['preDiag'])) ? $_POST['preDiag'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;
    $data = null;
    switch($opcion){
        case 1:
                $consulta = "CALL sp_insertarSolicitudM(?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $fechaSM);
                $resultado->bindValue(2, $selectEquipo); 
                $resultado->bindValue(3, $preDiag);
                $resultado->bindValue(4, $usuario);
                $resultado->execute(); 

                $data = 0; 
            break;    
        case 4:
            $consulta = "CALL sp_mostrarSolicitudM(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $usuario);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
            /*    
            $consulta = "CALL sp_mostrarSolicitudMRegistro(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $usuario);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
            */
        case 5:
            $consulta = "CALL sp_mostrarEquipoSolicitud(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $usuario);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;  
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>