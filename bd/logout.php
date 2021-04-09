<?php
session_start();
unset($_SESSION["s_usuario"]);
unset($_SESSION["s_idUsuario"]);
unset($_SESSION["s_estadoUsuario"]);
unset($_SESSION["s_codEmpleado"]);
$response = array(
    'status' => 200,
    'message' => "Yeah"
);
echo json_encode($response, JSON_UNESCAPED_UNICODE);
session_destroy();

?>