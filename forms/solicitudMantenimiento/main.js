$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionario = [];
opcion = 4;

//Consulta a la tabla equipo   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaSolMant = $('#tablaSolMant').DataTable({  
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
          {"data": "idSolicitudMantenimiento"},
          {"data": "fechaSolicitudMantenimiento"},
          {"data": "codEquipo"},
          {"data": "descripcionEquipo"},
          {"data": "tipoEquipo"},
          {"data": "modelo"},
          {"data": "serviceTag"},
          {"data": "preDiagnostico"},
          {"data": "userName"},
          {"data": "estadoControlMantenimiento",
              render: function(data,type,row){
                        if(data == "Finalizado"){
                          return "<span class='IAE badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "Diagnosticado"){
                          return "<span class='IAE badge badge-warning badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "En reparación"){
                          return "<span class='IAE badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              }
          },
          //{"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            </div></div>" }
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
          "data":{opcion:5}, 
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
    $('#modalCREAR').css("overflow-y", "scroll");

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
    for (let index = 0; index < diccionario.length; index++) {
      const element = diccionario[index];
      console.dir(diccionario);

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
    $("#tipoEquipoU").val(_tipoEquipo);
    $("#modeloEquipoU").val(_modelo);
    $("#serviceTagEquipoU").val(_serviceTag);
    $("#descripcionEquipoU").val(_descripcion);


    //obtengo el código del equipo en base a la descripcion de dicho equipo, para luego mostrarlo en un input
    for (let index = 0; index < diccionario.length; index++) {
      const element = diccionario[index];
      console.dir(diccionario);

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
    $("#formSolManC").trigger("reset");
    $('#fechaSM').focus();
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nueva solicitud mantenimiento");          
    $("#modalCREAR").modal("show");       
  });   

//Variables de sesión

    //submit para el alta
  $('#formSolManC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _fechaSM = $.trim($('#fechaSM').val());  
    _codEquipo = $.trim($('#codEquipo').val() || []);  
    _preDiag = $.trim($('#Pre_Diag').val()); 
    //_usuario = $_SESSION["s_idUsuario"]
    let uId = localStorage.getItem("idDeUsuario");
    //alert(uId)

    let ahoraD = new Date();
    let ahoraDAnio = ahoraD.getFullYear();
    let ahoraDMonth = ahoraD.getMonth();
    let ahoraDDay = ahoraD.getDate();
    let ahoraDHour = ahoraD.getHours();
    let ahoraDMinutes = ahoraD.getMinutes();
    let ahoraDSeconds = ahoraD.getSeconds();
    let ahoraDDia;
    let ahoraDMes;
    let mesHoyD;

    mesHoyD = ahoraDMonth+1;

    if (mesHoyD < 10) {
      ahoraDMes = "0"+mesHoyD;
    }else{
      ahoraDMes = mesHoyD;
    }

    if (ahoraDDay < 10) {ahoraDDia = "0"+ahoraDDay;}else{ahoraDDia = ahoraDDay;}

    let horaD = ahoraDHour+":"+ahoraDMinutes+":"+ahoraDSeconds;
    let fechaActualD = ahoraDAnio+"-"+ahoraDMes+"-"+ahoraDDia+"_"+horaD;

    

    //alert(_usuario);  
                         
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {fechaSM:_fechaSM, selectEquipo:_codEquipo, preDiag:_preDiag, opcion:opcion},    

          success: function(data) {
          console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
              tablaSolMant.ajax.reload(null, false);

              $.ajax({
                url: "../../bd/get_nuevo_control_mantenimiento_usuario.php",
                type: "POST",
                async: false,
                datatype:"json",
                data: {idUsuario:uId},
                success: function(dataNuevo) {
                  console.log("nuevo control creado");
                  console.dir(JSON.parse(dataNuevo));
                  let dataNew = JSON.parse(dataNuevo);
                  let controlId = dataNew[0].idSolicitudMantenimiento;
                  let controlFecha = dataNew[0].fechaSolicitudMantenimiento;
                  let controlFechaHora = controlFecha+" "+horaD;

                  
                  $.ajax({
                    url: "../../bd/crear_notificacion.php",
                    type: "POST",
                    async: false,
                    datatype:"json",
                    data: {idControlMantenimiento:controlId, fechaNotificacion: controlFechaHora},
                    success: function(dataCrearNoti) {
                      console.log("nuevo notificación nueva");
                      console.dir(dataCrearNoti);
                    }
                  });
                  /**/

                  //alert(data);
                }
              });

              //alert("heyyy heyyyy es el rey")
              

//ENVIAR CORREO de una solicitud de Mantenimiento
/*              
$.ajax({
                url: "email.php",
                type: "POST",
                datatype:"json",
                data: {codEquipo:_codEquipo, falla:_preDiag,  opcion:6},
                success: function(data) {
                  //alert(data);
                }
              });
              */

            }
          }
      });  
      
  }); 
    
  

  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idSM = parseInt(fila.find('td:eq(0)').text());   //ID
    _fechaSM = fila.find('td:eq(1)').text();

    _codEquipo = fila.find('td:eq(2)').text();
    _descripcion= fila.find('td:eq(3)').text();
    _tipoEquipo = fila.find('td:eq(4)').text();
    _modelo = fila.find('td:eq(5)').text();
    _serviceTag = fila.find('td:eq(6)').text();
    //_selectEquipo = fila.find('td:eq(2)').text();
    _preDiag = fila.find('td:eq(7)').text();
  
    opcion = 2; //editar
    $("#codEquipoU").val(_codEquipo);
    $("#descripcionEquipoU").val(_descripcion);
    $("#tipoEquipoU").val(_tipoEquipo);
    $("#modeloEquipoU").val(_modelo);
    $("#serviceTagEquipoU").val(_serviceTag);

    $("#fechaSMU").val(_fechaSM);
    $("#Pre_DiagU").val(_preDiag);
    
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar solicitud mantenimiento");
    $("#modalUPDATE").modal("show"); 
        
  });


    //submit para la Actualización
  $('#formSolMantU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _fechaSMU = $.trim($('#fechaSMU').val());  
    _codEquipoU = $.trim($('#codEquipoU').val() || []);  
    _preDiagU = $.trim($('#Pre_DiagU').val()); 
 
    //alert(_depto);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idSM:_idSM, fechaSM:_fechaSMU, selectEquipo:_codEquipoU, preDiag:_preDiagU, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaSolMant.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
            }
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    idSM = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    diagnostico = ($(this).closest('tr').find('td:eq(3)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Pre_Diagnostico: " + diagnostico);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar Solicitud de Matenimiento");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idSM:idSM},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaSolMant.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    