<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();

?>


<!--header -->
<?php include "../header.php"; ?>

<title>Bitacora Mantenimiento</title>

  <body> 
    <div class="container">
        <header>
          <h1 class="mt-4"><b>Gestión de Bitacora Mantenimiento</b></h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="usuarioINDEX.php">Dashboard</a></li>
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
            <div class="col-lg-12">
            <div class="table-responsive">        
                <table id="tablaBitacoraMant" class="table table-striped table-bordered table-condensed" style="width:100%" >
                    <thead class="text-center">
                        <tr>
                            <th>ID</th>
                            <th>Fecha Cambio Estado</th>     
                            <th>Solicitud Mant.</th>
                            <th>Estado Control Mant.</th>
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

<!--footer -->
<?php include "../footer.php"; ?>