<?php

    session_start(); //variable de sesión para el usuario
    $usuario = intval($_SESSION["s_idUsuario"]);


    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();    

    $idControlMant   = (isset($_POST['idControlMant'])) ? $_POST['idControlMant'] : '';
    $fechaControl   = (isset($_POST['fechaControl'])) ? $_POST['fechaControl'] : '';
    //$selectEmpleado   = (isset($_POST['selectEmpleado'])) ? $_POST['selectEmpleado'] : '';
    $selectTipoMant   = (isset($_POST['selectTipoMant'])) ? $_POST['selectTipoMant'] : '';
    $selectIdSolMant   = (isset($_POST['selectIdSolMant'])) ? $_POST['selectIdSolMant'] : '';
    $observacion   = (isset($_POST['observacion'])) ? $_POST['observacion'] : '';
    $estadoContronMant   = (isset($_POST['estadoContronMant'])) ? $_POST['estadoContronMant'] : '';      
    $select_Usuario   = (isset($_POST['select_Usuario'])) ? $_POST['select_Usuario'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;


    function buscarRepetidoSolMant(string $selectIdSolMant, object $conexion): int {
        $consulta = "CALL sp_existeIdSolMant(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $selectIdSolMant);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $estado = 0;
        if($cantidad  >= 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }
    $verificarIdSolMant = buscarRepetidoSolMant($selectIdSolMant,  $conexion);


    $data = null;
    switch($opcion){
        case 1:
            if($verificarIdSolMant >= 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarControlMantenimiento (?, ?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $fechaControl);
                $resultado->bindValue(2, $select_Usuario); //Usando la variable de sesion del usuario
                $resultado->bindValue(3, $selectTipoMant);
                $resultado->bindValue(4, $selectIdSolMant);
                $resultado->bindValue(5, $observacion);
                $resultado->bindValue(6, $estadoContronMant);
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarControlMantenimiento(?, ?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $idControlMant);
                $resultado->bindValue(2, $fechaControl); 
                $resultado->bindValue(3, $select_Usuario); 
                $resultado->bindValue(4, $selectTipoMant); 
                $resultado->bindValue(5, $selectIdSolMant); 
                $resultado->bindValue(6, $observacion); 
                $resultado->bindValue(7, $estadoContronMant); 
                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarControlMantenimiento(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idControlMant, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarControlMantenimiento()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;



        case 6:
            $consulta = "CALL sp_mostrarTipoMantenimiento()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 7:
            $consulta = "CALL sp_mostrarSolicitudMControl()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 8:
            $consulta = "CALL sp_mostrarEstadoControlMantenimiento()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break; 
        case 9:    
            $consulta = "CALL sp_mostrarSolicitudMControl()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;  
        case 10:
            $consulta = "CALL sp_mostrarEquipo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break; 
        case 11:
            $consulta = "CALL sp_mostrarUsuario()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;    
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>