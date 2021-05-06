<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();

	//print_r($conexion);   probamos si esta bien la conexión con la base de datos.


    $consulta = "CALL sp_mostrarControlMantenimiento()";        
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $dataX = $resultado->fetchAll(PDO::FETCH_ASSOC);

    foreach($dataX as $dat) {     
        $idControlMantenimiento = $dat["idControlMantenimiento"];
        $idSolicitudMantenimiento = $dat["idSolicitudMantenimiento"];
        $fechaControlMantenimiento = $dat["fechaControlMantenimiento"];
        $codEquipo = $dat["codEquipo"];
        $descripcionEquipo = $dat["descripcionEquipo"];
        $tipoMantenimiento = $dat["tipoMantenimiento"];
        $fechaSolicitudMantenimiento = $dat["fechaSolicitudMantenimiento"];
        $observacion = $dat["observacion"];
        $estadoControlMantenimiento = $dat["estadoControlMantenimiento"];
	      $nombreEmpleado = $dat["empleado"];
        $tituloControlmantenimiento = $dat["tituloControlmantenimiento"];
        //$idDepartamento = $dat["idDepartamento"]; tituloControlmantenimiento
	    //$estado = intval($estado);

		$response = array(
			'status' => 200,
			'idControlMantenimiento' => $idControlMantenimiento,
			'idSolicitudMantenimiento' => $idSolicitudMantenimiento,
            'fechaControlMantenimiento' => $fechaControlMantenimiento,
            'codEquipo' => $codEquipo,
            'descripcionEquipo' => $descripcionEquipo,
            'tipoMantenimiento' => $tipoMantenimiento,
            'fechaSolicitudMantenimiento' => $fechaSolicitudMantenimiento,
            'observacion' => $observacion,
            'estadoControlMantenimiento' => $estadoControlMantenimiento,
            'tituloControlmantenimiento' => $tituloControlmantenimiento,
            'nombreEmpleado' => $nombreEmpleado
            //'idDepartamento' => $idDepartamento
		);

		array_push($data, $response);
    } 


    //$dataX =null;
    if($resultado->rowCount() > 0){
    }else{
		$response = array(
			'status' => 500
		);

		array_push($data, $response);
	}
/**/
//print json_encode($data);
echo json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion=null;
