<!-- Esta parte de codigo de php, evita el poder abrir la pagina despues de hacer cerrado sesión -->
<?php 
session_start();
?>


<!--header -->
<?php include "../header.php"; ?>

<title>Auditoría</title>

  <body> 
    <div class="container">
        <header>
          <h1 class="mt-4"><b>Control de auditoría</b></h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="usuarioINDEX.php">Dashboard</a></li>
              <li class="breadcrumb-item active">Auditoría</li>
            </ol>
        </header> 
    </div>    
      
   
    <br>  

    <div class="container caja">
        <div class="row">
            <div class="col-lg-12">
            <div class="table-responsive">        
                <table id="tablaAuditoria" class="table table-striped table-bordered table-condensed" style="width:100%" >
                    <thead class="text-center">
                        <tr>
                            <th>ID</th>
                            <th>Fecha evento</th> 
                            <th>Usuario</th>                   
                            <th>Tipo transacción</th>
                            <th>Descripción</th>
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


<!--footer -->
<?php include "../footer.php"; ?>