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
    $idUs = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';

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
        case 2: 
                $consulta = "CALL sp_actualizarSolicitudM(?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $fechaSM);
                $resultado->bindValue(2, $selectEquipo); 
                $resultado->bindValue(3, $preDiag); 
                $resultado->bindValue(4, $idSM); 
                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarSolicitudM(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idSM, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarSolicitudM(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $usuario);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5:
            $consulta = "CALL sp_mostrarEquipoSolicitud(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $usuario);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;  
        case 6:
            $consulta = "CALL sp_mostrarEquipoSolicitud(?)";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idUs);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>