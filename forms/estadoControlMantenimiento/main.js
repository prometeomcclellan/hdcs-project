$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  opcion = 4;
    
  tablaEstadoControlMantenimiento = $('#tablaEstadoControlMantenimiento').DataTable({  
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "initComplete": function(settings, json) {
        
      $(".page-link").eq(1).css("background-color", "#1a3c8a");
      $(".page-link").eq(1).css("border-color", "#1a3c8a");
  },
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":""
      },
      "columns":[
          {"data": "idEstadoControlMantenimiento"},
          {"data": "estadoControlMantenimiento"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-warning btnEditar'><i class='material-icons' >edit</i></button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i></button></div></div>" }
      ]
  });     


  //submit para el Alta y Actualización
  $('#formEstadoControlMantenimiento').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    estadoControlMantenimiento = $.trim($('#estadoControlMantenimiento').val());                            
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {id:id, estadoControlMantenimiento:estadoControlMantenimiento, opcion:opcion},    
          success: function(data) {
          //console.log(data);
            if(data == 0){
              if(opcion == 1){
                alertify.success("Registro agregado satisfactoriamente.");
              }else{
                alertify.success("Registro actualizado satisfactoriamente.");
              }
              $('#modalCRUD').modal('hide');
            }else{
              alertify.warning("Este estado control mantenimiento, ya se encuentra registrado.");
              $('#estadoControlMantenimiento').focus();
            }
            tablaEstadoControlMantenimiento.ajax.reload(null, false);
          }
      });			        										     			
  });
        

  //NUEVO    
  $("#btnNuevo").click(function(){
    id=null;
    opcion = 1; //alta
    $("#formEstadoControlMantenimiento").trigger("reset");
    $('#estadoControlMantenimiento').focus();
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Estado Control Mantenimiento");          
    $("#modalCRUD").modal("show");       
  });    
    
  
  // EDITAR    
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    id = parseInt(fila.find('td:eq(0)').text());   //ID
    estadoControlMantenimiento = fila.find('td:eq(1)').text();

    opcion = 2; //editar

    $("#estadoControlMantenimiento").val(estadoControlMantenimiento);
    
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Estado Control Mantenimiento");            
    $("#modalCRUD").modal("show");     
  });


  //ELIMINAR
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    eCM = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Estado Control Mantenimiento: " + eCM);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Estado Control Mantenimiento");            
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
        alertify.warning("Registro eliminado satisfactoriamente.");
        tablaEstadoControlMantenimiento.row(fila.parents('tr')).remove().draw();                  
      }
    }); 
  });
     
});    