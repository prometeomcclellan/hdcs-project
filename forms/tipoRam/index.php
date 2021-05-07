<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();
?>

<!--header -->
<?php include "../header.php"; ?>

<title>Tipo ram</title>
<meta name="keywords" content="Dashboard" />
		<meta name="description" content="CURLP Admin Official Site">
		<meta name="author" content="Omar McClellan, Mapphash Group">

		<!-- Favicon -->
		<link rel="shortcut icon" href="../../favicon.ico" type="image/x-icon" />

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="../../inicio/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../../inicio/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="../../inicio/plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../inicio/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <link rel="stylesheet" href="../../inicio/plugins/sweetalert2/sweetalert2.min.css">
  <body> 
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
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-reverse" style="background-color: #1a3c8a;color:white;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
    <?php
              require_once "../../Mobile_Detect.php";
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
    <a href="../../inicio/dashboard.php" class="brand-link">
<img src="../../inicio/dist/img/AdminLTELogoRedondo.png" alt="HDCS" class="brand-image elevation-3"
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
          <li class="nav-item has-treeview rol-admin">
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
                    Asignación de equipo
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
                    Control de garantía
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/empresaGarantia/index.php" class="nav-link">
                  <i class="nav-icon fas fa-file-signature"></i>
                  <p>
                    Empresa garantía
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/detEquipoComputadora/index.php" class="nav-link">
                  <i class="nav-icon fas fa-tv"></i>
                  <p>
                    Detalle de computadora
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
                    Tipo de disco
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoEquipo/index.php" class="nav-link">
                  <i class="nav-icon fas fa-laptop-house"></i>
                  <p>
                    Tipo de equipo
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
          <div class="dropdown-divider rol-admin"></div>
          <li class="nav-item  has-treeview">
            <a href="" class="nav-link">
              <i class="nav-icon fa fa-users"></i>
              <i class="fas fa-angle-left right"></i>
              <p>
                Usuarios
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item rol-admin">
                <a href="/HDCS/forms/usuario/index.php" class="nav-link">
                <i class="nav-icon fa fa-user"></i>
                <p>
                Usuario
                </p>
                </a>
              </li>
              <li class="nav-item rol-admin">
                <a href="/HDCS/forms/empleado/index.php" class="nav-link">
                <i class="nav-icon fas fa-user-tie"></i>
                <p>
                  Empleados
                </p>
                </a>
              </li>
              <li class="nav-item rol-admin">
                <a href="/HDCS/forms/cargo/index.php" class="nav-link">
                <i class="nav-icon fas fa-user-tag"></i>
                <p>
                  Cargos
                </p>
                </a>
              </li>
              <li class="nav-item rol-tecnico">
                <a href="/HDCS/forms/tecnico/index.php" class="nav-link">
                <i class="nav-icon fas fa-users-cog"></i>
                <p>
                  Técnicos
                </p>
                </a>
              </li>
              <li class="nav-item rol-personal">
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
          <li class="nav-item  has-treeview rol-admin">
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
                    Solicitud mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/controlMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-cog"></i>
                  <p>
                    Control mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/estadoControlMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-hammer"></i>
                  <p>
                    Estado mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/tipoMantenimiento/index.php" class="nav-link">
                  <i class="nav-icon fas fa-cogs"></i>
                  <p>
                    Tipo mantenimiento
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/HDCS/forms/audiLog/index.php" class="nav-link">
                  <i class="nav-icon fa fa-book"></i>
                  <p>
                    Control de auditorías
                  </p>
                </a>
              </li>
              
            </ul>
          </li>
          <div class="dropdown-divider rol-admin"></div>
          <li class="nav-item rol-admin">
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
              echo "<a href='reporteria.php' class='nav-link rol-admin'>";
            }else{
              echo "<a href='../../inicio/reporteria.php' class='nav-link rol-admin'>";
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
              require_once "../../Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
// Any mobile device (phones or tablets).
if ( $detect->isMobile() ) {
  
    echo "<div id='dWrapper' class='wrapper' style='width: 100%;float:right;'>";
}else{
  echo "<div id='dWrapper' class='wrapper' style='width: 80%;float:right;'>";
}
          ?> 
    <div class="container">
        <header>
          <h1 class="mt-4"><b>Gestión tipo de memoria ram</b></h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="../../inicio/dashboard.php">Dashboard</a></li>
              <li class="breadcrumb-item active">Tipo ram</li>
            </ol>
        </header> 
    </div>    
      
    <div class="container">
        <div class="row">
            <div class="col-lg-12">            
                <button id="btnNuevo" type="button" class="btn btn-warning" data-toggle="modal"><i class="material-icons" id="nuevo">add_box</i>  | Nuevo</button> 
            </div>    
        </div>    
    </div>    
    <br>  
    <style>
#tablaTipoRam > thead {
  background : #1a3c8a;
}
</style>
    <div class="container caja">
        <div class="row">
            <div class="col-lg-12 print-container">
            <input type="hidden" class="file-title" value="tipo-ram-fecha-">
            <h1 type="hidden" class="documento-title" style="display:none;">Tipo Ram, Fecha</h1>
            <div class="table-responsive">        
                <table id="tablaTipoRam" class="table table-striped table-bordered table-condensed tabla-data" style="width:100%" >
                    <thead class="text-center">
                        <tr>
                            <th>ID</th>
                            <th>Tipo ram</th>                    
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>                           
                    </tbody>        
                </table>               
            </div>
            </div>
        </div>  
    </div>   

