<?php
    session_start();

    //include "../header.php"; 

    $codEmpleado = intval($_SESSION["s_codEmpleado"]);

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require '../../assets/PHPMailer/Exception.php';
    require '../../assets/PHPMailer/PHPMailer.php';
    require '../../assets/PHPMailer/SMTP.php';


    require_once '../../bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $codEquipo   = (isset($_POST['codEquipo'])) ? $_POST['codEquipo'] : '';
    $falla   = (isset($_POST['falla'])) ? $_POST['falla'] : '';
    $opcion   = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

    if ($opcion === "6") {
        $consulta = "CALL sp_obtenerCorreoEmpleado(?)";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $codEmpleado);
        $resultado->execute();  
        $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                
        foreach($data as $dat) {     
            $nombre = $dat['NombreEmpleado'];
            $correo = $dat['correoElectronico'];

        }


        // Instantiation and passing `true` enables exceptions
        $mail = new PHPMailer(true);

        try {
            //Server settings
            $mail->SMTPDebug = 0;                      // Enable verbose debug output
            $mail->isSMTP();                                            // Send using SMTP
            $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
            $mail->Username   = 'soporteHDCS@gmail.com';                     // SMTP username
            $mail->Password   = 'unahcurlp21';                               // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
            $mail->Port       = 587;                                    // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

            //Recipients
            $mail->addAddress($correo, $nombre);                        // Quien recibe el correo
            $mail->setFrom('soporteHDCS@gmail.com', 'Soporte HDCS CURLP');     // Quien envia el correo 
            

            // Content
            $mail->isHTML(true);                                  // COntenido del cuerpo del correo electronico
            $mail->Subject = 'Solicitud mantenimiento ';
            //$mail->Body    = '<h2><b><i><u>SOLICITUD MANTENIMIENTO  #' . $codEquipo .'</u></i></b></h2> <br> ' . 
            $mail->Body    = '<h2><b><i><u>SOLICITUD MANTENIMIENTO </u></i></b></h2> <br> ' . 
            $mail->Body   = 'Estimado usuario '. "<b>".$nombre."</b>" . ", se ha registrado una solicitud de mantenimiento a su nombre, para el equipo con código No. "."<b>".$codEquipo."</b>"."."." <br>" .
            $mail->Body    = '<b>Le estaremos informando a la brevedad del proceso del mismo. </b>'. "<br> " ;



            $mail->send();
            $data = 'Correo enviado a SoporteHDCS';
        } catch (Exception $e) {
            $data =  "Mensaje de error: {$mail->ErrorInfo}";
        }
    }




    print json_encode($correo);//envio el array final el formato json a AJAX
    $conexion=null;
?>