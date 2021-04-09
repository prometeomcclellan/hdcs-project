<?php

    session_start(); //variable de sesión para el usuario
    $usuario = intval($_SESSION["s_idUsuario"]);


    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $idControlGarantia   = (isset($_POST['idControlGarantia'])) ? $_POST['idControlGarantia'] : '';
    $codEquipo   = (isset($_POST['codEquipo'])) ? $_POST['codEquipo'] : '';                      // YA
    $fechaInicio   = (isset($_POST['fechaInicio'])) ? $_POST['fechaInicio'] : '';                //YA
    $fechaVencimiento   = (isset($_POST['fechaVencimiento'])) ? $_POST['fechaVencimiento'] : '';  //YA
    $estado   = (isset($_POST['estado'])) ? $_POST['estado'] : '';
    $select_Empresa   = (isset($_POST['select_Empresa'])) ? $_POST['select_Empresa'] : '';  //YA
    $telefono   = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
    $eMail   = (isset($_POST['eMail'])) ? $_POST['eMail'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;

    function buscarRepetidoControl(string $codEquipo, object $conexion): int {
        $consulta = "CALL sp_existeControlGarantia(?)";         
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
    $verificarCodEquipo = buscarRepetidoControl($codEquipo,  $conexion);



    $data = null;
    switch($opcion){
        case 1:
            if($verificarCodEquipo >= 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarControlGarantia(?, ?, ?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEquipo);
                $resultado->bindValue(2, $fechaInicio); 
                $resultado->bindValue(3, $fechaVencimiento);
                $resultado->bindValue(4, $select_Empresa);
                $resultado->bindValue(5, $telefono);
                $resultado->bindValue(6, $eMail);
                $resultado->bindValue(7, $usuario);
                $resultado->execute(); 

                $data = 0;
            }   
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarControlGarantia(?, ?, ?, ?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $idControlGarantia);
                $resultado->bindValue(2, $codEquipo); 
                $resultado->bindValue(3, $fechaInicio); 
                $resultado->bindValue(4, $fechaVencimiento); 
                $resultado->bindValue(5, $estado); 
                $resultado->bindValue(6, $select_Empresa); 
                $resultado->bindValue(7, $telefono); 
                $resultado->bindValue(8, $eMail); 
                $resultado->bindValue(9, $usuario); 

                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarControlGarantia(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idControlGarantia, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarControlGarantia()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;



        case 6:
            $consulta = "CALL sp_mostrarEmpresaGarantia()";
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