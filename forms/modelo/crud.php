<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $idModelo = (isset($_POST['idModelo'])) ? $_POST['idModelo'] : '';
    $modelo   = (isset($_POST['modelo'])) ? $_POST['modelo'] : '';
    $idMarca  = (isset($_POST['marca'])) ? $_POST['marca'] : '';


    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;

    function buscarRepetido(string $modelo ,object $conexion): int {
        $consulta = "CALL sp_existeModelo(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $modelo);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  >= 1){
            $r= 1;// Existe, esta repetido
        }
        return $r;
    }

    $verificar = buscarRepetido($modelo,  $conexion);
    $data = null;



    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarModelo(?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $modelo);
                $resultado->bindValue(2, $idMarca); 
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
            if($verificar == 1){
                $data = 1; 
            }
            else{
                $consulta = "CALL sp_actualizarModelo(?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $modelo);
                $resultado->bindValue(2, $idMarca); 
                $resultado->bindValue(3, $idModelo); 
                $resultado->execute(); 

                $data = 0; 
            } 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarModelo(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idModelo, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarModelo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5://Select
            $consulta = "CALL sp_mostrarMarca()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>