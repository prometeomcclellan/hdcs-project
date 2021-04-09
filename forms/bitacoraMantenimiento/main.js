$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionarioSolicitudMant = [];
var diccionarioEstadoMant = [];
opcion = 4;

//Consulta a la tabla empleado   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioSolicitudMant = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

  //Consulta a la tabla tipo mantenimiento  
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:6},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioEstadoMant = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });



//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaBitacoraMant = $('#tablaBitacoraMant').DataTable({  
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
          {"data": "idBitacora"},
          {"data": "fechaCambioEstado"},
          {"data": "fechaSolicitudMantenimiento"},
          {"data": "estadoControlMantenimiento"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-primary btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ]
  });  



    



  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formBitacoraMantC").trigger("reset");
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Control de Mantenimiento");          
    $("#modalCREAR").modal("show");       
  });   


    //submit para el alta
  $('#formBitacoraMantC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _fechaCambioEstado = $.trim($('#fechaCambioEstadoC').val()); 
    _selectSolicitudMant = $.trim($('#select_SolicitudMantC').val() || []);  
    _selectEstadoControlMant = $.trim($('#select_estadoControlMantC').val() || []); 

    //alert(_fechaControl); 
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {fechaCambioEstado:_fechaCambioEstado, selectSolicitudMant:_selectSolicitudMant, selectEstadoControlMant:_selectEstadoControlMant, opcion:opcion},    

          success: function(data) {
          console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
            }
            tablaBitacoraMant.ajax.reload(null, false);
          }
      });                                             
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idBitacoraMantU = parseInt(fila.find('td:eq(0)').text());   //ID
    _fechaCambioEstadoU = fila.find('td:eq(1)').text();
    _selectSolicitudMantU = fila.find('td:eq(2)').text();
    _selectEstadoControlMantU = fila.find('td:eq(3)').text();

  
    opcion = 2; //editar
    $("#fechaCambioEstadoU").val(_fechaCambioEstadoU);

    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Bitacora de Mantenimiento");
    $("#modalUPDATE").modal("show"); 
    

    //for, que permite el llenado del select de Empleado
    //console.log(diccionarioSolicitudMant.length);
    for (let index = 0; index < diccionarioSolicitudMant.length; index++) {
      const element = diccionarioSolicitudMant[index];
      console.dir(diccionarioSolicitudMant);

      let solMantId = element.idSolicitudMantenimiento;
      let fechaSolMant = element.fechaSolicitudMantenimiento;

      if (_selectSolicitudMantU.toString().trim() == fechaSolMant.toString().trim()) {
        let element = document.getElementById("select_SolicitudMantU");
        element.value = solMantId;  // asigna el empleadoCod al element.value
      }
    }

    //for, que permite el llenado del select de Tipo Mantenimiento
    //console.log(diccionarioEstadoMant.length);
    for (let index = 0; index < diccionarioEstadoMant.length; index++) {
      const element = diccionarioEstadoMant[index];
      console.dir(diccionarioEstadoMant);

      let estadoCMantId = element.idEstadoControlMantenimiento;
      let estadoCMantNombre = element.estadoControlMantenimiento;
      
      if (_selectEstadoControlMantU.toString().trim() == estadoCMantNombre.toString().trim()) {
        let element = document.getElementById("select_estadoControlMantU");
        element.value = estadoCMantId;  // asigna el idTipoMantenimiento al element.value
      }
    }
   
  });


    //submit para la Actualización
  $('#formBitacoraMantU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _fechaCambioEstadoU = $.trim($('#fechaCambioEstadoU').val()); 
    _selectSolicitudMantU = $.trim($('#select_SolicitudMantU').val() || []);  
    _selectestadoControlMantU = $.trim($('#select_estadoControlMantU').val() || []); 

    //alert(_idControlMantU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idBitacoraMant:_idBitacoraMantU, fechaCambioEstado:_fechaCambioEstadoU, selectSolicitudMant:_selectSolicitudMantU, selectEstadoControlMant:_selectestadoControlMantU, opcion:opcion},   

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              $('#modalUPDATE').modal('hide');
            }
            tablaBitacoraMant.ajax.reload(null, false);
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _idBitacoraMant = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _fechaCambioEstado = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Fecha cambio estado: " + _fechaCambioEstado);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Bitacora de Mantenimiento");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idBitacoraMant:_idBitacoraMant},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaBitacoraMant.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    