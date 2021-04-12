$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar

var diccionarioEquipo = [];
var diccionarioTipoRam = [];
var diccionarioCapacidad = [];
var diccionarioVelRam = [];
var diccionarioTipoDisco = [];
var diccionarioCapDisco = [];

opcion = 4;


      //Consulta a la tabla Equipo
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log((data));
      diccionarioEquipo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

    //Consulta a la tabla Tipo Ram
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:6},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log((data));
      diccionarioTipoRam = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

  //Consulta a la tabla Capacidad  
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:7},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioCapacidad = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });



//Consulta a la tabla Velocidad Ram   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:8},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioVelRam = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });



    //Consulta a la tabla Tipo Disco
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:9},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log((data));
      diccionarioTipoDisco = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });






//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaDetalleEquipo = $('#tablaDetalleEquipo').DataTable({  
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
          {"data": "codEquipo"},
          {"data": "tipoRam"},
          {"data": "capacidad"},
          {"data": "velocidadRam"},
          {"data": "tipoDisco"},
          {"data": "capacidad"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ]
  });  



    



  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formDetalleEquipoC").trigger("reset");
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Detalle de Equipo");          
    $("#modalCREAR").modal("show");       
  });   


    //submit para el alta
  $('#formDetalleEquipoC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _select_CodEquipo = $.trim($('#select_CodEquipo').val() || []); 
    _select_TipoRam = $.trim($('#select_TipoRam').val() || []);  
    _select_CapacidadRam = $.trim($('#select_CapacidadRam').val() || []); 
    _select_VelocidadRam = $.trim($('#select_VelocidadRam').val() || []); 
    _select_TipoDisco = $.trim($('#select_TipoDisco').val() || []); 
    _select_CapacidadDisco = $.trim($('#select_CapacidadDisco').val() || []); 


      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEquipo:_select_CodEquipo, select_TipoRam:_select_TipoRam, select_CapacidadRam:_select_CapacidadRam, select_VelocidadRam:_select_VelocidadRam, select_TipoDisco:_select_TipoDisco, select_CapacidadDisco:_select_CapacidadDisco, opcion:opcion},    

          success: function(data) {
          console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
            }else{
              alertify.warning("Este código de equipo, ya se encuentra registrado.");
              $('#select_CodEquipo').focus();
            }
            tablaDetalleEquipo.ajax.reload(null, false);
          }
      });                                             
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _codEquipo = parseInt(fila.find('td:eq(0)').text());   //ID
    _tipoRam = fila.find('td:eq(1)').text();
    _capacidadRam = fila.find('td:eq(2)').text();
    _velocidadRam = fila.find('td:eq(3)').text();
    _tipoDisco = fila.find('td:eq(4)').text();
    _capacidadDisco = fila.find('td:eq(5)').text();
  
    opcion = 2; //editar

    //alert(_tipoDisco);

    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Detalle de Equipo");
    $("#modalUPDATE").modal("show"); 


    //for, que permite el llenado del select de Equipo
    //console.log(diccionarioEquipo.length);
    for (let index = 0; index < diccionarioEquipo.length; index++) {
      const element = diccionarioEquipo[index];
      console.dir(diccionarioEquipo);

      let equipoCod = element.codEquipo;

      if (_codEquipo.toString().trim() == equipoCod.toString().trim()) {
        let element = document.getElementById("select_CodEquipoU");
        element.value = equipoCod;  // asigna el equipoCod al element.value
      }
    }

    //alert("obteniendo variable:"+_codEquipo);
    //alert("variable del for:"+equipoCod);


    //for, que permite el llenado del select de Tipo Ram
    //console.log(diccionarioTipoRam.length);
    for (let index = 0; index < diccionarioTipoRam.length; index++) {
      const element = diccionarioTipoRam[index];
      console.dir(diccionarioTipoRam);

      let tipoRamId = element.idTipoRam;
      let tipoRamNombre = element.tipoRam;

      if (_tipoRam.toString().trim() == tipoRamNombre.toString().trim()) {
        let element = document.getElementById("select_TipoRamU");
        element.value = tipoRamId;  // asigna el tipoRamId al element.value
      }
    }


    //for, que permite el llenado del select de Capacidad Ram
    //console.log(diccionarioCapacidad.length);
    for (let index = 0; index < diccionarioCapacidad.length; index++) {
      const element = diccionarioCapacidad[index];
      console.dir(diccionarioCapacidad);

      let capcidadId = element.idCapacidad;
      let capacidadNombre = element.capacidad;

      if (_capacidadRam.toString().trim() == capacidadNombre.toString().trim()) {
        let element = document.getElementById("select_CapacidadRamU");
        element.value = capcidadId;  // asigna el capcidadId al element.value
      }
    }


    //for, que permite el llenado del select de Velocidad Ram
    //console.log(diccionarioVelRam.length);
    for (let index = 0; index < diccionarioVelRam.length; index++) {
      const element = diccionarioVelRam[index];
      console.dir(diccionarioVelRam);

      let velocidadRamId = element.idVelocidadRam;
      let velocidadRamNombre = element.velocidadRam;

      if (_velocidadRam.toString().trim() == velocidadRamNombre.toString().trim()) {
        let element = document.getElementById("select_VelocidadRamU");
        element.value = velocidadRamId;  // asigna el velocidadRamId al element.value
      }
    }


    //for, que permite el llenado del select de Tipo Disco
    //console.log(diccionarioVelRam.length);
    for (let index = 0; index < diccionarioTipoDisco.length; index++) {
      const element = diccionarioTipoDisco[index];
      console.dir(diccionarioTipoDisco);

      let tipoDiscoId = element.idTipoDisco;
      let tipoDiscoNombre = element.tipoDisco;

      if (_tipoDisco.toString().trim() == tipoDiscoNombre.toString().trim()) {
        let element = document.getElementById("select_TipoDiscoU");
        element.value = tipoDiscoId;  // asigna el tipoDiscoId al element.value
      }
    }


    //for, que permite el llenado del select de Capacidad Disco
    //console.log(diccionarioCapacidad.length);
    for (let index = 0; index < diccionarioCapacidad.length; index++) {
      const element = diccionarioCapacidad[index];
      console.dir(diccionarioCapacidad);

      let capcidadId = element.idCapacidad;
      let capacidadNombre = element.capacidad;

      if (_capacidadDisco.toString().trim() == capacidadNombre.toString().trim()) {
        let element = document.getElementById("select_CapacidadDiscoU");
        element.value = capcidadId;  // asigna el capcidadId al element.value
      }
    }

  });


    //submit para la Actualización
  $('#formDetalleEquipoU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _select_CodEquipo = $.trim($('#select_CodEquipoU').val() || []); 
    _select_TipoRam = $.trim($('#select_TipoRamU').val() || []);  
    _select_CapacidadRam = $.trim($('#select_CapacidadRamU').val() || []); 
    _select_VelocidadRam = $.trim($('#select_VelocidadRamU').val() || []); 
    _select_TipoDisco = $.trim($('#select_TipoDiscoU').val() || []); 
    _select_CapacidadDisco = $.trim($('#select_CapacidadDiscoU').val() || []); 

    //alert(_idControlMantU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEquipo:_select_CodEquipo, select_TipoRam:_select_TipoRam, select_CapacidadRam:_select_CapacidadRam, select_VelocidadRam:_select_VelocidadRam, select_TipoDisco:_select_TipoDisco, select_CapacidadDisco:_select_CapacidadDisco, opcion:opcion},  

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaDetalleEquipo.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
            }
          }
      });                                             
  });



  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _serie = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;  
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Código de Serie: " + _serie);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Detalle Equipo");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, codEquipo:_serie},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaDetalleEquipo.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    