<footer>
    <div class="container foot">
        <footer class="py-4 bg-light mt-auto ">
            <div class="container-fluid ">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>                  
                        <div>
                            <a href="https://curlp.unah.edu.hn/" target="unah">UNAH-CURLP</a>
                            &middot;
                            <a href="https://www.unah.edu.hn/" target="unah">UNAH-HN</a>
                        </div>
                </div>
            </div>
        </footer>
    </div>
</footer>

<!--Modal para CRUD-->
<div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
        <form id="formTipoRam">    
            <div class="modal-body">
                <div class="form-group">
                <label for="nombre" class="col-form-label">Tipo ram:</label>
                <input type="text" class="form-control capitalize" id="tipoRam" required>
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

<!-- Modal DELETE-->
<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog"  role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: red; color:white;">
                <h5 class="modal-title"  id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
        <form id="formEliminar">
            <div class="modal-body">
                <p> Confirme la eliminación del registro: </p>
                <b><div id="panel_eliminar"></div></b>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                <button type="submit" id="btnEliminar" class="btn btn-danger"> Confirmar </button>
            </div>
        </form> 
        </div>
    </div>
</div>
<?php
    require_once "../../Mobile_Detect.php";
    $detect = new Mobile_Detect;
  if ( $detect->isMobile() ) {
    echo "<div class='spinner-border' id='page_loader' style='position: fixed;width: 190px;height: 190px;font-size: 2rem;color: #e7c738;left: 25vw;z-index: 1060;display:inherit;top: 40%;'></div>";
  }else{
    echo "<div class='spinner-border' id='page_loader' style='position: fixed;width: 190px;height: 190px;font-size: 2rem;color: #e7c738;left: 45vw;z-index: 1060;display:inherit;top: 30%;'></div>";
  }
?>
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="../../inicio/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../inicio/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="../../inicio/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- Toastr -->
<script src="../../inicio/plugins/toastr/toastr.min.js"></script>
<!-- AdminLTE App -->
<script src="../../inicio/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="../../inicio/dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="../../inicio/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="../../inicio/plugins/raphael/raphael.min.js"></script>
<script src="../../inicio/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="../../inicio/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="../../inicio/plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->

     <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>    
     <script src="../../assets/popper/popper.min.js"></script>    
        
     <script src="../../assets/plugins/sweetalert2/sweetalert2.all.min.js"></script>
     <script src="../../inicio/dist/js/html2pdf.bundle.min.js"></script>
<script src="../../inicio/dist/js/FileSaver.js"></script>
<script lang="javascript" src="../../inicio/dist/js/xlsx.full.min.js"></script>
<script src="../../inicio/dist/js/tableexport.js"></script>
<script src="../../inicio/dist/js/xlsx.core.min.js"></script>
<script src="../../codigo.js"></script>
<!--footer -->
<?php include "../footer.php"; ?>
