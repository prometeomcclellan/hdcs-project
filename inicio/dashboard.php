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
		<link rel="shortcut icon" href="../../HDCS/favicon.ico" type="image/x-icon" />

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- link href="gallery.scss" rel="stylesheet" -->

  <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<style>
.all-orders-button{}
.boton-accion {width:120px;margin-right:6px;}
.printer-widget {color:black;}
.printer-widget:hover {color:black;}

        .gradiente {
  background-image: linear-gradient(to right, #1a3c8a, #fed11f);
  color:white;
}

.gradiente-horizontal {
  background-image: linear-gradient(to left,#1a3c8a, #fed11f);
  color:white;
}

.no-cursor:hover{
    cursor : default;
}

#toastsContainerTopRight{z-index:2040;}

.fa-print:hover {cursor:pointer;}

.unread {background-color:#bebebe;}
.read {background-color:white;}
.unread:hover {background-color:#bebebe;}
.read:hover {background-color:white;}
    </style>
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-reverse" style="background-color: #1a3c8a;color:white;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../inicio/dashboard.php" class="nav-link">Inicio</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm"></div>
    </form>

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
    <a href="dashboard.php" class="brand-link">
<img src="dist/img/AdminLTELogoRedondo.png" alt="HDCS" class="brand-image elevation-3"
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
            <a href="#" class="nav-link">
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
                <a href="/HDCS/forms/tipoDisco/index.php" class="nav-link">
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
            <a href="" class="nav-link">
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
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
      <div class="container-fluid">
        <!-- Info boxes -->

        <did class="row">
            <div class="col-12 col-sm-12 col-md-12">
              
            </div>
        </div>

        

        <div class="print-container" style="width:100%">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12">
                <strong>Solicitudes de Mantenimiento</strong>
                
            </div>
        
            <div class="col-12 col-sm-6 col-md-4">
              <a href="#" style="text-decoration: none;color:black;" class="top-report" data-toggle="modal" data-target="#quickReportModal">
              <div class="info-box">
              <span class="info-box-icon bg-danger elevation-1">
                <i class="fas fa-hourglass-start"></i>
              </span>

              <div class="info-box-content">
                <span class="info-box-text top-report-text">Diagnosticado</span>
                <span class="info-box-number" id="statusD">1</span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
          <div class="col-12 col-sm-6 col-md-4">
          <a href="#" style="text-decoration: none;color:black;" class="top-report" data-toggle="modal" data-target="#quickReportModal">
            <div class="info-box">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text top-report-text">En reparación</span>
                <span class="info-box-number" id="statusP">1</span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-4">
          <a href="#" style="text-decoration: none;color:black;" class="top-report" data-toggle="modal" data-target="#quickReportModal">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text top-report-text">Finalizados</span>
                <span class="info-box-number" id="statusF">0</span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>
          
          </div>

          <div class="row">
            <div class="col-md-12">
            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                

                <div class="card-tools" style="width:100%;">
                <div class="row" style="width:100%;">
              <div class="col-md-2"><h3 class="card-title">Mantenimientos del Mes</h3></div>
              <div class="col-md-10" style="width:100%;">
                <div class="row">
                <?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;

    if ( $detect->isMobile() ) {
      echo "<nav class='navbar navbar-expand' style='text-align:right;'>
      <ul class='navbar-nav ml-auto'>

      <li class='nav-item dropdown'>
        <a class='nav-link' href='https://app.chaport.com/#/chats' target='blank'>
          <i class='far fa-comments' style='color:transparent;'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      
      <li class='nav-item dropdown'>
      <a class='nav-link' href='https://app.chaport.com/#/chats' target='blank'>
      <i class='far fa-comments' style='color:transparent;'></i>
      <span class='badge badge-danger navbar-badge'></span>
    </a>
    <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      
      <li class='nav-item dropdown'>
        <a class='nav-link boton-accion-mobile boton-pdf' href='#' target='blank'>
          <i class='fas fa-file-pdf'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      
      <li class='nav-item dropdown'>
        <a class='nav-link boton-accion-mobile boton-ver' href='#' target='blank'>
          <i class='fas fa-eye'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
    </ul>
    </nav>";
    }else{
        echo "<div class='col-md-2'></div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        <a id='generarPdfBoton' href='#' style='text-decoration: none;' class='btn btn-sm btn-danger pdf-widget float-right boton-accion boton-pdf'>
          <span id='pdfIconContainer'>
            Pdf <i class='fas fa-file-pdf'></i>
          </span>
        </a>
        </div>
        
        <div class='col-md-2'>
        <a href='javascript:void(0)' class='btn btn-sm btn-secondary float-right all-orders-button boton-accion' id='verMantenimientoBoton'>Ver Todas</a>
        </div>";
    }
    ?>
                  
                </div>
              </div>
            </div>
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
                  <table id="mantenimientosTabla" class="table table-striped table-hover m-0 tabla-data">
                    <thead>
                    <tr>
                      <th>Número Orden</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha Solicitud</th>
                      <th>Fecha Mantenimiento</th>
                    </tr>
                    </thead>
                    <tbody id="mantenimientosTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
              <a id='crearMantenimientoBoton' href='/HDCS/forms/equipo/index.php' class='btn btn-sm btn-info float-left boton-accion' style='background-color: #1a3c8a;'>Crear Solicitud</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          

          
        </div>

        </div>
          <!-- /.print-container -->
          <div class="row">
            <div class="col-md-12">
            <div class="card">
              <div class="card-header border-transparent">
              

            <div class="card-tools" style="width:100%;">

            

            <div class="row" style="width:100%;">
              <div class="col-md-2"><h3 class="card-title">Reportes Varios</h3></div>
              <div class="col-md-10" style="width:100%;">
                <div class="row">
                <?php
    require_once "../Mobile_Detect.php";
    $detect = new Mobile_Detect;

    if ( $detect->isMobile() ) {
      echo "<nav class='navbar navbar-expand' style='text-align:right;'>
      <ul class='navbar-nav ml-auto'>

      <li class='nav-item dropdown'>
        <a class='nav-link' href='https://app.chaport.com/#/chats' target='blank'>
          <i class='far fa-comments' style='color:transparent;'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      <li class='nav-item dropdown'>
      <a class='nav-link' href='https://app.chaport.com/#/chats' target='blank'>
      <i class='far fa-comments' style='color:transparent;'></i>
      <span class='badge badge-danger navbar-badge'></span>
    </a>
    <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      
      
      <li class='nav-item dropdown'>
        <a class='nav-link boton-accion-mobile boton-pdf' href='#' target='blank'>
          <i class='fas fa-file-pdf'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
      
      <li class='nav-item dropdown'>
        <a class='nav-link boton-accion-mobile boton-ver' href='#' target='blank'>
          <i class='fas fa-eye'></i>
          <span class='badge badge-danger navbar-badge'></span>
        </a>
        <div class='dropdown-menu dropdown-menu-lg dropdown-menu-right'></div>
      </li>
    </ul>
    </nav>";
    }else{
        echo "<div class='col-md-2'></div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        
        </div>
        <div class='col-md-2'>
        <a id='generarPdfBoton' href='#' style='text-decoration: none;' class='btn btn-sm btn-danger pdf-widget float-right boton-accion boton-pdf'>
          <span id='pdfIconContainer'>
            Pdf <i class='fas fa-file-pdf'></i>
          </span>
        </a>
        </div>
        
        <div class='col-md-2'>
        <a href='javascript:void(0)' class='btn btn-sm btn-secondary float-right all-orders-button boton-accion' id='verReportesBoton'>Ver Todas</a>
        </div>";
    }
    ?>
                  
                </div>
              </div>
            </div>
           
                </div>
                </div>
                </div>
            </div>
          </div>

          <div class="print-container" style="width:100%">
          <div class="row">
          <div class="col-md-3">
          <!-- Info Boxes Style 2 -->
          <a href="/HDCS/forms/equipo/index.php" style="text-decoration: none;color:black;" class="middle-report">
            <div class="info-box mb-3 bg-warning">
              <span class="info-box-icon"><i class="fas fa-tag"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Equipo</span>
                <span id="equipmentCount" class="info-box-number">7</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </a>

          </div>

          <div class="col-md-3">

          <a href="/HDCS/forms/usuario/index.php" style="text-decoration: none;color:black;" class="middle-report">
            <div class="info-box mb-3 bg-success">
              <span class="info-box-icon"><i class="fa fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Usuarios</span>
                <span id="userCount" class="info-box-number">4</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </a>

          </div>
          

          <div class="col-md-3">

          <a href="/HDCS/forms/departamento/index.php" style="text-decoration: none;color:black;" class="middle-report">
            <div class="info-box mb-3 bg-info">
              <span class="info-box-icon"><i class="fas fa-network-wired"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Departamentos</span>
                <span id="deptCount" class="info-box-number">3</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </a>
          
          </div>
         

          <div class="col-md-3">

          <a href="/HDCS/forms/asignacionEquipo/index.php" style="text-decoration: none;color:black;" class="middle-report">
            <div class="info-box mb-3 bg-primary">
              <span class="info-box-icon"><i class="nav-icon fas fa-tasks"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Asignación de Equipo</span>
                <span id="asignCount" class="info-box-number">4</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </a>

          </div>
        

          <div class="col-md-4">
            
            <div id="mantPorDep" class="card">
              <div class="card-header">
                <h3 class="card-title">Mantenimientos Por Departamento</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="chart-responsive"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      
                      <canvas id="donutChartE" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block;" width="306" height="250" class="chartjs-render-monitor"></canvas>
                    </div>
                    <!-- ./chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-4">
                    <ul id="deptosList" class="chart-legend clearfix"></ul>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer bg-white p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      Diagnosticados
                      <span id="diagnosPorcent" class="float-right text-danger">
                        <i class="fas fa-arrow-down text-sm"></i>
                        <span id="diagnosPercent">50%</span>
                      </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      En Reparación
                      <span id="reparPorcent" class="float-right text-warning">
                        <i class="fas fa-arrow-up text-sm"></i>
                        <span id="repairPercent">50%</span>
                      </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      Finalizados
                      <span id="finalPorcent" class="float-right text-success">
                        <i class="fas fa-arrow-left text-sm"></i>
                        <span id="finishPercent">0%</span>
                      </span>
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.footer -->
            </div>
            <!-- /.card -->
          </div>

          <div class="col-md-8">
          
            <div id="repSegEst" class="card" style="height: 471px;">
              <div class="card-header">
                <h5 class="card-title">Reporte Según Estado de Mantenimiento</h5>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <!-- div class="btn-group">
                    <button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown">
                      <i class="fas fa-wrench"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu">
                      <a href="#" class="dropdown-item">Action</a>
                      <a href="#" class="dropdown-item">Another action</a>
                      <a href="#" class="dropdown-item">Something else here</a>
                      <a class="dropdown-divider"></a>
                      <a href="#" class="dropdown-item">Separated link</a>
                    </div>
                  </div  -->
                  
                </div>
              </div>
              <div class="card-body" style="overflow-y: scroll;">
                <div id="deptosContenedor" class="row"></div>
                <!-- /.row -->
                <div id="table-wrapper" class="table-responsive">
                  <table id="deptosTabla" class="table table-striped table-hover m-0 tabla-data">
                    <thead>
                    <tr>
                      <th>Departamento</th>
                      <th>Diagnosticados</th>
                      <th>En Reparación</th>
                      <th>Finalizados</th>
                      <th>Total Mantenimientos</th>
                    </tr>
                    </thead>
                    <tbody id="reportsTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- ./card-body -->
              <div class="card-footer">
              
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          </div>
        </div>

        

        <div class="row">
          
        </div>
        <!-- /.row -->

        <!-- Main row -->
        <div class="row"></div>
        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  
</div>


<!-- ./wrapper -->

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

<script src="../codigo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/polyfills.umd.js"></script>
<!-- script src="dist/js/jquery.table2excel.js"></script -->

<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>

<!-- AdminLTE App -->
<script src="dist/js/html2pdf.bundle.min.js"></script>
<script src="dist/js/FileSaver.js"></script>
<script lang="javascript" src="dist/js/xlsx.full.min.js"></script>
<script src="dist/js/tableexport.js"></script>
<script src="dist/js/xlsx.core.min.js"></script>

<div class="spinner-border" id="page_loader_afl" style="position: fixed;width: 190px;height: 190px;font-size: 2rem;color: #e7c738;left: 45vw;z-index: 1060;display:none;top: 30%;"></div>

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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- button id="saveChangesButton" type="button" class="btn btn-primary" style="background-color: #1a3c8a;">Guardar Cambios</button -->
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
                  <table id="reportesTabla" class="table table-striped table-hover m-0 tabla-data">
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
                <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">Ver Todas</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- button type="button" class="btn btn-primary" style="background-color: #1a3c8a;">Guardar Cambios</button -->
      </div>
    </div>
  </div>
</div>



<!--Modal para CREAR-->
<div class="modal fade" id="modalCREAR" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="modalCuadro">
            <div class="modal-header"  style="background-color: #1a3c8a;color:white;">
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
            <div class="modal-header"  style="background-color: #1a3c8a;color:white;">
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
            <div class="modal-header" style="background-color: #1a3c8a;color:white;">
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
