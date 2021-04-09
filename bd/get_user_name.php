<?php
include_once 'conexion.php';
$conn = new mysqli("localhost", "root", "", "hdcs");
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$data = array();

$idUsuario = (isset($_POST['idUsuario'])) ? $_POST['idUsuario'] : '';
//$idUsuario = 117;

$sql = "SELECT * FROM usuario
            WHERE idUsuario = '".$idUsuario."'";
$result = $conn->query($sql);

if($result){

    while($row = $result->fetch_assoc()) {
        $nombreUsuario = $row["userName"];
        if(!$nombreUsuario == "" && !$nombreUsuario == NULL){
            echo $nombreUsuario;
        }else{
            echo 0;
        }
    }

}else{
    echo 0;
}