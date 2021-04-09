$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  opcion = 4;

      
  tablaEmpresa = $('#tablaEmpresa').DataTable({  
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
      
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":""
      },
      "columns":[
          {"data": "idEmpresa"},
          {"data": "nombreEmpresa"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btnEditar'><i class='material-icons' >edit</i> |  Editar</button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i> |  Eliminar</button></div></div>" }
      ]
  });     


  //submit para el Alta y Actualización
  $('#formEmpresaGarantia').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    _empresa = $.trim($('#empresa').val());  


      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {id:id, nombreEmpresa:_empresa, opcion:opcion}, 
          success: function(data) {
           //console.log(data);
            if(data == 0){
              if(opcion == 1){
                alertify.success("Registro agregado satisfactoriamente.");
              }else{
                alertify.success("Registro actualizado satisfactoriamente.");
              }
              $('#modalCRUD').modal('hide');
              tablaEmpresa.ajax.reload(null, false);
            }else{
              alertify.warning("Esta empresa, ya se encuentra registrada.");
              $('#marca').focus();
            }
          }
      });			        											     			
  });
        

  //NUEVO    
  $("#btnNuevo").click(function(){
    id=null;
    opcion = 1; //alta
    $("#formEmpresaGarantia").trigger("reset");
    $('#marca').focus();
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nueva Empresa de garantía");          
    $("#modalCRUD").modal("show");       
  });    
    
  
  // EDITAR    
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    id = parseInt(fila.find('td:eq(0)').text());   //ID
    _empresa = fila.find('td:eq(1)').text();

    opcion = 2; //editar

    $("#empresa").val(_empresa);

    
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar empresa de garantía");            
    $("#modalCRUD").modal("show");      
  });


//ELIMINAR
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    empresa = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Nombre de empresa: " + empresa);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar empresa de garantía");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
    e.preventDefault();
    $.ajax({
      url: "crud.php",
      type: "POST",
      datatype:"json",    
      data:  {opcion:opcion, id:id},    
      success: function(data) {
        $("#modalEliminar").modal("hide");
        alertify.success("Registro eliminado satisfactoriamente.");
        tablaEmpresa.row(fila.parents('tr')).remove().draw();                  
      }
    }); 
  });
     
});    