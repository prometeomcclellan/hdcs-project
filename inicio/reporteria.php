<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>HDCS | Admin</title>
  <meta name="keywords" content="Dashboard" />
		<meta name="description" content="CURLP Admin Official Site">
		<meta name="author" content="Omar McClellan, Mapphash Group">

		<!-- Favicon -->
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="../inicio/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../inicio/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="../inicio/plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../inicio/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <link rel="stylesheet" href="../inicio/plugins/sweetalert2/sweetalert2.min.css">
  <body> 

  <style>
        .gradiente {
  background-image: linear-gradient(to right, #1a3c8a, #fed11f);
}

.gradiente-horizontal {
  background-image: linear-gradient(to left,#1a3c8a, #fed11f);
}

.no-cursor:hover{
    cursor : default;
}
    </style>
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-reverse" style="background-color: #1a3c8a;color:white;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
    <?php
              require_once "../Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
// Any mobile device (phones or tablets).
if ( $detect->isMobile() ) {
  echo "<li id='dbarTogglerM' class='nav-item'>";
}else{
  echo "<li id='dbarToggler' class='nav-item topnav-toggler'>";
}
          ?>
      
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../inicio/dashboard.php" class="nav-link">Inicio</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" href="https://app.chaport.com/#/chats" target="blank">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"></div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-danger navbar-badge notificaciones-conteo"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right menu-notificaciones">
          <span class="dropdown-item dropdown-header"> <span class="conteo-notificaciones"></span> Notificaciones</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item notificacion" data-toggle="modal" data-target="#quickReportModal">
            <i class="fas fa-file mr-2"></i> <span class="conteo-diagnosticados"></span> nuevas órdenes
            <span class="float-right text-muted text-sm"> <span class="tiempo-diagnosticados">0 días</span></span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">Ver diagnósticos</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a id="logoutButton" class="nav-link logout-button" data-toggle="dropdown" href="#">
          <i class="fas fa-power-off"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../inicio/dashboard.php" class="brand-link">
<img src="../inicio/dist/img/AdminLTELogoRedondo.png" alt="HDCS" class="brand-image elevation-3"
           style="opacity: 1">
      <span class="brand-text font-weight-light">HDCS Admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">

        <a href="#" class="d-block user-info" data-toggle="modal" data-target="#editUserModal">
            <i  id="editUserIcon" class="fas fa-edit edit-user-icon" style="font-size: 1.3rem;padding: 6px;border-radius: 50%;color: #fed11f;text-align: center;position: absolute;top: 45%;right: 3%;z-index: 999;"></i>
        </a>

        <a id="usuarioNombreN" href="#" class="d-block user-info" data-toggle="modal" data-target="#editUserModal">
        <i id="iconoUsuario" class="fas fa-user icono-usuario" style="background-color: white;font-size: 2rem;padding: 5px;border-radius: 50%;width: 42px;height: 42px;color: #3c3a3a;text-align: center;"></i>
        </a>
        
          <img id="fotoDeUsuario" class="img-circle elevation-2 foto-usuario" alt="" style="display:none;width:50px;height:50px;background-size:cover;backgrouposition:center;">
        </div>
        <div class="info">
          <a id="usuarioNombre" href="#" class="d-block user-info usuario-nombre" data-toggle="modal" data-target="#editUserModal"></a>
          
        </div>
      </div>

      

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">  
          <li class="nav-item has-treeview">
            <a href="/HDCS/forms/equipo/index.php" class="nav-link">
              <i class="nav-icon fas fa-laptop"></i>
              <i class="fas fa-angle-left right"></i>
              <p>
                Equipos
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/HDCS/forms/equipo/index.php" class="nav-link">
                <i class="nav-icon fas fa-laptop"></i>
                  <p>
                    Equipo
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/asignacionEquipo/index.php" class="nav-link">
                  <i class="nav-icon fas fa-tasks"></i>
                  <p>
                    Asignación de Equipo
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/capacidad/index.php" class="nav-link">
                  <i class="nav-icon fas fa-warehouse"></i>
                  <p>
                    Capacidad
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/controlGarantia/index.php" class="nav-link">
                  <i class="nav-icon fas fa-award"></i>
                  <p>
                    Control de Garantía
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/detEquipoComputadora/index.php" class="nav-link">
                  <i class="nav-icon fas fa-tv"></i>
                  <p>
                    Detalle de Computadora
                  </p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="/HDCS/forms/marca/index.php" class="nav-link">
                  <i class="nav-icon fas fa-tag"></i>
                  <p>
                    Marca
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/modelo/index.php" class="nav-link">
                  <i class="nav-icon fas fa-barcode"></i>
                  <p>
                    Modelo
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoDisco/index.php" class="nav-link">
                  <i class="nav-icon fas fa-hdd"></i>
                  <p>
                    Tipo de Disco
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoEquipo/index.php" class="nav-link">
                  <i class="nav-icon fas fa-laptop-house"></i>
                  <p>
                    Tipo de Equipo
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoRam/index.php" class="nav-link">
                  <i class="nav-icon fas fa-memory"></i>
                  <p>
                    Tipo de RAM
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/velocidadRam/index.php" class="nav-link">
                  <i class="nav-icon fas fa-digital-tachograph"></i>
                  <p>
                    Velocidad de RAM
                  </p>
                </a>
              </li>
            </ul>
          </li>
          <div class="dropdown-divider"></div>
          <li class="nav-item  has-treeview">
            <a href="/HDCS/forms/usuario/index.php" class="nav-link">
              <i class="nav-icon fa fa-users"></i>
              <i class="fas fa-angle-left right"></i>
              <p>
                Usuarios
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/HDCS/forms/usuario/index.php" class="nav-link">
                <i class="nav-icon fa fa-user"></i>
                <p>
                Usuario
                </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/empleado/index.php" class="nav-link">
                <i class="nav-icon fas fa-user-tie"></i>
                <p>
                  Empleados
                </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/cargo/index.php" class="nav-link">
                <i class="nav-icon fas fa-user-tag"></i>
                <p>
                  Cargos
                </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tecnico/index.php" class="nav-link">
                <i class="nav-icon fas fa-users-cog"></i>
                <p>
                  Técnicos
                </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/personal/index.php" class="nav-link">
                <i class="nav-icon fas fa-user-friends"></i>
                <p>
                  Personal
                </p>
                </a>
              </li>
            </ul>
          </li>
          <div class="dropdown-divider"></div>
          <li class="nav-item  has-treeview">
            <a href="/HDCS/inicio/dashboard.php" class="nav-link">
              <i class="nav-icon fas fa-wrench"></i>
              <i class="fas fa-angle-left right"></i>
              <p>
                Mantenimiento
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/HDCS/inicio/dashboard.php" class="nav-link">
                  <i class="nav-icon fas fa-screwdriver"></i>
                  <p>
                    Mantenimientos
                  </p>
                </a>
              </li>

              <li class="nav-item">
                <a href="/HDCS/forms/solicitudMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-comment-dots"></i>
                  <p>
                    Solicitud Mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/controlMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-cog"></i>
                  <p>
                    Control Mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/estadoControlMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-hammer"></i>
                  <p>
                    Estado Mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-cogs"></i>
                  <p>
                    Tipo Mantenimiento
                  </p>
                </a>
              </li>
              
            </ul>
          </li>
          <div class="dropdown-divider"></div>
          <li class="nav-item">
            <a href="/HDCS/forms/departamento/index.php" class="nav-link">
              <i class="nav-icon fas fa-network-wired"></i>
              <p>
                Departamentos
              </p>
            </a>
          </li>
          
          <li class="nav-item">
          <?php 
            $thisUri = $_SERVER['REQUEST_URI'];
            $uriFilter = "inicio";
            $uriCheck = str_contains($thisUri, $uriFilter);

            if ($uriCheck == 1) {
              //echo str_contains($thisUri, $uriFilter);
              echo "<a href='reporteria.php' class='nav-link'>";
            }else{
              echo "<a href='../../reporteria.php' class='nav-link'>";
            }
            ?>
              <i class="nav-icon fa fa-file" aria-hidden="true"></i>
              <p>
                Reportería
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <?php
              require_once "../Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
// Any mobile device (phones or tablets).
if ( $detect->isMobile() ) {
  
    echo "<div id='dWrapper' class='wrapper' style='width: 100%;float:right;'>";
}else{
  echo "<div id='dWrapper' class='wrapper' style='width: 100%;float:right;'>";
}
          ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Centro de Información</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Inicio</a></li>
              <li class="breadcrumb-item active">Admin</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <!-- Info boxes -->
        <div class="row">
        <div class="col-md-12">
            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Mantenimientos filtrados por fecha</h3>

                <div class="card-tools">
                <div class="row">
                  <div class="col-sm-6">
                    Desde
                  </div>
                  <div class="col-sm-6">
                    Hasta
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6">
                    <input id="beginn" type="date" class="datepicker form-control">
                  </div>
                  <div class="col-sm-6">
                    <input id="end" type="date" class="datepicker form-control">
                  </div>
                </div>
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <style>
              #table-wrapper {
 	              height: 300px;
	              
	              padding: 0px;
	              margin: 0px auto 0px auto;
	              overflow: auto;
	              
              }

              table {
	              width: 100%;
                max-height: 300px;
	              padding: 15px;
	              text-align: left;
	              border-collapse: collapse;
	              
              }
              </style>
              <div class="card-body p-0">
                <div id="table-wrapper" class="table-responsive">
                  <table id="tablaMantFilt" class="table table-striped table-hover m-0 tabla-data">
                    <thead>
                    <tr>
                    <th>Número Orden</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha Solicitud</th>
                      <th>Fecha Mantenimiento</th>
                      <th>Departamento</th>
                    </tr>
                    </thead>
                    <tbody id="mantenimientosFiltradosFecha"></tbody>
                    <tfoot>
                      <div class="alert alert-danger alerta-no-data" style="display:none;">Por el momento no existen datos para esta tabla. Puedes buscar seleccionando dos fechas diferentes.</div>
                    </tfoot>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <!-- a href="/HDCS/forms/equipo/index.php" class="btn btn-sm btn-info float-left">Crear Solicitud</a -->
                
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->

          
        </div>

        <div class="col-md-12">
            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Mantenimientos Por Usuario</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <style>
              #table-wrapper {
 	              height: 300px;
	              
	              padding: 0px;
	              margin: 0px auto 0px auto;
	              overflow: auto;
	              
              }

              table {
	              width: 100%;
                max-height: 300px;
	              padding: 15px;
	              text-align: left;
	              border-collapse: collapse;
	              
              }
              </style>
              <div class="card-body p-0">
                <div id="table-wrapper" class="table-responsive">
                  <table id="tablaMantXUsuario" class="table table-striped table-hover m-0 tabla-data">
                    <thead>
                    <tr>
                    <?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;

    if ( $detect->isMobile() ) {
      echo "<th>Usuario</th>
      <th>Celular</th>
      <th>Extension</th>
      <th>Total</th>";
    }else{
        echo "<th>Usuario</th>
        <th>Teléfono</th>
        <th>Celular</th>
        <th>Extension</th>
        <th>Cargo</th>
        <th>Estado</th>
        <th>Total</th>";
    }
    ?>
                      
                    </tr>
                    </thead>
                    <tbody id="mantenimientosXUsuarioTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <!-- a href="/HDCS/forms/equipo/index.php" class="btn btn-sm btn-info float-left">Crear Solicitud</a -->
                
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->



          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>
          
          
          
        </div>
        <!-- /.row -->

        <div class="row">
        
            
        <div class="col-md-12">
            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Mantenimientos Pendientes Por Departamento</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <style>
              #table-wrapper {
 	              height: 300px;
	              
	              padding: 0px;
	              margin: 0px auto 0px auto;
	              overflow: auto;
	              
              }

              table {
	              width: 100%;
                max-height: 300px;
	              padding: 15px;
	              text-align: left;
	              border-collapse: collapse;
	              
              }
              </style>
              <div class="card-body p-0">
                <div id="table-wrapper" class="table-responsive">
                  <table id="tablaMantPend" class="table table-striped table-hover m-0 tabla-data">
                    <thead>
                    <tr>
                    <th>Número Orden</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha Solicitud</th>
                      <th>Fecha Mantenimiento</th>
                      <th>Departamento</th>
                    </tr>
                    </thead>
                    <tbody id="mantenimientosPendientesTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <!-- a href="/HDCS/forms/equipo/index.php" class="btn btn-sm btn-info float-left">Crear Solicitud</a -->
                
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->

          
        </div>

        <div class="row">
          
        </div>
        <!-- /.row -->

        <!-- Main row -->
        <div class="row">
          
            
        </div>
        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  
