$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionarioEmpresaGarantia = [];
var diccionarioUsuario = [];

opcion = 4;



//Consulta a la tabla equipo   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:10},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioEquipo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


  //Consulta a la tabla usuario   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioUsuario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaAsignacionEquipo = $('#tablaAsignacionEquipo').DataTable({  
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

      select: true,

      select: {
        items: 'row'
      },

      "columns":[
          {"data": "idAsignacionEquipo"},
          {"data": "codEquipo"},
          {"data": "descripcionEquipo"},
          {"data": "tipoEquipo"},
          {"data": "modelo"},
          {"data": "serviceTag"},
          {"data": "fechaAsignacion"},
          {"data": "fechaBaja"},
          {"data": "observacion"},
          {"data": "estado",
              render: function(data,type,row){
                        if(data == "ACTIVO"){
                          return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else{
                          return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              } 
          },
          {"data": "empleado"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ],
  });  





//DataTable que carga los equipos
  tablaEquipo = $('#tablaEquipo').DataTable({  
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
      
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', 
          "data":{opcion:10}, 
          "dataSrc":""
      },
      "columns":[
          {"data": "codEquipo"},
          {"data": "tipoEquipo"},
          {"data": "modelo"},
          {"data": "serie"},
          {"data": "serviceTag"},
          {"data": "descripcionEquipo"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-success' id='btnSeleccionar'><i class='material-icons' >check_box</i></button></div></div>" }
      ]
  });  



    
  //BUSCAR EQUIPO, cuando se crea un NUEVO control garantia  ---------------------------------------------------------------------------------------
  $("#btnBuscar").click(function(){
    $('#modalCREAR').css("opacity", ".1");
    $("#formEquipo").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $(".modal-titles").text("Buscar equipo");          
    $("#modalEquipo").modal("show");     //cuando hacen click sobre buscar, se abrira la modal de equipo 
  }); 
  
  //Al momento de cerra la modal de buscar equipo, muestre la modal de nuevo control garantía
  $("#btnClose").click(function(){
    $('#modalCREAR').css("opacity", "1");      
  }); 

  $('#modalEquipo').on('hide.bs.modal', function (e) {
    $('#modalCREAR').css("opacity", "1");
    $('#modalUPDATE').css("opacity", "1");
  });

  //se obtienen los valores del equipo seleccionado
  $(document).on("click", "#btnSeleccionar", function(){
    event.preventDefault(); //evita el comportamiento de la modal, que al darle click sobre el boton abra una nueva ventana sin que uno elija.
    $("#modalEquipo").modal("hide");  
    $('#modalCREAR').css("opacity", "1"); 

    fila = $(this).closest("tr");                  //FILA
    _codEquipo = fila.find('td:eq(0)').text();   //ID
    _tipoEquipo = fila.find('td:eq(1)').text();
    _modelo = fila.find('td:eq(2)').text();
    _serviceTag = fila.find('td:eq(4)').text();
    _descripcion = fila.find('td:eq(5)').text();


    //$("#codEquipo").val(_codEquipo);
    $("#tipoEquipo").val(_tipoEquipo);
    $("#modeloEquipo").val(_modelo);
    $("#serviceTagEquipo").val(_serviceTag);
    $("#descripcionEquipo").val(_descripcion);


    //obtengo el código del equipo en base a la descripcion de dicho equipo, para luego mostrarlo en un input
    for (let index = 0; index < diccionarioEquipo.length; index++) {
      const element = diccionarioEquipo[index];
      console.dir(diccionarioEquipo);

      let equipoCod = element.codEquipo;
      let equipoDescripcion = element.descripcionEquipo;
      
      if (_codEquipo.toString().trim() == equipoCod.toString().trim()) {
        let element = document.getElementById("codEquipo");
        element.value = equipoCod;  // asigna el idDepartamento al element.value
      }
    
    }
  });









    
  //BUSCAR EQUIPO, cuando se ACTUALIZA control garantia  ---------------------------------------------------------------------------------------
  $("#btnBuscarU").click(function(){
    $('#modalUPDATE').css("opacity", ".1");
    $("#formEquipo").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $(".modal-titles").text("Buscar equipo");          
    $("#modalEquipo").modal("show");     //cuando hacen click sobre buscar, se abrira la modal de equipo 
  }); 
  
  //Al momento de cerra la modal de buscar equipo, muestre la modal de nuevo control garantía
  $("#btnClose").click(function(){
    $('#modalUPDATE').css("opacity", "1");      
  }); 



  //se obtienen los valores del equipo seleccionado
  $(document).on("click", "#btnSeleccionar", function(){
    event.preventDefault(); //evita el comportamiento de la modal, que al darle click sobre el boton abra una nueva ventana sin que uno elija.
    $("#modalEquipo").modal("hide");  
    $('#modalUPDATE').css("opacity", "1"); 

    fila = $(this).closest("tr");                  //FILA
    _codEquipo = fila.find('td:eq(0)').text();   //ID
    _tipoEquipo = fila.find('td:eq(1)').text();
    _modelo = fila.find('td:eq(2)').text();
    _serviceTag = fila.find('td:eq(4)').text();
    _descripcion = fila.find('td:eq(5)').text();


    //$("#codEquipo").val(_codEquipo);
    $("#tipoEquipo").val(_tipoEquipo);
    $("#modeloEquipo").val(_modelo);
    $("#serviceTagEquipo").val(_serviceTag);
    $("#descripcionEquipo").val(_descripcion);


    //obtengo el código del equipo en base a la descripcion de dicho equipo, para luego mostrarlo en un input
    for (let index = 0; index < diccionarioEquipo.length; index++) {
      const element = diccionarioEquipo[index];
      console.dir(diccionarioEquipo);

      let equipoCod = element.codEquipo;
      let equipoDescripcion = element.descripcionEquipo;
      
      if (_codEquipo.toString().trim() == equipoCod.toString().trim()) {
        let element = document.getElementById("codEquipoU");
        element.value = equipoCod;  // asigna el idDepartamento al element.value
      }
    
    }
  });








  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formAsignacionEquipo").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nuevo asignación equipo");          
    $("#modalCREAR").modal("show");

  });   


    //submit para el alta
  $('#formAsignacionEquipo').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    
    _codEquipo = $.trim($('#codEquipo').val());               
    _fechaAsignacion = $.trim($('#fechaAsignacion').val());     
    _fechaBaja = $.trim($('#fechaBaja').val());  
    _Observacion = $.trim($('#observacion').val());
    _idUsuario = $.trim($('#select_Usuario').val());
     


      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {fechaAsignacion:_fechaAsignacion, codEquipo:_codEquipo, Observacion:_Observacion, fechaBaja:_fechaBaja, idUsuario:_idUsuario, opcion:opcion},    

          success: function(data) {
          //alert(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              tablaAsignacionEquipo.ajax.reload(null, false);
              $('#modalCREAR').modal('hide');
  //ENVIAR CORREO de una solicitud de Mantenimiento
                $.ajax({
                  url: "email.php",
                  type: "POST",
                  datatype:"json",
                  data: {codEquipo:_codEquipo, observacion:_Observacion, idUsuario:_idUsuario, opcion:6},
                  success: function(data) {
                    //alert(data);
                  }
                });
            }else{
              alertify.warning("Este equipo, ya se encuentra asignado.");
            }
          }
      });                                             
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idAsignacionEquipo = (fila.find('td:eq(0)').text());   //ID
    _codEquipo = fila.find('td:eq(1)').text();
    _descripcion= fila.find('td:eq(2)').text();
    _tipoEquipo = fila.find('td:eq(3)').text();
    _modelo = fila.find('td:eq(4)').text();
    _serviceTag = fila.find('td:eq(5)').text();

    _fechaAsignacion = fila.find('td:eq(6)').text();
    _fechaBaja = fila.find('td:eq(7)').text();

    _observacion = fila.find('td:eq(8)').text();
    _estado = fila.find('td:eq(9)').text();
    _usuario = fila.find('td:eq(10)').text();

      
    opcion = 2; //editar
    $("#codEquipoU").val(_codEquipo);
    $("#descripcionEquipoU").val(_descripcion);
    $("#tipoEquipoU").val(_tipoEquipo);
    $("#modeloEquipoU").val(_modelo);
    $("#serviceTagEquipoU").val(_serviceTag);

    $("#fechaAsignacionU").val(_fechaAsignacion);
    $("#fechaBajaU").val(_fechaBaja);
    $("#observacionU").val(_observacion);

    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar asignación equipo");
    $("#modalCuadroU").css("margin-top", "0");
    $("#modalUPDATE").modal("show"); 
    

    if(_estado == 'ACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 1; 
    }else if(_estado == 'INACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 0; 
    }


    //for, que permite el llenado del select de usuario
    //console.log(diccionarioUsuario.length);
    for (let index = 0; index < diccionarioUsuario.length; index++) {
      const element = diccionarioUsuario[index];
      console.dir(diccionarioUsuario);

      let usuarioId = element.idUsuario;
      let usuarioNombre = element.empleado;
      
      if (_usuario.toString().trim() == usuarioNombre.toString().trim()) {
        let element = document.getElementById("select_UsuarioU");
        element.value = usuarioId;  // asigna el usuarioId al element.value
      }
    }

  });




    //submit para la Actualización
  $('#formAsignacionEquipoU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    
    _codEquipo = $.trim($('#codEquipoU').val());               
    _fechaAsignacion = $.trim($('#fechaAsignacionU').val());     
    _fechaBaja = $.trim($('#fechaBajaU').val());  
    _Observacion = $.trim($('#observacionU').val());
    _estado = $.trim($('#estadoU').val());
    _idUsuario = $.trim($('#select_UsuarioU').val());
    //alert(_estadoU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idAsignacionEquipo:_idAsignacionEquipo, fechaAsignacion:_fechaAsignacion, codEquipo:_codEquipo, Observacion:_Observacion, fechaBaja:_fechaBaja, estado:_estado, idUsuario:_idUsuario, opcion:opcion},

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaAsignacionEquipo.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
  //ENVIAR CORREO de una solicitud de Mantenimiento
                $.ajax({
                  url: "email.php",
                  type: "POST",
                  datatype:"json",
                  data: {codEquipo:_codEquipo, observacion:_Observacion, idUsuario:_idUsuario, opcion:6},
                  success: function(data) {
                    //alert(data);
                  }
                });
            }
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _idAsignacionEquipo = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _fechaControl = ($(this).closest('tr').find('td:eq(6)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Asignación con ID: " + _idAsignacionEquipo);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar control garantía");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idAsignacionEquipo:_idAsignacionEquipo},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaAsignacionEquipo.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    