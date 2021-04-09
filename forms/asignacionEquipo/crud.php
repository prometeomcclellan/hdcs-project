<?php

    session_start(); //variable de sesión para el usuario
    //$usuario = intval($_SESSION["s_idUsuario"]);


    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();


    $idAsignacionEquipo   = (isset($_POST['idAsignacionEquipo'])) ? $_POST['idAsignacionEquipo'] : '';
    $fechaAsignacion   = (isset($_POST['fechaAsignacion'])) ? $_POST['fechaAsignacion'] : '';                      
    $codEquipo   = (isset($_POST['codEquipo'])) ? $_POST['codEquipo'] : '';                
    $Observacion   = (isset($_POST['Observacion'])) ? $_POST['Observacion'] : '';  
    $fechaBaja   = (isset($_POST['fechaBaja'])) ? $_POST['fechaBaja'] : '';

    $estado   = (isset($_POST['estado'])) ? $_POST['estado'] : '';
    $idUsuario   = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;


    function buscarRepetidoEquipo(string $codEquipo, object $conexion): int {
        $consulta = "CALL sp_existeCodEquipo(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $codEquipo);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $estado = 0;
        if($cantidad  >= 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }
    $verificarCodEquipo = buscarRepetidoEquipo($codEquipo,  $conexion);


    $data = null;
    switch($opcion){
        case 1:
            if($verificarCodEquipo >= 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarAsignacionEquipo(?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $fechaAsignacion);
                $resultado->bindValue(2, $codEquipo); 
                $resultado->bindValue(3, $Observacion);
                $resultado->bindValue(4, $fechaBaja);
                $resultado->bindValue(5, $idUsuario);
                $resultado->execute(); 

                $data = 0;  
            } 
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarAsignacionEquipo(?, ?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $idAsignacionEquipo);
                $resultado->bindValue(2, $fechaAsignacion); 
                $resultado->bindValue(3, $codEquipo); 
                $resultado->bindValue(4, $Observacion); 
                $resultado->bindValue(5, $fechaBaja); 
                $resultado->bindValue(6, $estado); 
                $resultado->bindValue(7, $idUsuario); 

                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarAsignacionEquipo(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idAsignacionEquipo, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarAsignacionEquipo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5:
            $consulta = "CALL sp_mostrarUsuario()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;

        case 10:
            $consulta = "CALL sp_mostrarEquipo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;     
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>