<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();

?>


<!--header -->
<?php include "../header.php"; ?>

<title>HDCS | Reportería</title>
<meta name="keywords" content="Dashboard" />
		<meta name="description" content="CURLP Admin Official Site">
		<meta name="author" content="Omar McClellan, Mapphash Group">

		<!-- Favicon -->
		<link rel="shortcut icon" href="../../../favicon.ico" type="image/x-icon" />

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
  <nav class="main-header navbar navbar-expand navbar-dark navbar-reverse gradiente-horizontal">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
    <?php
              require_once "../../Mobile_Detect.php";
              $detect = new Mobile_Detect;
 
// Any mobile device (phones or tablets).
if ( $detect->isMobile() ) {
  echo "<li id='sbarTogglerM' class='nav-item'>";
}else{
  echo "<li id='sbarToggler' class='nav-item'>";
}
          ?>
      
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../inicio/dashboard.php" class="nav-link">Inicio</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contacto</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Buscar" aria-label="Buscar">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../inicio/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../inicio/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../inicio/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
          <a href="https://app.chaport.com/#/chats" target="blank"
          class="dropdown-item dropdown-footer">Chaport Mensajería</a>
        </div>
          
          

      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown rol-admin">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-danger navbar-badge notificaciones-conteo"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right menu-notificaciones">
          <span class="dropdown-item dropdown-header"> <span class="conteo-notificaciones"></span> Notificaciones</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item notificacion" data-toggle="modal" data-target="#nuevasModal">
            <i class="fas fa-file mr-2"></i> <span class="conteo-diagnosticados"></span> nuevas órdenes
            <span class="float-right text-muted text-sm"> <span class="tiempo-diagnosticados">0 días</span></span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">Ver diagnósticos</a>
        </div>
      </li>
      <!-- li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li -->
      <li class="nav-item dropdown">
        <a id="logoutButtonE" class="nav-link logout-button" data-toggle="dropdown" href="#">
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
        
        <i id="eIconoUsuario" class="fas fa-user" style="background-color: white;font-size: 2rem;padding: 5px;border-radius: 50%;width: 42px;height: 42px;color: #3c3a3a;text-align: center;"></i>
        </a>
        
          <img id="eFotoDeUsuario" class="img-circle elevation-2" alt="" style="display:none;width:50px;height:50px;background-size:cover;backgrouposition:center;">
        </div>
        <div class="info">
          <a id="eUsuarioNombreN" href="#" class="d-block user-info" data-toggle="modal" data-target="#editUserModal"></a>
          
        </div>

        

      </div>

      

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">  
          <li class="nav-item">
            <a href="/HDCS/forms/equipo/index.php" class="nav-link">
              <i class="nav-icon fas fa-tag"></i>
              <p>
                Inventario
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/HDCS/forms/usuario/index.php" class="nav-link">
              <i class="nav-icon fa fa-users"></i>
              <p>
                Usuarios
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/HDCS/forms/departamento/index.php" class="nav-link">
              <i class="nav-icon fas fa-network-wired"></i>
              <p>
                Departamentos
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
  
    echo "<div id='wrapper' class='wrapper' style='width: 100%;float:right;'>";
}else{
  echo "<div id='wrapper' class='wrapper' style='width: 80%;float:right;'>";
}
          ?>
    <div class="container">
        <header>
          <h1 class="mt-4"><b>Reportería de Mantenimientos</b></h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="../../inicio/dashboard.php">Dashboard</a></li>
              <li class="breadcrumb-item active">Bitacora Mantenimiento</li>
            </ol>
        </header> 
    </div>    
      
    <div class="container">
        <div class="row">
            <div class="col-lg-12">            
                <button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="material-icons" id="nuevo">add_box</i>  | Nuevo</button> 
            </div>    
        </div>    
    </div>    
    <br>  

    <div class="container caja">
        <div class="row">
        
        </div>  
    </div>   

<footer>
    <div class="container foot">
        <footer class="py-4 bg-light mt-auto ">
            <div class="container-fluid ">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; CURLP-UNAH 2021</div>                  
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
    