</div>


<!-- ./wrapper -->
<?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;
  if ( $detect->isMobile() ) {
    echo "<div class='spinner-border' id='page_loader' style='position: fixed;width: 190px;height: 190px;font-size: 2rem;color: #e7c738;left: 25vw;z-index: 1060;display:inherit;top: 40%;'></div>";
  }else{
    echo "<div class='spinner-border' id='page_loader' style='position: fixed;width: 190px;height: 190px;font-size: 2rem;color: #e7c738;left: 45vw;z-index: 1060;display:inherit;top: 30%;'></div>";
  }
?>
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->

     <script src="plugins/bootstrap/js/bootstrap.min.js"></script> 
     <script src="plugins/popper/popper.min.js"></script>    
        
     <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>

     <script src="dist/js/html2pdf.bundle.min.js"></script>
<script src="dist/js/FileSaver.js"></script>
<script lang="javascript" src="dist/js/xlsx.full.min.js"></script>
<script src="dist/js/tableexport.js"></script>
<script src="dist/js/xlsx.core.min.js"></script>

<script src="../codigo.js"></script>



<!-- Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editUserModalLabel">Editar Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-md-3">
                <a href="#" class="d-block">
                    <i  id="uploadUserPhotoIcon" class="fas fa-user" style="background-color: white;font-size: 5rem;padding: 10px;border-radius: 50%;width: 60px;height: 60px;color: #3c3a3a;text-align: center;padding-top: 10px;padding-left: 30px;"></i>
                </a>

                <style>
                  .thumb {
                    display: block;
                    overflow: hidden;
                    width: 106px;
                    height: 106px;
                    margin: 5px;
                    border: 3px solid #fed11f;
                    background-position: center center;
                    background-size: cover;
                  }
                </style>

                <img id="uploadUserPhotoImg" alt="" class="brand-image thumb"
                style="opacity: 1; display:none;">
                <input type="file" id="img" name="img" accept="image/*" style="display:none;">
            </div>
            <div class="col-md-9">
              <ul style="list-style:none;">
                <!-- li style="margin-top:1%;">
                    <div class="info">
                        <input id="inputEditUserName" class="form-control" type="text" name="name-update" placeholder="nombre y apellido">
                        
                    </div>
                </li -->
                <li style="margin-top:1%;">
                    <div class="info">
                        <input id="inputEditUName" class="form-control" type="text" name="uname-update" placeholder="nombre de usuario">
                        <!-- a id="usuarioNombreUPdate" href="#" class="d-block">Omar McClellan</a -->
                    </div>
                </li>
              </ul>
                
            </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <a href="#" class="d-block">
                <i  id="updateUserPhotoIcon" class="fas fa-camera" style="font-size: 1.5rem;padding: 6px;border-radius: 50%;color: #007bff;text-align: center;float: right;"></i>
            </a>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button id="saveChangesButton" type="button" class="btn btn-primary">Guardar Cambios</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<style>
