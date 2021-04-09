<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $idBitacoraMant   = (isset($_POST['idBitacoraMant'])) ? $_POST['idBitacoraMant'] : '';
    $fechaCambioEstado   = (isset($_POST['fechaCambioEstado'])) ? $_POST['fechaCambioEstado'] : '';
    $selectSolicitudMant   = (isset($_POST['selectSolicitudMant'])) ? $_POST['selectSolicitudMant'] : '';
    $selectEstadoControlMant   = (isset($_POST['selectEstadoControlMant'])) ? $_POST['selectEstadoControlMant'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;

    $data = null;
    switch($opcion){
        case 1:
                $consulta = "CALL sp_insertarBitacoraMantenimiento(?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $fechaCambioEstado);
                $resultado->bindValue(2, $selectSolicitudMant); 
                $resultado->bindValue(3, $selectEstadoControlMant);
                $resultado->execute(); 

                $data = 0;  
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarBitacoraMantenimiento (?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $idBitacoraMant);
                $resultado->bindValue(2, $fechaCambioEstado); 
                $resultado->bindValue(3, $selectSolicitudMant); 
                $resultado->bindValue(4, $selectEstadoControlMant);  
                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarBitacoraMantenimiento (?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idBitacoraMant, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarBitacoraMantenimiento()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;



        case 5:
            $consulta = "CALL sp_mostrarSolicitudM()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 6:
            $consulta = "CALL sp_mostrarEstadoControlMant()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>