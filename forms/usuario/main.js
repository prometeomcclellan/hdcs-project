$(document).ready(function() {
var idUsuario, opcion;
var fila; //captura la fila, para editar o eliminar
var usuarioDiccionario = [];
opcion = 4;


//Consulta a la tabla departamentos   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      usuarioDiccionario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaUsuarios = $('#tablaUsuarios').DataTable({  
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
          {"data": "idUsuario"},
          {"data": "empleado"},
          {"data": "fechaCreacion"},
          {"data": "userName"},
          {"data": "password"},
          {"data": "fechaBaja"},
          {"data": "estado", 
              render: function(data,type,row){
                        if(data == "ACTIVO"){
                          return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else{
                          return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              } 
          },
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-warning btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ]
  });  



    

  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formModeloC").trigger("reset");
    $('#modelo').focus();
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Nuevo Usuario");          
    $("#modalCREAR").modal("show");       
  });   


    //submit para el alta
  $('#formUsuarioC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
  
    _codEmpleado = $.trim($('#select_Empleado').val() || []);   
    _fechaCreacion = $.trim($('#fechaCreacion').val());   
    _userName = $.trim($('#userName').val());   
    _password = $.trim($('#password').val());   
    _fechaBaja = $.trim($('#fechaBaja').val());   


      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEmpleado:_codEmpleado, fechaCreacion:_fechaCreacion, userName:_userName, password:_password, fechaBaja:_fechaBaja, opcion:opcion},   

        success: function(data) {
        //console.log("recibo de la data Alta = " + data);
          if(data == 0){
            alertify.success("Registro agregado satisfactoriamente.");
            $('#modalCREAR').modal('hide');
          }else{
            alertify.warning("Este usuario, ya se encuentra registrado.");
            $('#userName').focus();
          }
          tablaUsuarios.ajax.reload(null, false);
        }
      });                                             
  }); 
    
  

  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idUsuarioU = parseInt(fila.find('td:eq(0)').text());   //ID
    _empleadoU = fila.find('td:eq(1)').text();
    _fechaCreacionU = fila.find('td:eq(2)').text();
    _userNameU = fila.find('td:eq(3)').text();
    _passwordU = fila.find('td:eq(4)').text();
    _fechaBajaU = fila.find('td:eq(5)').text();
    _estadoU = fila.find('td:eq(6)').text();

    opcion = 2; //editar

    //$("#codEmpleado").val(codEmpleado);
    $("#fechaCreacionU").val(_fechaCreacionU);
    $("#userNameU").val(_userNameU);
    $("#passwordU").val(_passwordU);
    $("#fechaBajaU").val(_fechaBajaU);
   // $("#estadoU").val(_estadoU);
    
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar Usuario");
    $("#modalUPDATE").modal("show"); 
    
    //for, que permite el llenado del select de departamento
    //console.log(usuarioDiccionario.length);
    for (let index = 0; index < usuarioDiccionario.length; index++) {
      const element = usuarioDiccionario[index];
      console.dir(usuarioDiccionario);

      let empleadoCod = element.codEmpleado;
      let empleadoNombreC = element.empleado;

      if (_empleadoU.toString().trim() == empleadoNombreC.toString().trim()) {
        let element = document.getElementById("select_EmpleadoU");
        console.log(element);
        element.value = empleadoCod;  // asigna el idDepartamento al element.value
      }
    }


    if(_estadoU == 'ACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 1; 
    }else if(_estadoU == 'INACTIVO'){
        let element = document.getElementById("estadoU");
        console.log(element);
        element.value = 0; 
    }
  

  });


    //submit para la Actualización
  $('#formUsuarioU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _codEmpleadoU = $.trim($('#select_EmpleadoU').val() || []);   
    _fechaCreacionU = $.trim($('#fechaCreacionU').val());   
    _userNameU = $.trim($('#userNameU').val());   
    _passwordU = $.trim($('#passwordU').val());   
    _fechaBajaU = $.trim($('#fechaBajaU').val());   
    _estadoU = $.trim($('#estadoU').val()); 

    //alert("Obteniendo estado select " +_estadoU);

    //alert(_estadoU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idUsuario:_idUsuarioU, userName:_userNameU, password:_passwordU, fechaBaja:_fechaBajaU, estado:_estadoU, opcion:opcion},   
          success: function(data) {
          //console.log("Estado de la data " +data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaUsuarios.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
            }else{
              alertify.warning("Este usuario, ya se encuentra registrado.");
              $('#userNameU').focus();
            }
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _idUsuario = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _usuario = ($(this).closest('tr').find('td:eq(3)').text()) ;   
    opcion = 3; //eliminar   
    //alert(_idUsuario);

    $("#panel_eliminar").html("Usuario: " + _usuario);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar Usuario");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idUsuario:_idUsuario},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaUsuarios.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    