<!--Modal nuevas solicitudes-->
<div class="modal fade" id="nuevasModal" tabindex="-1" role="dialog" aria-labelledby="nuevasModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #1a3c8a;color: white;">
        <h5 class="modal-title" id="nuevasModalLabel">Nuevas Solicitudes <span id="tipoMantenimiento"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
        style="color:white;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- TABLE: LATEST ORDERS -->
        <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Solicitudes Filtradas</h3>

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

              #nuevasTable > tr {
                cursor: pointer;
                }
              </style>
              <div class="card-body p-0">
                <div id="table-wrapper" class="table-responsive">
                  <table id="nuevasTabla" class="table table-striped table-hover m-0">
                    <thead>
                    <tr>
                      <th>Número solicitud</th>
                      <th>Equipo</th>
                      <th>Estado</th>
                      <th>Fecha solicitud</th>
                      <th>Usuario creador</th>
                    </tr>
                    </thead>
                    <tbody id="nuevasTable"></tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a id="verNuevasBoton" href="javascript:void(0)" class="btn btn-sm btn-secondary float-right ver-nuevas">Asignar Mantenimientos</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        <!-- button type="button" class="btn btn-primary" style="background-color: #1a3c8a;">Guardar Cambios</button -->
      </div>
    </div>
  </div>
</div>


<!--Modal para CREAR-->
<div class="modal fade" id="modalCREAR" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formBitacoraMantC">    
                <div class="modal-body">

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Fecha Cambio Estado:</label>
                        <input type="date" class="form-control" id="fechaCambioEstadoC" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Solicitud Mantenimiento:</label>

                        <select class="form-control" name="select_SolicitudMantC" id="select_SolicitudMantC" required>
                            <option value="">Seleccione..</option>
                            <?php
                                require_once '../../bd/conexion.php';
                                $objeto = new Conexion();
                                $conexion = $objeto->Conectar();

                                $consulta = "CALL sp_mostrarSolicitudM()";
                                $resultado = $conexion->prepare($consulta);
                                $resultado->execute();  
                                $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                        
                                foreach($data as $dat) {     
                                    echo "<option value=".$dat["idSolicitudMantenimiento"]." class='form-control'>".$dat['fechaSolicitudMantenimiento']."</option>";
                                }
                            ?>        
                        </select>
                    </div>     


                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Estado Control Mantenimiento:</label>

                        <select class="form-control" name="select_estadoControlMantC" id="select_estadoControlMantC" required>
                            <option value="">Seleccione..</option>
                            <?php
                                require_once '../../bd/conexion.php';
                                $objeto = new Conexion();
                                $conexion = $objeto->Conectar();

                                $consulta = "CALL sp_mostrarEstadoControlMant()";
                                $resultado = $conexion->prepare($consulta);
                                $resultado->execute();  
                                $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                        
                                foreach($data as $dat) {     
                                    echo "<option value=".$dat["idEstadoControlMantenimiento"]." class='form-control'>".$dat['estadoControlMantenimiento']."</option>";
                                }
                            ?>        
                        </select>
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






<!--Modal para UPDATE-->
<div class="modal fade" id="modalUPDATE" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formBitacoraMantU">    
                <div class="modal-body">

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Fecha Cambio Estado:</label>
                        <input type="date" class="form-control" id="fechaCambioEstadoU" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Solicitud Mantenimiento:</label>

                        <select class="form-control" name="select_SolicitudMantU" id="select_SolicitudMantU" required>
                            <?php
                                require_once '../../bd/conexion.php';
                                $objeto = new Conexion();
                                $conexion = $objeto->Conectar();

                                $consulta = "CALL sp_mostrarSolicitudM()";
                                $resultado = $conexion->prepare($consulta);
                                $resultado->execute();  
                                $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                        
                                foreach($data as $dat) {     
                                    echo "<option value=".$dat["idSolicitudMantenimiento"]." class='form-control'>".$dat['fechaSolicitudMantenimiento']."</option>";
                                }
                            ?>        
                        </select>
                    </div>     


                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Estado Control Mantenimiento:</label>

                        <select class="form-control" name="select_estadoControlMantU" id="select_estadoControlMantU" required>
                            <?php
                                require_once '../../bd/conexion.php';
                                $objeto = new Conexion();
                                $conexion = $objeto->Conectar();

                                $consulta = "CALL sp_mostrarEstadoControlMant()";
                                $resultado = $conexion->prepare($consulta);
                                $resultado->execute();  
                                $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                        
                                foreach($data as $dat) {     
                                    echo "<option value=".$dat["idEstadoControlMantenimiento"]." class='form-control'>".$dat['estadoControlMantenimiento']."</option>";
                                }
                            ?>        
                        </select>
                    </div> 

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                    <button type="submit" id="btnGuardarU" class="btn btn-dark">Guardar</button>
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
                <button type="button" class="close"   style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
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

<script src="../../codigo.js"></script>
<script src="main.js"></script>



<!--footer -->
<?php include "../footer.php"; ?>