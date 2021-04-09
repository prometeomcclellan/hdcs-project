<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $cargo   = (isset($_POST['cargo'])) ? $_POST['cargo'] : '';
    $idDepartamento   = (isset($_POST['idDepartamento'])) ? $_POST['idDepartamento'] : '';


    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
    $id = (isset($_POST['id'])) ? $_POST['id'] : '';


//print(strval($opcion));
//echo $opcion;

    function buscarRepetido(string $cargo ,object $conexion): int {
            $consulta = "CALL sp_existeCargo(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $cargo);
            $resultado->execute(); 

            $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  == 1){
            $r= 1;// Existe, esta repetido
        }

        return $r;
    }

    $verificar = buscarRepetido($cargo, $conexion);
    $data = null;

    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarCargo(?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $cargo);
                $resultado->bindValue(2, $idDepartamento); 
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_actualizarCargo(?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $cargo);
                $resultado->bindValue(2, $idDepartamento); 
                $resultado->bindValue(3, $id); 
                $resultado->execute(); 

                $data = 0; 
            } 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarCargo(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $id, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarCargo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5:
            $consulta = "CALL sp_mostrarDepartamento()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>