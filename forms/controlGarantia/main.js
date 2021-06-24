$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionarioEmpresaGarantia = [];
var diccionarioEquipo = [];
opcion = 4;

 $("#telefono").mask("9999-9999");

  //Consulta a la tabla empresa garantia  
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:6},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioEmpresaGarantia = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });





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

//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaControlGarantia = $('#tablaControlGarantia').DataTable({  
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
          {"data": "idControlGarantia"},
          {"data": "codEquipo"},
          {"data": "descripcionEquipo"},
          {"data": "tipoEquipo"},
          {"data": "modelo"},
          {"data": "serviceTag"},
          {"data": "fechaInicio"},
          {"data": "fechaVencimiento"},
          {"data": "estado",
              render: function(data,type,row){
                        if(data == "ACTIVO"){
                          return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else{
                          return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              } 
          },
          {"data": "idEmpresa"},
          {"data": "nombreEmpresa"},
          {"data": "telefonoContacto"},
          {"data": "correoElectronico"},
          {"data": "userName"},
          //{"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            </div></div>" }
      ],
      
      //para usar los botones   
      /*responsive: "true",
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






  //Agregar EQUIPO ---------------------------------------------------------------------------------------
  $("#btnAgregar").click(function(){
    $('#modalCREAR').css("opacity", ".1");
    $("#formEquipoNew").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $(".modal-titles").text("Agregar nuevo equipo");          
    $("#modalEquipo").modal("show");     //cuando hacen click sobre buscar, se abrira la modal de equipo 
  }); 
  
  //Al momento de cerra la modal de buscar equipo, muestre la modal de nuevo control garantía
  $("#btnCloseNew").click(function(){
    $('#modalCREAR').css("opacity", "1");      
  }); 











  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formControlGarantiaC").trigger("reset");
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nuevo control garantía");          
    $("#modalCREAR").modal("show");

  });   


    //submit para el alta
  $('#formControlGarantiaC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    _codEquipo = $.trim($('#codEquipo').val());               
    _fechaInicio = $.trim($('#fechaInicio').val());     
    _fechaVencimiento = $.trim($('#fechaVencimiento').val());  
    _select_Empresa = $.trim($('#select_Empresa').val());
    _telefono = $.trim($('#telefono').val());
    _eMail = $.trim($('#eMail').val());



      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEquipo:_codEquipo, fechaInicio:_fechaInicio, fechaVencimiento:_fechaVencimiento, select_Empresa:_select_Empresa, telefono:_telefono, eMail:_eMail, opcion:opcion},    

          success: function(data) {
          //alert(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              tablaControlGarantia.ajax.reload(null, false);
              $('#modalCREAR').modal('hide');
  //ENVIAR CORREO de una solicitud de Mantenimiento
                $.ajax({
                  url: "email.php",
                  type: "POST",
                  datatype:"json",
                  data: {codEquipo:_codEquipo, fechaVencimiento:_fechaVencimiento, fechaInicio:_fechaInicio, opcion:6},
                  success: function(data) {
                    //alert(data);
                  }
                });
            }else{
              alertify.warning("Este equipo, ya cuenta con un control garantía");
            }
          }
      });                                             
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idControlGarantia= (fila.find('td:eq(0)').text());   //ID
    _codEquipo = fila.find('td:eq(1)').text();
    _descripcion= fila.find('td:eq(2)').text();
    _tipoEquipo = fila.find('td:eq(3)').text();
    _modelo = fila.find('td:eq(4)').text();
    _serviceTag = fila.find('td:eq(5)').text();

    _fechaInicio = fila.find('td:eq(6)').text();
    _fechaVencimiento = fila.find('td:eq(7)').text();

    _select_Empresa = fila.find('td:eq(10)').text();
    _telefono = fila.find('td:eq(11)').text();
    _eMail = fila.find('td:eq(12)').text();

      
    opcion = 2; //editar
    $("#codEquipoU").val(_codEquipo);
    $("#descripcionEquipoU").val(_descripcion);
    $("#tipoEquipoU").val(_tipoEquipo);
    $("#modeloEquipoU").val(_modelo);
    $("#serviceTagEquipoU").val(_serviceTag);
    $("#fechaInicioU").val(_fechaInicio);
    $("#fechaVencimientoU").val(_fechaVencimiento);
    $("#telefonoU").val(_telefono);
    $("#eMailU").val(_eMail);

    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar Control garantía");
    $("#modalUPDATE").modal("show"); 
    

    //for, que permite el llenado del select de Tipo Mantenimiento
    //console.log(diccionarioEmpresaGarantia.length);
    for (let index = 0; index < diccionarioEmpresaGarantia.length; index++) {
      const element = diccionarioEmpresaGarantia[index];
      console.dir(diccionarioEmpresaGarantia);

      let empresaId = element.idEmpresa;
      let empresaNombre = element.nombreEmpresa;
      
      if (_select_Empresa.toString().trim() == empresaNombre.toString().trim()) {
        let element = document.getElementById("select_EmpresaU");
        element.value = empresaId;  // asigna el idTipoMantenimiento al element.value
      }
    }



    if(_estado == 'ACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 1; 
    }else if(_estado == 'INACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 0; 
    }

  });




    //submit para la Actualización
  $('#formControlMantU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _codEquipo = $.trim($('#codEquipoU').val());               
    _fechaInicio = $.trim($('#fechaInicioU').val());     
    _fechaVencimiento = $.trim($('#fechaVencimientoU').val()); 
    _estado = $.trim($('#estadoU').val());  
    _select_Empresa = $.trim($('#select_EmpresaU').val());
    _telefono = $.trim($('#telefonoU').val());
    _eMail = $.trim($('#eMailU').val());
     

    //alert(_estadoU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idControlGarantia:_idControlGarantia, codEquipo:_codEquipo, fechaInicio:_fechaInicio, fechaVencimiento:_fechaVencimiento, estado:_estado, select_Empresa:_select_Empresa, telefono:_telefono, eMail:_eMail, opcion:opcion},   

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaControlGarantia.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
  //ENVIAR CORREO de una solicitud de Mantenimiento
                $.ajax({
                  url: "email.php",
                  type: "POST",
                  datatype:"json",
                  data: {codEquipo:_codEquipo, fechaVencimiento:_fechaVencimiento, fechaInicio:_fechaInicio, opcion:6},
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
    _idControlGarantia = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _fechaControl = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Control con ID: " + _idControlGarantia);
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
            data:  {opcion:opcion, idControlGarantia:_idControlGarantia},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaControlGarantia.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    