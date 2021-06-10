<!doctype html>
<html>
    <head>
        <link rel="shortcut icon" href="#" />
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
        <title>Login</title>

        <title>HDCS | Admin</title>
        <!-- Favicon -->
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="assets/plugins/sweetalert2/sweetalert2.min.css">        
        
        <link rel="stylesheet" type="text/css" href="assets/fuentes/iconic/css/material-design-iconic-font.min.css">

        <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css">
    <!-- Toastr -->
    <!-- link rel="stylesheet" href="inicio/plugins/toastr/toastr.min.css" -->
    
    
        
    </head>
<?php
require_once "Mobile_Detect.php";
  $detect = new Mobile_Detect;
if ( $detect->isMobile() ) {   
  echo "<body style='overflow-y:hidden;overflow-x:hidden;overflow:hidden;'>";
}else{
  echo "<body>";
}
?>
     
  <div class="" style="overflow:hidden;">
    <div class="row">
    <style>
        .no-cursor:hover{
          cursor : default;
        }
    </style>
    
      <div id="loginDerecha" class="col-md-6" style="background-color:#1a3c8a;height:100vh;background-image:url('/HDCS/inicio/dist/img/Login-Fondo-Fix.jpg');
      background-size:cover;background-position:center;">
        <div class="row">
        
    
      </div>
    </div>
      
    <div class="col-md-6" style="padding:3%;">
          <?php
              require_once "Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
              if ( $detect->isMobile() ) {
                echo "<div id='card_info' class='card card-info' style='margin-top:-2vh;'>";
              }else{
                echo "<div id='card_info' class='card card-info' style='margin-top:1%;'>";
              }
          ?>

              <div class="card-header" style="color:white;background-color:#1a3c8a;">
              <div class="row">
              <div class="col-md-8">
              <h3 class="card-title">Inicio de sesión</h3>
              </div>
              <div class="col-md-4">
              <img src="\HDCS\inicio\dist\img\HDCS-imagotipo-white.png" style="width: 60px;float: right;">
              </div>
              </div>
                
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal login-form validate-form"  id="formLogin" action="" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <!-- label for="inputEmail3" class="col-sm-3 col-form-label">Usuario</label -->
                    <div class="col-sm-12">
                      <input class="input100 form-control" type="text" id="usuario" name="usuario" placeholder="Usuario" AUTOCOMPLETE="OFF">
                    </div>
                  </div>
                  <div class="form-group row">
                    <!-- label for="inputPassword3" class="col-sm-3 col-form-label">Contraseña</label -->
                    <div class="col-sm-12">
                    <input class="input100 form-control" type="password" id="password" name="password" placeholder="Contraseña" AUTOCOMPLETE="OFF">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-12">
                      <div class="form-check">
                        <input type="checkbox" id="abierta" name="abierta" class="form-check-input" id="exampleCheck2">
                        <label class="form-check-label" for="exampleCheck2">Mantener sesión abierta</label>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer" style="height: 62px;">
                  
                  <!-- a href="#" class="btn btn-default no-cursor" style="color:transparent;cursor:arrow;">Cancel</a -->
                  <button id="submitButton" type="submit" name="submit" class="btn btn-info float-right" style="background-color:#1a3c8a;">Iniciar sesión</button>
                </div>
                <!-- /.card-footer -->
              </form>
            </div>
            <!-- /.card -->
            <script src="assets/jquery/jquery-3.3.1.min.js"></script>    
     <script src="assets/bootstrap/js/bootstrap.min.js"></script>    
     <script src="assets/popper/popper.min.js"></script>    
        
     <script src="assets/plugins/sweetalert2/sweetalert2.all.min.js"></script>    
     <script src="codigo.js"></script>
            <?php
              require_once "Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
// Any mobile device (phones or tablets).
if ( $detect->isMobile() ) {
    
 echo "<div class='' style='position: relative;width: 100%;z-index:999;background-color:white;'>".
 "<img src='\HDCS\inicio\dist\img\logoCurl.png' style='width: 105px;margin-left:9%;'>".
 "<img src='\HDCS\inicio\dist\img\logoUnah.png' style='width: 70px;margin-top: 0%;margin-left:27%;'>".
 
 
 "</div>";
}else{
    echo "<div class='row' style='position: absolute;bottom: 0;left: 3vw;width: 100%;'>".
    "<div class='col-md-6'>".
      "<img src='\HDCS\inicio\dist\img\logoCurl.png' style='width: 185px;'>".
    "</div>".
    "<div class='col-md-6'>".
      "<img src='\HDCS\inicio\dist\img\logoUnah.png' style='width: 130px;margin-top: 7%;'>".
    "</div>".
    
    "</div>";
}
          ?>
            
      </div>
      
  </div>

      <?php
        require_once "Mobile_Detect.php";
        $detect = new Mobile_Detect;
        
        if ( $detect->isMobile() ) {
          echo "<script>$(document).ready(function() {
            
            document.getElementById('loginDerecha').style.display = 'none';});</script>";

        }else{
          echo "<script>$(document).ready(function() {

            document.getElementById('loginDerecha').style.dispay = 'inherit';
            
            });</script>";
        }
      ?>
        
</div>     
        
        <!-- Begin of Chaport Live Chat code -->
<script type="text/javascript">
(function(w,d,v3){
w.chaportConfig = {
  appId : '6053d6d7e8909463540b380d'
};

if(w.chaport)return;v3=w.chaport={};v3._q=[];v3._l={};v3.q=function(){v3._q.push(arguments)};v3.on=function(e,fn){if(!v3._l[e])v3._l[e]=[];v3._l[e].push(fn)};var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://app.chaport.com/javascripts/insert.js';var ss=d.getElementsByTagName('script')[0];ss.parentNode.insertBefore(s,ss)})(window, document);
</script>
<!-- End of Chaport Live Chat code -->

    </body>
    <!-- Toastr -->
  <!-- script src="inicio/plugins/toastr/toastr.min.js"></script -->
  
    
</html>


<!-- PLUGGINS: sweetalert2; mensajes de alerta -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- popper: trabaja junto a sweetalert2 -->
