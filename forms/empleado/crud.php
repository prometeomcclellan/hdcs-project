<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $codEmpleado   = (isset($_POST['codEmpleado'])) ? $_POST['codEmpleado'] : '';
    $nombres   = (isset($_POST['nombres'])) ? $_POST['nombres'] : '';
    $apellidos   = (isset($_POST['apellidos'])) ? $_POST['apellidos'] : '';
    $telefono   = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
    $celular   = (isset($_POST['celular'])) ? $_POST['celular'] : '';
    $extension   = (isset($_POST['extension'])) ? $_POST['extension'] : '';
    $select_Sexo   = (isset($_POST['select_Sexo'])) ? $_POST['select_Sexo'] : '';
    $select_Cargo   = (isset($_POST['select_Cargo'])) ? $_POST['select_Cargo'] : '';
    $eMail   = (isset($_POST['eMail'])) ? $_POST['eMail'] : '';
    $estado   = (isset($_POST['estado'])) ? $_POST['estado'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
    
    $estado = intval($estado);
//print(strval($opcion));
//echo $opcion;

    function buscarRepetido(string $codEmpleado,object $conexion): int {
            $consulta = "CALL sp_existeEmpleado(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $codEmpleado);
            $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  == 1){
            $r= 1;// Existe, esta repetido
        }

        return $r;
    }

    $verificar = buscarRepetido($codEmpleado,  $conexion);



    function buscarRepetidoUsuario(string $codEmpleado,object $conexion): int {
            $consulta = "CALL sp_existeEmpleadoUsuario(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $codEmpleado);
            $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  == 1){
            $r= 1;// Existe, esta repetido
        }

        return $r;
    }

    $verificarUsuario = buscarRepetidoUsuario($codEmpleado,  $conexion);



    $data = null;

    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarEmpleado(?, ?, ?, ?, ?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEmpleado);
                $resultado->bindValue(2, $nombres); 
                $resultado->bindValue(3, $apellidos);
                $resultado->bindValue(4, $telefono);
                $resultado->bindValue(5, $celular);
                $resultado->bindValue(6, $extension);
                $resultado->bindValue(7, $select_Sexo);
                $resultado->bindValue(8, $select_Cargo);
                $resultado->bindValue(9, $eMail);
                $resultado->execute(); 

                $data = 0;
            }  
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarEmpleado(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEmpleado);
                $resultado->bindValue(2, $nombres); 
                $resultado->bindValue(3, $apellidos); 
                $resultado->bindValue(4, $telefono); 
                $resultado->bindValue(5, $celular); 
                $resultado->bindValue(6, $extension); 
                $resultado->bindValue(7, $select_Sexo); 
                $resultado->bindValue(8, $select_Cargo); 
                $resultado->bindValue(9, $eMail); 
                $resultado->bindValue(10, $estado); 
                $resultado->execute(); 

                $data = 0; 
            break;            
        case 3:   
            if($verificarUsuario == 1){
                $data = 1;
            }
            else{     
                $consulta = "CALL sp_eliminarEmpleado(?) ";
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEmpleado, PDO::PARAM_INT);
                $resultado->execute();   

                $data = 0;
            }                         
            break;
        case 4:    
            $consulta = "CALL sp_mostrarEmpleado()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5:
            $consulta = "CALL sp_mostrarCargo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 6:
            $consulta = "CALL sp_mostrarSexo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>