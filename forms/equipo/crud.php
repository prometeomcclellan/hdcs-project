<?php
    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    //Variables de ingresar detalle de Equipo Computadora
    $select_TipoRam   = (isset($_POST['select_TipoRam'])) ? $_POST['select_TipoRam'] : '';
    $select_CapacidadRam   = (isset($_POST['select_CapacidadRam'])) ? $_POST['select_CapacidadRam'] : '';
    $select_VelocidadRam   = (isset($_POST['select_VelocidadRam'])) ? $_POST['select_VelocidadRam'] : '';
    $select_TipoDisco   = (isset($_POST['select_TipoDisco'])) ? $_POST['select_TipoDisco'] : '';
    $select_CapacidadDisco   = (isset($_POST['select_CapacidadDisco'])) ? $_POST['select_CapacidadDisco'] : '';

    $marca   = (isset($_POST['marca'])) ? $_POST['marca'] : '';

    $codEquipo   = (isset($_POST['codEquipo'])) ? $_POST['codEquipo'] : '';
    $numInventario   = (isset($_POST['numInventario'])) ? $_POST['numInventario'] : '';
    $selectTipoEquipo   = (isset($_POST['selectTipoEquipo'])) ? $_POST['selectTipoEquipo'] : '';
    $selectModelo   = (isset($_POST['selectModelo'])) ? $_POST['selectModelo'] : '';
    $serie   = (isset($_POST['serie'])) ? $_POST['serie'] : '';
    $serviceTag   = (isset($_POST['serviceTag'])) ? $_POST['serviceTag'] : '';
    $descripcion   = (isset($_POST['descripcion'])) ? $_POST['descripcion'] : '';

    $opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

//print(strval($opcion));
//echo $opcion;


    function buscarRepetidoCodigo(string $codEquipo, object $conexion): int {
        $consulta = "CALL sp_existeCodigoEquipo(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $codEquipo);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $estado = 0;
        if($cantidad  == 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }
    $verificarCodigo = buscarRepetidoCodigo($codEquipo,  $conexion);



    function buscarRepetidoSerie(string $serie, object $conexion): int {
        $consulta = "CALL sp_existeSerie(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $serie);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $estado = 0;
        if($cantidad  == 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }
    $verificarSerie = buscarRepetidoSerie($serie,  $conexion);



    function buscarRepetidoServiceTag(string $serviceTag, object $conexion): int {
        $consulta = "CALL sp_existeServiceTag(?)";         
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $serviceTag);
        $resultado->execute(); 

        $cantidad = $resultado->fetchColumn(); // para obtener la cantidad de registro que dio la consulta

        $estado = 0;
        if($cantidad  == 1){
            $estado= 1;// Existe, esta repetido
        }

        return $estado;
    }
    $verificarServiceTag = buscarRepetidoServiceTag($serviceTag,  $conexion);



    $data = null;
    switch($opcion){
        case 1:
            if ($verificarCodigo >= 1) {
                $data = 3;
            }elseif($verificarSerie >= 1){
                $data = 1;
            }else if($verificarServiceTag >= 1){
                $data = 2;
            }
            else{
                $consulta = "CALL sp_insertarEquipo(?, ?, ?, ?, ?, ?, ?) ";        
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEquipo);
                $resultado->bindValue(2, $numInventario);
                $resultado->bindValue(3, $selectTipoEquipo); 
                $resultado->bindValue(4, $selectModelo);
                $resultado->bindValue(5, $serie);
                $resultado->bindValue(6, $serviceTag);
                $resultado->bindValue(7, $descripcion);
                $resultado->execute(); 

                $data = 0; 
            } 
            break;    
        case 2: 
                $consulta = "CALL sp_actualizarEquipo(?, ?, ?, ?, ?, ?, ?) ";     
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(1, $codEquipo);
                $resultado->bindValue(2, $numInventario);
                $resultado->bindValue(3, $selectTipoEquipo); 
                $resultado->bindValue(4, $selectModelo);
                $resultado->bindValue(5, $serie);
                $resultado->bindValue(6, $serviceTag);
                $resultado->bindValue(7, $descripcion);
                $resultado->execute(); 

                $data = 0; 
            break;        
        case 3:        
            $consulta = "CALL sp_eliminarEquipo(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $codEquipo, PDO::PARAM_INT);
            $resultado->execute();                           
            break;
        case 4:    
            $consulta = "CALL sp_mostrarEquipo1()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();        
            $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
            break;



        case 5:
            $consulta = "CALL sp_mostrarTipoEquipo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 6:
            $consulta = "CALL sp_mostrarModelo()";
            $resultado = $conexion->prepare($consulta);
            $resultado->execute();  
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
            break;
        case 7:
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
            break;
        case 8:        
            $consulta = "CALL sp_mostrarModeloSelect(?) ";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(1, $marca, PDO::PARAM_INT);
            $resultado->execute();   
            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);    
             
            break;
    }

    print json_encode($data);//envio el array final el formato json a AJAX
    $conexion=null;
?>