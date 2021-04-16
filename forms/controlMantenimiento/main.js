$(document).ready(function() {

  //alert(location.pathname)

var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionarioTipoMant = [];
var diccionarioSolMant = [];
var diccionarioControlMant = [];
var diccionarioEquipo = [];
var diccionarioUsuario = [];
opcion = 4;


  //Consulta a la tabla tipo mantenimiento  
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:6},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioTipoMant = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

    //Consulta a la tabla solicitud mantenimiento 
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:7},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log((data));
      diccionarioSolMant = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


    $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:8},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log((data));
      diccionarioControlMant = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

console.log(diccionarioControlMant);



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
    data: {opcion:11},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioUsuario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaControlMant = $('#tablaControlMant').DataTable({  
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
          {"data": "idControlMantenimiento"},
          {"data": "fechaControlMantenimiento"},
          {"data": "codEquipo"},
          {"data": "descripcionEquipo"},
          {"data": "tipoMantenimiento"},
          {"data": "idSolicitudMantenimiento"},
          {"data": "fechaSolicitudMantenimiento"},
          {"data": "observacion"},
          {"data": "estadoControlMantenimiento",
              render: function(data,type,row){
                        if(data == "Finalizado"){
                          return "<span class='IAE badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "Diagnosticado"){
                          return "<span class='IAE badge badge-warning badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "En reparación"){
                          return "<span class='IAE badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              }},
          {"data": "empleado"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ],
      
      
      //para usar los botones   
    /*  responsive: "true",
      dom: 'lBfrtip',       
      "buttons":[ 

        //EXCEL
        {
          extend:    'excelHtml5',
          text:      '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          className: 'btn btn-success',
          excelStyles: {
            "template": 'blue_medium'
          },

          //Estilos al momento de imprimir
          pageStyle: {
              sheetPr: {
                  pageSetUpPr: {
                      fitToPage: 1            // Ajustar la impresion a la pagina
                  } 
              },
              printOptions: {
                  horizontalCentered: true,
                  verticalCentered: true,
              },
              pageSetup: {
                  orientation: "landscape",   // Orientacion
                  paperSize: "9",             // Tamaño del papel (1 = Legal, 9 = A4)
                  fitToWidth: "1",            // Ajustar al ancho de la página
                  fitToHeight: "0",           // Ajustar al alto de la página
              },
              pageMargins: {
                  left: "0.2",
                  right: "0.2",
                  top: "0.4",
                  bottom: "0.4",
                  header: "0",
                  footer: "0",
              },
              repeatHeading: true,    // Repeat the heading row at the top of each page
              repeatCol: 'A:A',       // Repeat column A (for pages wider than a single printed page)
          },
        },


        //PDF
        {
          extend:    'pdfHtml5',
          text:      '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          className: 'btn btn-danger',
          excelStyles: {
            "template": 'blue_medium'
          },

          //Estilos al momento de imprimir
          pageStyle: {
              sheetPr: {
                  pageSetUpPr: {
                      fitToPage: 1            // Ajustar la impresion a la pagina
                  } 
              },
              printOptions: {
                  horizontalCentered: true,
                  verticalCentered: true,
              },
              pageSetup: {
                  orientation: "landscape",   // Orientacion
                  paperSize: "9",             // Tamaño del papel (1 = Legal, 9 = A4)
                  fitToWidth: "1",            // Ajustar al ancho de la página
                  fitToHeight: "0",           // Ajustar al alto de la página
              },
              pageMargins: {
                  left: "0.2",
                  right: "0.2",
                  top: "0.4",
                  bottom: "0.4",
                  header: "0",
                  footer: "0",
              },
              repeatHeading: true,    // Repeat the heading row at the top of each page
              repeatCol: 'A:A',       // Repeat column A (for pages wider than a single printed page)
          },
        },

        //IMPRIMIR
        {
          extend:    'print',
          text:      '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          className: 'btn btn-info',
          excelStyles: {
            "template": 'blue_medium'
          },

          //Estilos al momento de imprimir
          pageStyle: {
              sheetPr: {
                  pageSetUpPr: {
                      fitToPage: 1            // Ajustar la impresion a la pagina
                  } 
              },
              printOptions: {
                  horizontalCentered: true,
                  verticalCentered: true,
              },
              pageSetup: {
                  orientation: "landscape",   // Orientacion
                  paperSize: "9",             // Tamaño del papel (1 = Legal, 9 = A4)
                  fitToWidth: "1",            // Ajustar al ancho de la página
                  fitToHeight: "0",           // Ajustar al alto de la página
              },
              pageMargins: {
                  left: "0.2",
                  right: "0.2",
                  top: "0.4",
                  bottom: "0.4",
                  header: "0",
                  footer: "0",
              },
              repeatHeading: true,    // Repeat the heading row at the top of each page
              repeatCol: 'A:A',       // Repeat column A (for pages wider than a single printed page)
          },
        },
      ],
      */
  });  

//DataTable que carga las solicitudes de mantenimiento
  tablaSolMant = $('#tablaSolMant').DataTable({  
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "initComplete": function(settings, json) {
        
      $(".page-link").eq(1).css("background-color", "#1a3c8a");
      $(".page-link").eq(1).css("border-color", "#1a3c8a");
  },
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', 
          "data":{opcion:9}, 
          "dataSrc":""
      },
      "columns":[
          {"data": "idSolicitudMantenimiento"},
          {"data": "fechaSolicitudMantenimiento"},
          {"data": "descripcionEquipo"},
          {"data": "preDiagnostico"},
          {"data": "empleado"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-warning' id='btnSeleccionar'><i class='material-icons' >check_box</i></button></div></div>" }
      ]
  });  



    
  //BUSCAR SOLICITUD MANTENIMIENTO, cuando se crea un NUEVO control mantenimiento  ---------------------------------------------------------------------------------------
  $("#btnBuscar").click(function(){
    $('#modalCREAR').css("opacity", ".1");
    $("#formSolMant").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $(".modal-titles").text("Buscar solicitud mantenimiento");          
    $("#modalSolMant").modal("show");     //cuando hacen click sobre buscar, se abrira la modal de solictud de mantenimiento.  
  }); 
  
  //Al momento de cerra la modal de buscar solicitud mantenimiento, muestre la modal de nuevo control mantenimiento
  $("#btnClose").click(function(){
    $('#modalCREAR').css("opacity", "1");      
  }); 



  //se obtienen los valores de la solicitud seleccionada
  $(document).on("click", "#btnSeleccionar", function(){
    event.preventDefault(); //evita el comportamiento de la modal, que al darle click sobre el boton abra una nueva ventana sin que uno elija.
    $("#modalSolMant").modal("hide");  
    $('#modalCREAR').css("opacity", "1"); 

    fila = $(this).closest("tr");                  //FILA
    _idSolMant = parseInt(fila.find('td:eq(0)').text());   //ID
    _descripcionEquipo = fila.find('td:eq(2)').text();
    _falla = fila.find('td:eq(3)').text();

    $("#select_IdSolMant").val(_idSolMant);
    //$("#codEquipo").val(_codEquipo);
    $("#falla").val(_falla);

    //obtengo el código del equipo en base a la descripcion de dicho equipo, para luego mostrarlo en un input
    for (let index = 0; index < diccionarioEquipo.length; index++) {
      const element = diccionarioEquipo[index];
      console.dir(diccionarioEquipo);

      let equipoCod = element.codEquipo;
      let equipoDescripcion = element.descripcionEquipo;
      
      if (_descripcionEquipo.toString().trim() == equipoDescripcion.toString().trim()) {
        let element = document.getElementById("codEquipo");
        element.value = equipoCod;  // asigna el idDepartamento al element.value
      }
    }
  });



  //BUSCAR SOLICITUD MANTENIMIENTO, cuando se ACTUALIZA un control mantenimiento  ---------------------------------------------------------------------------------------
  $("#btnBuscarU").click(function(){
    $('#modalUPDATE').css("opacity", ".1");
    $("#formSolMant").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $(".modal-titles").text("Buscar solicitud mantenimiento");          
    $("#modalSolMant").modal("show");     //cuando hacen click sobre buscar, se abrira la modal de solictud de mantenimiento.  
  }); 


  //Al momento de cerra la modal de buscar solicitud mantenimiento, muestre la modal de nuevo control mantenimiento
  $("#btnCloseU").click(function(){
    $('#modalUPDATE').css("opacity", "1");      
  }); 



  //se obtienen los valores de la solicitud seleccionada
  $(document).on("click", "#btnSeleccionar", function(){
    event.preventDefault(); //evita el comportamiento de la modal, que al darle click sobre el boton abra una nueva ventana sin que uno elija.
    $("#modalSolMant").modal("hide");  
    $('#modalUPDATE').css("opacity", "1"); 

    fila = $(this).closest("tr");                  //FILA
    _idSolMant = parseInt(fila.find('td:eq(0)').text());   //ID
    _descripcionEquipo = fila.find('td:eq(2)').text();
    _falla = fila.find('td:eq(3)').text();

    $("#select_IdSolMantU").val(_idSolMant);
    //$("#codEquipo").val(_codEquipo);
    $("#fallaU").val(_falla);

    //obtengo el código del equipo en base a la descripcion de dicho equipo, para luego mostrarlo en un input
    for (let index = 0; index < diccionarioEquipo.length; index++) {
      const element = diccionarioEquipo[index];
      console.dir(diccionarioEquipo);

      let equipoCod = element.codEquipo;
      let equipoDescripcion = element.descripcionEquipo;
      
      if (_descripcionEquipo.toString().trim() == equipoDescripcion.toString().trim()) {
        let element = document.getElementById("codEquipoU");
        element.value = equipoCod;  // asigna el idDepartamento al element.value
      }
    }
  });








  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formControlMantC").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nuevo control de mantenimiento");          
    $("#modalCREAR").modal("show");

  });   


    //submit para el alta
  $('#formControlMantC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _fechaControl = $.trim($('#fechaControl').val());               //------2
   // _selectEmpleado = $.trim($('#select_Empleado').val() || []);   //Se hara atrvez de la variable de sesion del usuario logeado
    _selectTipoMant = $.trim($('#select_TipoMant').val() || []);     //----3
    _selectIdSolMant = $.trim($('#select_IdSolMant').val() || []);  //-----1
    _observacion = $.trim($('#observacion').val());                 //-----4
    _selectControlMant = $.trim($('#select_ControlMant').val() || []); //--5
    _select_Usuario = $.trim($('#select_Usuario').val() || []); //--6
    _codEquipo = $.trim($('#codEquipo').val() || []); 
    selectControlMant = $.trim($('#select_ControlMant').text() || []);

    //alert(_selectControlMant);
    //alert(_codEquipo);
    
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {fechaControl:_fechaControl, selectTipoMant:_selectTipoMant, selectIdSolMant:_selectIdSolMant, observacion:_observacion, estadoContronMant:_selectControlMant, select_Usuario:_select_Usuario, opcion:opcion},    

          success: function(data) {
          //alert(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              tablaControlMant.ajax.reload(null, false);
              $('#modalCREAR').modal('hide');
//ENVIAR CORREO de una solicitud de Mantenimiento
              $.ajax({
                url: "email.php",
                type: "POST",
                datatype:"json",
                data: {codEquipo:_codEquipo, observacion:_observacion, selectControlMant:_selectControlMant},
                success: function(data) {
                  alert(data);
                }
              });
            }else{
              alertify.warning("Este solicitud mantenimiento, ya cuenta con un control mantenimiento.");
            }
          }
      });                                             
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idControlMantU = parseInt(fila.find('td:eq(0)').text());   //ID
    _fechaControlMant = fila.find('td:eq(1)').text();
    _codEquipo = fila.find('td:eq(1)').text();
    _usuario = fila.find('td:eq(9)').text();
    _selectTipoMant = fila.find('td:eq(4)').text();
    _idSolMant = fila.find('td:eq(5)').text();
    _observacion = fila.find('td:eq(7)').text();
    _estadoControlMant = fila.find('td:eq(8)').text();
    _select_Usuario = fila.find('td:eq(9)').text();

      
    opcion = 2; //editar
    $("#codEquipoU").val(_codEquipo);
    $("#fechaControlU").val(_fechaControlMant);
    $("#observacionU").val(_observacion);
    
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar control de mantenimiento");
    $("#modalUPDATE").modal("show"); 
    

    //for, que permite el llenado del select de Tipo Mantenimiento
    //console.log(diccionarioTipoMant.length);
    for (let index = 0; index < diccionarioTipoMant.length; index++) {
      const element = diccionarioTipoMant[index];
      console.dir(diccionarioTipoMant);

      let tipoMantId = element.idTipoMantenimiento;
      let tipoMantNombre = element.tipoMantenimiento;
      
      if (_selectTipoMant.toString().trim() == tipoMantNombre.toString().trim()) {
        let element = document.getElementById("select_TipoMantU");
        element.value = tipoMantId;  // asigna el idTipoMantenimiento al element.value
      }
    }


    //console.log(diccionarioSolMant.length);
    for (let index = 0; index < diccionarioSolMant.length; index++) {
      const element = diccionarioSolMant[index];
      console.dir(diccionarioSolMant);

      let solMantId = element.idSolicitudMantenimiento;
      let codEquipo = element.codEquipo;
      let fallaEquipo = element.preDiagnostico;
            
      if (_idSolMant.toString().trim() === element.idSolicitudMantenimiento.toString()) {
        let element = document.getElementById("select_IdSolMantU");
        element.value = solMantId;  // asigna el idSolicitudMantenimiento al element.value

        let element1 = document.getElementById("fallaU");
        element1.value = fallaEquipo;  // asigna el idSolicitudMantenimiento al element.value
      }
    }

    //console.log(diccionarioControlMant.length);
    for (let index = 0; index < diccionarioControlMant.length; index++) {
      const element = diccionarioControlMant[index];
      console.dir(diccionarioControlMant);

      let estadoCMId = element.idEstadoControlMantenimiento;
      let estadoCMNombre = element.estadoControlMantenimiento;
            
      if (_estadoControlMant.toString().trim() == estadoCMNombre.toString()) {
        let element = document.getElementById("select_ControlMantU");
        element.value = estadoCMId;  // asigna el estadoCMId al element.value
      }
    }

    //for, que permite el llenado del select de usuario
    //console.log(diccionarioUsuario.length);
    for (let index = 0; index < diccionarioUsuario.length; index++) {
      const element = diccionarioUsuario[index];
      console.dir(diccionarioUsuario);

      let usuarioId = element.idUsuario;
      let usuarioNombre = element.empleado;
      
      if (_select_Usuario.toString().trim() == usuarioNombre.toString().trim()) {
        let element = document.getElementById("select_UsuarioU");
        element.value = usuarioId;  // asigna el usuarioId al element.value
      }
    }

  });


    //submit para la Actualización
  $('#formControlMantU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _fechaControlU = $.trim($('#fechaControlU').val());   
    _selectTipoMantU = $.trim($('#select_TipoMantU').val() || []); 
    _selectIdSolMantU = $.trim($('#select_IdSolMantU').val() || []);
    _observacionU = $.trim($('#observacionU').val()); 
    _selectControlMantU = $.trim($('#select_ControlMantU').val() || []);
    _select_UsuarioU = $.trim($('#select_UsuarioU').val() || []);
     

    //alert(_estadoU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idControlMant:_idControlMantU, fechaControl:_fechaControlU, selectTipoMant:_selectTipoMantU, selectIdSolMant:_selectIdSolMantU, observacion:_observacionU, estadoContronMant:_selectControlMantU, select_UsuarioU:_select_UsuarioU,  opcion:opcion},   
        
          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              $('#modalUPDATE').modal('hide');
            }
            tablaControlMant.ajax.reload(null, false);
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _idControlMant = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _fechaControl = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Control con ID: " + _idControlMant);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar Control de Mantenimiento");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idControlMant:_idControlMant},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaControlMant.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    