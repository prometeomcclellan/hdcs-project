<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

    $idUsuario = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
    $codEmpleado   = (isset($_POST['codEmpleado'])) ? $_POST['codEmpleado'] : '';
    $fechaCreacion  = (isset($_POST['fechaCreacion'])) ? $_POST['fechaCreacion'] : '';
    $userName  = (isset($_POST['userName'])) ? $_POST['userName'] : '';
    $pss  = (isset($_POST['password'])) ? $_POST['password'] : '';
    $fechaBaja  = (isset($_POST['fechaBaja'])) ? $_POST['fechaBaja'] : '';
    $estado1  = (isset($_POST['estado'])) ? $_POST['estado'] : '';
   
    $estado = intval($estado1);

    $password = MD5($pss);

    //print($fechaBaja);

    function buscarRepetido(string $userName, object $conexion): int {
            $consulta = "CALL sp_existeUsuario(?)";         
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(1, $userName);
            $resultado->execute();

            $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $r = 0;
        if($cantidad  == 1){
            $r= 1;// Existe, esta repetido
        }

        return $r;
    }

    $verificar = buscarRepetido($userName,  $conexion);
    $data = null;

    switch($opcion){
        case 1:
            if($verificar == 1){
                $data = 1;
            }
            else{
                $consulta = "CALL sp_insertarUsuario(?, ?, ?, ?)";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEmpleado);
                $resultado->bindValue(2, $fechaCreacion); 
                $resultado->bindValue(3, $userName);
                $resultado->bindValue(4, $password);
                //$resultado->bindValue(5, $fechaBaja);
                $resultado->execute(); 

                $data = 0;
            } 
            break;    
        case 2: 

                $consulta = "CALL sp_actualizarUsuario(?, ?, ?, ?, ?)";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $idUsuario); 
                $resultado->bindValue(2, $userName); 
                $resultado->bindValue(3, $password); 
                $resultado->bindValue(4, $fechaBaja); 
                $resultado->bindValue(5, $estado); 
                $resultado->execute(); 

                $data = 0; 
            
            break;            
        case 3:        
            $consulta = "CALL sp_eliminarUsuario(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $idUsuario, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarUsuario()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 5://Select
            $consulta = "CALL sp_mostrarEmpleado1()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>