</style>
<div class="modal fade" id="quickReportModal" tabindex="-1" role="dialog" aria-labelledby="quickReportModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="quickReportModalLabel">Mantenimientos <span id="tipoMantenimiento"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- TABLE: LATEST ORDERS -->
        <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Mantenimientos Filtrados</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <style>

              #table-wrapper {
 	              height: 300px;
	              
	              padding: 0px;
	              margin: 0px auto 0px auto;
	              overflow: auto;
	              
              }

              table {
	              width: 100%;
                max-height: 300px;
	              padding: 15px;
	              text-align: left;
	              border-collapse: collapse;
	              
              }
              </style>
              <div class="card-body p-0">
                <div id="table-wrapper" class="table-responsive">
                  <table class="table table-striped table-hover m-0">
                    <thead>
                    <tr>
                      <th>Número Orden</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha Solicitud</th>
                      <th>Fecha Mantenimiento</th>
                    </tr>
                    </thead>
                    <tbody id="quickReportsTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a href="/HDCS/forms/equipo/index.php Solicitud</a>
                
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Guardar Cambios</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<style>
</style>
<div class="modal fade" id="crearMantenimientoModal" tabindex="-1" role="dialog" aria-labelledby="quickReportModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="quickReportModalLabel">Crear Mantenimiento<span id="tipoMantenimiento"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- TABLE: LATEST ORDERS -->
        <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Mantenimientos Filtrados</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <style>

              #table-wrapper {
 	              height: 300px;
	              
	              padding: 0px;
	              margin: 0px auto 0px auto;
	              overflow: auto;
	              
              }

              table {
	              width: 100%;
                max-height: 300px;
	              padding: 15px;
	              text-align: left;
	              border-collapse: collapse;
	              
              }
              </style>
              <div class="card-body p-0">
                <div id="wrapperRep" id="table-wrapper" class="table-responsive">
                  <table class="table table-striped table-hover m-0">
                    <thead>
                    <tr>
                      <th>Número Orden</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha Solicitud</th>
                      <th>Fecha Mantenimiento</th>
                    </tr>
                    </thead>
                    <tbody id="quickReportsTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a href="/HDCS/forms/equipo/index.php Solicitud</a>
                
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!--Modal para CREAR-->
<div class="modal fade" id="modalCREAR" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="modalCuadro">
            <div class="modal-header gradiente-horizontal" style="">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formSolManC">    
                <div class="modal-body">


                    <h5><b><i>Datos del equipo</i></b></h5> <hr>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Código equipo:</label>
                                <input type="text" class="form-control" id="codEquipo" disabled="true" required autofocus>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <button id="btnBuscar" type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalEquipo"><i class="material-icons">search</i>  | Buscar</button>   
                        </div>    
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Descripción equipo:</label>
                                <input type="textarea" class="form-control" id="descripcionEquipo" disabled="true" >
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Tipo equipo:</label>
                                <input type="text" class="form-control" id="tipoEquipo" disabled="true" >
                            </div>
                        </div>    
                    </div>  

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Modelo equipo:</label>
                                <input type="text" class="form-control" id="modeloEquipo" disabled="true" >
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">ServiceTag equipo:</label>
                                <input type="text" class="form-control" id="serviceTagEquipo" disabled="true" >
                            </div>
                        </div>    
                    </div> 


                    <hr id="linea2">
                    <h5 id="h5"><b><i>Datos de solicitud</i></b></h5> <hr>
                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Fecha solicitud:</label>
                        <input type="date" class="form-control" id="fechaInput" required autofocus>
                    </div>
                    
                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Descripción falla:</label>
                        <textarea type="text" class="form-control " id="Pre_Diag" required autofocus></textarea>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                    <button type="submit" id="btnGuardar" class="btn btn-dark">Guardar</button>
                </div>
            </form>    
        </div>
    </div>
