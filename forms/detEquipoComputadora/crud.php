<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $codEquipo   = (isset($_POST['codEquipo'])) ? $_POST['codEquipo'] : '';
    $select_TipoRam   = (isset($_POST['select_TipoRam'])) ? $_POST['select_TipoRam'] : '';
    $select_CapacidadRam   = (isset($_POST['select_CapacidadRam'])) ? $_POST['select_CapacidadRam'] : '';
    $select_VelocidadRam   = (isset($_POST['select_VelocidadRam'])) ? $_POST['select_VelocidadRam'] : '';
    $select_TipoDisco   = (isset($_POST['select_TipoDisco'])) ? $_POST['select_TipoDisco'] : '';
    $select_CapacidadDisco   = (isset($_POST['select_CapacidadDisco'])) ? $_POST['select_CapacidadDisco'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';



    //print(strval($opcion));
    //echo $opcion;

    function buscarRepetido(string $codEquipo,object $conexion): int {
            $consulta = "CALL sp_existeDetCodigoEquipo(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $codEquipo);
            $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  == 1){
            $r= 1;// Existe, esta repetido
        }

        return $r;
    }

    $verificar = buscarRepetido($codEquipo,  $conexion);
    $data = null;



    $data = null;
    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarDetalleEquipoC(?, ?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEquipo);
                $resultado->bindValue(2, $select_TipoRam); 
                $resultado->bindValue(3, $select_CapacidadRam);
                $resultado->bindValue(4, $select_VelocidadRam);
                $resultado->bindValue(5, $select_TipoDisco);
                $resultado->bindValue(6, $select_CapacidadDisco);
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarDetalleEquipoC(?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEquipo);
                $resultado->bindValue(2, $select_TipoRam); 
                $resultado->bindValue(3, $select_CapacidadRam); 
                $resultado->bindValue(4, $select_VelocidadRam); 
                $resultado->bindValue(5, $select_TipoDisco); 
                $resultado->bindValue(6, $select_CapacidadDisco); 
                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarDetalleEquipoC(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $codEquipo, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarDetalleEquipoC()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5:
            $consulta = "CALL sp_mostrarEquipo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 6:
            $consulta = "CALL sp_mostrarTipoRam()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 7:
            $consulta = "CALL sp_mostrarCapacidad()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 8:
            $consulta = "CALL sp_mostrarVelocidadRam()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 9:
            $consulta = "CALL sp_mostrarTipoDisco()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>