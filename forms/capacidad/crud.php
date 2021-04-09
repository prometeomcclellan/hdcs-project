<?php
include_once '../../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$capacidad   = (isset($_POST['capacidad'])) ? $_POST['capacidad'] : '';


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['id'])) ? $_POST['id'] : '';



    function buscarRepetido(string $capacidad, object $conexion): int {
            $consulta = "CALL sp_existeCapacidad(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(1, $capacidad);
            $resultado->execute();

            $cantidad = $resultado->fetchColumn();

        $estado = 0;
        if($cantidad  == 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }

    $verificar = buscarRepetido($capacidad,  $conexion);
    $data = null;

switch($opcion){
    case 1:

        if($verificar == 1){
            $data = 1;
        }
        else{
            $consulta = "CALL sp_insertarCapacidad(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $capacidad);
            $resultado->execute(); 

            $data = 0; 
        } 
        break;    
    case 2: 
        if($verificar == 1){
            $data = 1; 
        }
        else{
            $consulta = "CALL sp_actualizarCapacidad(?, ?)";   
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $id);
            $resultado->bindValue(2, $capacidad);
            $resultado->execute(); 

            $data = 0; 
        } 
        break;            
    case 3:        
        $consulta = "CALL sp_eliminarCapacidad(?) ";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $id, PDO::PARAM_INT);
        $resultado->execute();                      
        break;
    case 4:    
        $consulta = "CALL sp_mostrarCapacidad()";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data);//envio el array final el formato json a AJAX
$conexion=null;
?>