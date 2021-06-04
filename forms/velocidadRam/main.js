$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  opcion = 4;
      
  tablaVelocidadRam = $('#tablaVelocidadRam').DataTable({  
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "initComplete": function(settings, json) {
        
      $(".page-link").eq(1).css("background-color", "#1a3c8a");
      $(".page-link").eq(1).css("border-color", "#1a3c8a");

      let editarContainer = document.getElementsByClassName("btnEditar");
        //alert(editarContainer.length)
        for (let index = 0; index < editarContainer.length; index++) {
          const element = editarContainer[index];
          $(".btnEditar").eq(index).addClass("last-col");
          $(".btnBorrar").eq(index).addClass("last-col");
        }
        
  },
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":""
      },
      "columns":[
          {"data": "idVelocidadRam"},
          {"data": "velocidadRam"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-warning btnEditar'><i class='material-icons' id='editar'>edit</i></button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i></button></div></div>" }
      ]
  });     


  //submit para el Alta y Actualización
  $('#formVelocidadRam').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    velocidadRam = $.trim($('#velocidadRam').val());                              
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {id:id, velocidadRam:velocidadRam, opcion:opcion},    
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
              alertify.warning("Esta velocidad ram, ya se encuentra registrada.");
              $('#velocidadRam').focus();
            }
            tablaVelocidadRam.ajax.reload(null, false);
          }
      });			        										     			
  });
        


  //NUEVO    
  $("#btnNuevo").click(function(){
    id=null;
    opcion = 1; //alta
    $("#formVelocidadRam").trigger("reset");
    $('#velocidadRam').focus();
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nuevo Velocidad Ram");          
    $("#modalCRUD").modal("show");       
  });    
    
   
  // EDITAR    
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    id = parseInt(fila.find('td:eq(0)').text());   //ID
    velocidadRam = fila.find('td:eq(1)').text();
      
    $("#velocidadRam").val(velocidadRam);

    opcion = 2; //editar
    
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar Velocidad Ram");            
    $("#modalCRUD").modal("show");     
  });


  //ELIMINAR
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    vRam = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Velocidad Ram: " + vRam);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar Velocidad Ram");            
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
        tablaVelocidadRam.row(fila.parents('tr')).remove().draw();                  
      }
    }); 
  });
     
});    