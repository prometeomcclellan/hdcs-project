<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();

?>


<!--header -->
<?php include "../forms/header.php"; ?>

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
  <link rel="stylesheet" href="../../plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <link rel="stylesheet" href="assets/plugins/sweetalert2/sweetalert2.min.css">

  <body> 
    <div class="container">
        <header>
          <h1 class="mt-4"><b>Gestión de equipo</b></h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="usuarioINDEX.php">Dashboard</a></li>
              <li class="breadcrumb-item active">Equipo</li>
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
            <div class="col-lg-12">
            <div class="table-responsive">        
                <table id="tablaEquipo" class="table table-striped table-bordered table-condensed" style="width:100%" >
                    <thead class="text-center">
                        <tr>
                            <th>Código equipo</th>
                            <th>N° de inventario</th>
                            <th>Tipo equipo</th>     
                            <th>Modelo</th>                
                            <th>Serie</th>
                            <th>Service tag</th>
                            <th>Descripción</th>
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
    




<!--Modal para CREAR-->
<div class="modal fade" id="modalCREAR" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formEquipoC">    
                <div class="modal-body">


                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Código equipo:</label>
                                <input type="text" class="form-control" id="codEquipo" required autofocus>
                            </div>  
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">N° de inventario:</label>
                                <input type="text" class="form-control" id="numInventario" required>
                            </div>                            
                        </div>    
                    </div> 

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Tipo equipo:</label>

                        <select class="form-control" name="select_TipoEquipo" id="select_TipoEquipo" required>
                            <option value="">Seleccione..</option>
                                <?php
                                    require_once '../../bd/conexion.php';
                                    $objeto = new Conexion();
                                    $conexion = $objeto->Conectar();

                                    $consulta = "CALL sp_mostrarTipoEquipo()";
                                    $resultado = $conexion->prepare($consulta);
                                    $resultado->execute();  
                                    $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                    foreach($data as $dat) {     
                                        echo "<option value=".$dat["idTipoEquipo"]." class='form-control tipo-input'>".$dat['tipoEquipo']."</option>";
                                    }
                                ?>        
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Descripción:</label>
                        <textarea  type="text" class="form-control capitalize" id="descripcion" required></textarea>
                    </div> 

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Marca:</label>

                                <select class="form-control" name="select_marca" id="select_marca"  required>
                                    <option value="">Seleccione..</option>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarMarca()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idMarca"]." class='form-control'>".$dat['marca']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Modelo:</label>

                                <select class="form-control" name="select_Modelo" id="select_Modelo"  required>
                                    <option value="">Seleccione..</option>
        
                                </select>
                            </div>
                        </div>    
                    </div> 

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Serie:</label>
                                <input type="text" class="form-control" id="serie" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Service tag:</label>
                                <input type="text" class="form-control" id="serviceTag">
                            </div>
                        </div>    
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
            <form id="formEquipoU">    
                <div class="modal-body">


                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Código equipo:</label>
                                <input type="text" class="form-control" id="codEquipoU" required autofocus>
                            </div>  
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">N° de inventario:</label>
                                <input type="text" class="form-control" id="numInventarioU" required>
                            </div>                            
                        </div>    
                    </div> 

                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Descripción:</label>
                        <textarea type="text" class="form-control" id="descripcionU" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Tipo equipo:</label>

                                <select class="form-control" name="select_TipoEquipoU" id="select_TipoEquipoU" required>
                                    <option value="">Seleccione..</option>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarTipoEquipo()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idTipoEquipo"]." class='form-control'>".$dat['tipoEquipo']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Modelo:</label>

                                <select class="form-control" name="select_ModeloU" id="select_ModeloU" disabled="true" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarModelo()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idModelo"]." class='form-control'>".$dat['modelo']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>    
                    </div> 

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Serie:</label>
                                <input type="text" class="form-control" id="serieU" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Service tag:</label>
                                <input type="text" class="form-control" id="serviceTagU">
                            </div>
                        </div>    
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


<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->




<!--Modal al agregar un equipo si es computadora-->
<div class="modal fade" id="modalPregunta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-titleP" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
        <form id="formMADC">    
            <div class="modal-body">

                <div class="form-group">
                <label for="nombre" class="col-form-label">      ¿Desea agregar detalles a la computadora?</label>
                </div>

            </div>
            <div class="modal-footer">
                <button type="submit" id="btnGuardarSI" class="btn btn-dark">Si</button>
                <button type="button" id="btnGuardarNO" class="btn btn-dark" data-dismiss="modal">No</button>
            </div>
        </form>    
        </div>
    </div>
</div>  



<!--Modal para de Llanar detalle equipo computadora si la respuesta a la pregunta es SI-->
<div class="modal fade" id="modalDetalleEquipoCompu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formDetalleEquipo">    
                <div class="modal-body">

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Código equipo:</label>
                                <input type="text" class="form-control" id="codEquipoP" disabled="true">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Tipo equipo:</label>
                                <input type="text" class="form-control" id="tipoEquipoP" disabled="true">
                            </div>
                        </div>
                    </div> 



                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Modelo:</label>
                                <input type="text" class="form-control" id="modeloP" disabled="true">
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Tipo ram:</label>

                                <select class="form-control" name="select_TipoRamP" id="select_TipoRamP" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarTipoRam()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idTipoRam"]." class='form-control'>".$dat['tipoRam']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>    
                    </div>



                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Capacidad ram:</label>

                                <select class="form-control" name="select_CapacidadRamP" id="select_CapacidadRamP" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarCapacidad()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idCapacidad"]." class='form-control'>".$dat['capacidad']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Velocidad ram:</label>

                                <select class="form-control" name="select_VelocidadRamP" id="select_VelocidadRamP" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarVelocidadRam()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idVelocidadRam"]." class='form-control'>".$dat['velocidadRam']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>    
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Tipo disco:</label>

                                <select class="form-control" name="select_TipoDiscoP" id="select_TipoDiscoP" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarTipoDisco()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idTipoDisco"]." class='form-control'>".$dat['tipoDisco']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Capacidad disco:</label>

                                <select class="form-control" name="select_CapacidadDiscoP" id="select_CapacidadDiscoP" required>
                                        <?php
                                            require_once '../../bd/conexion.php';
                                            $objeto = new Conexion();
                                            $conexion = $objeto->Conectar();

                                            $consulta = "CALL sp_mostrarCapacidad()";
                                            $resultado = $conexion->prepare($consulta);
                                            $resultado->execute();  
                                            $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
                    
                                            foreach($data as $dat) {     
                                                echo "<option value=".$dat["idCapacidad"]." class='form-control'>".$dat['capacidad']."</option>";
                                            }
                                        ?>        
                                </select>
                            </div>
                        </div>    
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                    <button type="submit" id="btnGuardarDetalleEquipo" class="btn btn-dark">Guardar</button>
                </div>
            </form>    
        </div>
    </div>
</div> 

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- Toastr -->
<script src="../../plugins/toastr/toastr.min.js"></script>
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
<script src="../../inicio/plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="dist/js/pages/dashboard2.js"></script>

     <script src="assets/bootstrap/js/bootstrap.min.js"></script>    
     <script src="assets/popper/popper.min.js"></script>    
        
     <script src="assets/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<script src="../HDCS/codigo.js"></script>


<!--footer -->
<?php include "../forms/footer.php"; ?>