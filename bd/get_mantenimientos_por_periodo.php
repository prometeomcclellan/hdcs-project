<?php
	include_once 'conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	$data = array();
    require_once('conn.php');

    $conn = new mysqli($servername, $username, $password, $dbname);

    //$idU = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
    

    $from=date('Y-m-d',strtotime($_POST['from']));
    $to=date('Y-m-d',strtotime($_POST['to']));

    echo $from.", ".$to;

    $sql = "SELECT * FROM controlmantenimiento
    WHERE fechaControlMantenimiento  BETWEEN '".$from."' AND '".$to."'";
    
    $result = $conn->query($sql);
    $row_cnt = $result->num_rows;

    //$sql = "select * from `login` where login_date between '$from' and '$to'";