<?php 

	session_start();

	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	
	$_SESSION["s_usuario"] = $usuario;



 ?>