</div> 


<!-- Modal BUSCAR Solicitud mantenimiento    NUEVO-->
<div class="modal fade" id="modalEquipo"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="anchoModalBuscarSolMant">
            <div class="modal-header gradiente-horizontal">
                <h5 class="modal-titles" id="exampleModalLabel"></h5>
                <button id="btnClose" type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
                <form id="formEquipo">    
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">        
                                    <table id="tablaEquipoD" class="table table-striped table-bordered table-condensed" style="width:100%" >
                                        <thead class="text-center">
                                            <tr>
                                                <th>Código equipo</th>
                                                <th>Tipo equipo</th>     
                                                <th>Modelo</th>                
                                                <th>Serie</th>
                                                <th>Service tag</th>
                                                <th>Descripción</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody>                           
                                        </tbody>        
                                    </table>               
                                </div>
                            </div>
                        </div>

                    </div>
                </form>  
        </div>
    </div>
</div> 

<div class="modal fade" id="modalEquipoDetalle"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="anchoModalBuscarSolMant">
            <div class="modal-header gradiente-horizontal">
                <h5 class="modal-titles" id="exampleModalLabel">Detalles de Mantenimiento</h5>
                <button id="btnClose" type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
                <form id="formEquipo">    
                    <div class="modal-body">

                        <div class="row">
    <?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;

    if ( $detect->isMobile() ) {
      $imageUrl = "product-2.jpg";
      $url = "dist/img/equipos/".$imageUrl;
      echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><div class='card' style='width: 100%;'>";
    }else{
        echo "<div class='col-lg-6'><div class='card' style='width: 18rem;margin-left:0.5rem;'>";
    }
    ?>
  
  
      <!-- img class="card-img-top" alt="Card image cap" src="dist/img/HDCS-imagotipo.png" -->

      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner" id="carouselContainer">
    <!-- div class="carousel-item active">
      <img class="d-block w-100" style="background-image:url('dist/img/equipos/product-2.jpg');background-size:cover;background-position:center;width:60px; height:240px;" >
      <input type="hidden" value="0" class="thumb-index">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  style="background-image:url('dist/img/equipos/product-1.png');background-size:cover;background-position:center;width:60px; height:240px;">
      <input type="hidden" value="1" class="thumb-index">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" style="background-image:url('dist/img/equipos/product-3.jpg');background-size:cover;background-position:center;width:60px; height:240px;" >
      <input type="hidden" value="2" class="thumb-index">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  style="background-image:url('dist/img/equipos/product-4.jpg');background-size:cover;background-position:center;width:60px; height:240px;">
      <input type="hidden" value="3" class="thumb-index">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  style="background-image:url('dist/img/equipos/product-carousel-1.jpg');background-size:cover;background-position:center;width:60px; height:240px;">
      <input type="hidden" value="4" class="thumb-index">
    </div -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:#1a3c8a;"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true" style="background-color:#1a3c8a;"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

      <div class="card-body">
        <h5 class="card-title" id="manTitulo">Card title</h5>
        <p class="card-text" id="manDescripcion">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      </div>
      <ul class="list-group list-group-flush" id="manDetalles">
      </ul>
      <div class="card-body">
        <a href="#" class="card-link">Editar</a>
        <a href="#" class="card-link">Finalizar</a>
      </div>
      <div class="card-footer">
      
      </div>
  </div>
  
  
        
                            </div>

                            <div class="col-lg-6">

                           
                              
  <?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;
    // Any mobile device (phones or tablets).
    if ( $detect->isMobile() ) {
      $imageUrl = "product-2.jpg";
      $url = "dist/img/equipos/".$imageUrl;

        echo "<style>$('#mobileSlider').css('display', 'inherit');</style>";
        
    }else{
      

        echo "<div class='container'>"
        ."<style>"
          ."ul.thumbnails {list-style:none;padding-left:0;width: 100%;text-align: right;height: 600px;overflow-y: scroll;}"
          ."ul.thumbnails > li {} .thumb-nail{width:120px;height:90px;border: 6px solid #1a3c8a;border-radius: 6px;} </style>"
          ."<ul id = 'thumbnailsContainer' class='thumbnails'>"
          /*
            ."<li>"
              ."<a href='#slide1'><img src='dist/img/equipos/product-2.jpg'" 
              ."class='thumb-nail'/></a>"
            ."</li>"
            ."<li>"
              ."<a href='#slide2'><img src='dist/img/equipos/product-1.png'" 
              ."class='thumb-nail'/></a>"
            ."</li>"
            ."<li>"
              ."<a href='#slide3'><img src='dist/img/equipos/product-3.jpg'" 
              ."class='thumb-nail'/></a>"
            ."</li>"
            ."<li>"
              ."<a href='#slide4'><img src='dist/img/equipos/product-4.jpg'" 
              ."class='thumb-nail'/></a>"
            ."</li>"
            ."<li>"
              ."<a href='#slide5'><img src='dist/img/equipos/product-carousel-1.jpg'" 
              ."class='thumb-nail'/></a>"
            ."</li>"
            */
          ."</ul>"
        ."</div>";
    }

    
    
  ?>

                            </div>
                        </div>

                        <div class="row">
          <div class="col-md-12">
            <a href="#" class="d-block">
                <i id="updateEquipmentPhotoIcon" class="fas fa-camera" style="font-size: 1.5rem;padding: 6px;border-radius: 50%;color: #007bff;text-align: center;float: right;"></i>
                <input type="file" id="imgEquipo" name="imgEquipo" accept="image/*" style="display:none;">
            </a>
          </div>
        </div>
                    </div>
                </form>  
        </div>
    </div>
</div>

<script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>

<!-- Begin of Chaport Live Chat code -->
<!-- script type="text/javascript">
(function(w,d,v3){
w.chaportConfig = {
  appId : '6053d6d7e8909463540b380d'
};

if(w.chaport)return;v3=w.chaport={};v3._q=[];v3._l={};v3.q=function(){v3._q.push(arguments)};v3.on=function(e,fn){if(!v3._l[e])v3._l[e]=[];v3._l[e].push(fn)};var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://app.chaport.com/javascripts/insert.js';var ss=d.getElementsByTagName('script')[0];ss.parentNode.insertBefore(s,ss)})(window, document);
</script -->
<!-- End of Chaport Live Chat code -->

</body>
</html>
