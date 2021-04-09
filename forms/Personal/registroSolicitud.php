<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();

?>


<!--header -->
<?php include "../header.php"; ?>

<title>Registro solicitud matenimiento</title>

  <body> 
    <div class="container">
        <header>
            <h1 class="mt-4"><b>Bienvenido <?php echo $_SESSION["s_usuario"]?> al sistema de </b></h1>
            <h1 class="mt-0"><b>registro de solicitud mantenimiento </b></h1>
       <!--     
            <h2>Usuario: <?php echo $_SESSION["s_idUsuario"]?></h2>
            <h2>Usuario: <?php echo $_SESSION["s_usuario"]?></h2>
            <h2>Estado: <?php echo $_SESSION["s_estadoUsuario"]?></h2>
            <h2>Cod empleado: <?php echo $_SESSION["s_codEmpleado"]?></h2>
        -->
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Registro solicitud mantenimiento</li>
            </ol>
        </header> 
    </div>    
      
    <div class="container">
        <div class="row">
            <div class="col-lg-12">            
                <button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="material-icons" id="nuevo">add_box</i>  | Registrar solicitud</button> 
            </div>    
        </div>    
    </div>    
    <br>  

    <div class="container caja">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">        
                    <table id="tablaSolMant" class="table table-striped table-bordered table-condensed" style="width:100%" >
                        <thead class="text-center">
                            <tr>
                                <th>ID</th>
                                <th>Fecha solicitud</th>     
                                <th>Código equipo</th>     
                                <th>Descripción equipo</th>                
                                <th>Tipo equipo</th>
                                <th>Modelo</th>
                                <th>Service Tag</th>              
                                <th>Descripción falla</th>
                             <!--   <th>Estado solicitud</th>  -->
                                <th>Usuario</th>
                                <th>Estado Solicitud</th>
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
        <div class="modal-content" id="modalCuadro">
            <div class="modal-header">
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
                            <button id="btnBuscar" type="button" class="btn btn-success" data-toggle="modal"><i class="material-icons">search</i>  | Buscar</button>   
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
                        <input type="date" class="form-control" id="fechaSM" required autofocus>
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
            <div class="modal-header">
                <h5 class="modal-titles" id="exampleModalLabel"></h5>
                <button id="btnClose" type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
                <form id="formEquipo">    
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">        
                                    <table id="tablaEquipo" class="table table-striped table-bordered table-condensed" style="width:100%" >
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





<!--footer -->
<?php include "../footer.php"; ?>