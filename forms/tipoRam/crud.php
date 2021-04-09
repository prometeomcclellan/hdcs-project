<?php
    include_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $tipoRam   = (isset($_POST['tipoRam'])) ? $_POST['tipoRam'] : '';


    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
    $id = (isset($_POST['id'])) ? $_POST['id'] : '';


    function buscarRepetido(string $tipoRam, object $conexion): int {
            $consulta = "CALL sp_existeTipoRam(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $tipoRam);
            $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  >= 1){
            $r= 1;// Existe, esta repetido
        }
        return $r;
    }

    $verificar = buscarRepetido($tipoRam,  $conexion);
    $data = null;



    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarTipoRam(?)";         
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $tipoRam);
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
            if($verificar == 1){
                $data = 1; 
            }
            else{
                $consulta = "CALL sp_actualizarTipoRam(?, ?)";   
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $id);
                $resultado->bindValue(2, $tipoRam);
                $resultado->execute(); 

                $data = 0; 
            } 
            break;        
        case 3:        
            $consulta = "CALL sp_eliminarTipoRam(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $id, PDO::PARAM_INT);
            $resultado->execute();                             
            break;
        case 4:    
            $consulta = "CALL sp_mostrarTipoRam()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

print json_encode($data);//envio el array final el formato json a AJAX
$conexion=null;