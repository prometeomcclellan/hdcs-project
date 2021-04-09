<?php
    session_start();
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
    $observacion   = (isset($_POST['observacion'])) ? $_POST['observacion'] : '';
    $selectControlMant   = (isset($_POST['selectControlMant'])) ? $_POST['selectControlMant'] : ''; //3-finalizado  2-En reparación   1-Diagnosticado


        $consulta = "CALL sp_obtenerCorreoEmpleadoControlMant(?)";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(1, $codEquipo);
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
            

            if ($selectControlMant === "3") {
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = 'Control mantenimiento ';
                $mail->Body    = '<h2><b><i><u>CONTROL MANTENIMIENTO </u></i></b></h2> <br> '. 
                $mail->Body   = 'Estimado usuario '. "<b>".$nombre."</b>" . ", se ha registrado un nuevo control mantenimiento al equipo asignado a su nombre con código No. "."<b>".$codEquipo."</b>"."."." <br>" .
                $mail->Body   = 'Estado del control de mantenimiento: '. "<b>"."Finalizado"."</b>" ." <br>" . "<br>" . 
                $mail->Body    = '<b>Le equipo ya se encuentra listo!!. </b>'. "<br> " ;
            }
            if ($selectControlMant === "2") {
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = 'Control mantenimiento ';
                $mail->Body    = '<h2><b><i><u>CONTROL MANTENIMIENTO </u></i></b></h2> <br> '. 
                $mail->Body   = 'Estimado usuario '. "<b>".$nombre."</b>" . ", se ha registrado un nuevo control de mantenimiento al equipo asignado a su nombre con código No. "."<b>".$codEquipo."</b>"."."." <br>" .
                $mail->Body   = 'Estado del control de mantenimiento: '. "<b>"."En reparción"."</b>" ." <br>" . "<br>" . 
                $mail->Body    = '<b>Le estaremos informando a la brevedad del proceso del mismo. </b>'. "<br> " ;
            }
            if ($selectControlMant === "1") {
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = 'Control mantenimiento ';
                $mail->Body    = '<h2><b><i><u>CONTROL MANTENIMIENTO </u></i></b></h2> <br> '. 
                $mail->Body   = 'Estimado usuario '. "<b>".$nombre."</b>" . ", se ha registrado un nuevo control de mantenimiento al equipo asignado a su nombre con código No. "."<b>".$codEquipo."</b>"."."." <br>" .
                $mail->Body   = 'Estado del control de mantenimiento: '. "<b>"."Diagnosticado"."</b>" ." <br>" . "<br>" . 
                $mail->Body    = '<b>Le estaremos informando a la brevedad del proceso del mismo. </b>'. "<br> " ;
            }

            $mail->send();
            $data = 'Correo enviado a SoporteHDCS';
        } catch (Exception $e) {
            $data =  "Mensaje de error: {$mail->ErrorInfo}";
        }
    
    



    print json_encode($selectControlMant);//envio el array final el formato json a AJAX
    $conexion=null;
?>