$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  var diccionarioCargo = [];
  var diccionarioSexo = [];
  opcion = 4;

  //cargar la mascara de entrada para teléfonos
  $("#telefono").mask("9999-9999");
  $("#celular").mask("9999-9999");
  $("#extension").mask("999-999");
  $("#telefonoU").mask("9999-9999");
  $("#celularU").mask("9999-9999");
  $("#extensionU").mask("999-999");

  
  //Consulta a la tabla cargo   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioCargo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

  //Consulta a la tabla sexo  
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:6},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioSexo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

  //MOSTRAR ---------------------------------------------------------------------------------------
  //DataTable que carga la tabla de inicio del index
  tablaEmpleado = $('#tablaEmpleado').DataTable({  
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
          {"data": "codEmpleado"},
          {"data": "nombres"},
          {"data": "apellidos"},
          {"data": "telefono"},
          {"data": "celular"},
          {"data": "extension"},
          {"data": "sexo"},
          {"data": "cargo"},
          {"data": "correoElectronico"},
          {"data": "estado",
              render: function(data,type,row){
                        if(data == "ACTIVO"){
                          return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else{
                          return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              } 
          },
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-primary btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ]
  });  



    



  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formEmpleadoC").trigger("reset");
    $('#nombres').focus();
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Empleado");          
    $("#modalCREAR").modal("show");       
  });   

  function validaciones() {
    var nombre = document.getElementById('nombres').value;

    texto = /[a-zA-ZÀ-ÿ]/;
    if(!texto.test(nombre)){
      $("#nombres").focus();
      $("#lblAlerta").text("*Debe ingresar solo caracteres en el nombre").slideDown(500);
      return false;
    }else{
      $("#lblAlerta").text("").slideUp(500);
    }

  }
    //submit para el alta
  $('#formEmpleadoC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _codEmpleado = $.trim($('#codEmpleado').val()); 
    _nombres = $.trim($('#nombres').val());  
    _apellidos = $.trim($('#apellidos').val()); 
    _telefono = $.trim($('#telefono').val()); 
    _celular = $.trim($('#celular').val()); 
    _extension = $.trim($('#extension').val()); 
    _selectSexo = $.trim($('#select_Sexo').val() || []); 
    _selectCargo = $.trim($('#select_Cargo').val() || []);
    _eMail = $.trim($('#eMail').val());  

/*
    function validarEmail(_eMail){
      var correo = /^([a-zA-Z0-9_\.+-])+\@(([z-aA-Z0-9-]+)\.)+([a-zA-Z0-9{2,4}])+$/;
      return correo.test(_eMail);
    } 

    //Expresiones regulares
    texto = /[a-zA-ZÀ-ÿ]/;
    numero = /^\d{8,10}$/;
 /*  

    if(!texto.test(_nombres) ) {
        setTimeout(function(){
          $("#lblAlerta").text("*Debe ingresar solo caracteres en el nombre").fadeOut();
        }, 15000);
      $("#nombres").focus();
      return false;
    }else if(!texto.test(_apellidos)){
      $("#apellidos").focus();
      $("#lblApellido").text("*Debe ingresar solo caracteres en el apellido");
    }else if(!numero.test(_telefono)){
      $("#telefono").focus();
      $("#lblTelefono").text("*Debe ingresar un número de teléfono válido");
    }else if(!numero.test(_celular)){
      $("#celular").focus();
      $("#lblCelular").text("*Debe ingresar un número de celular válido");
    }else if(validarEmail(_eMail) == false){
      $("#eMail").focus();
      $("#lblCorreo").text("*Debe ingresar un correo válido");
    }else{
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEmpleado:_codEmpleado, nombres:_nombres, apellidos:_apellidos, telefono:_telefono, celular:_celular, select_Sexo: _selectSexo, select_Cargo:_selectCargo, eMail:_eMail, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
            }else{
              alertify.warning("Este código de empleado, ya se encuentra registrado.");
              $('#codEmpleado').focus();
            }
            tablaEmpleado.ajax.reload(null, false);
          }
      }); 
    } */                   
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEmpleado:_codEmpleado, nombres:_nombres, apellidos:_apellidos, telefono:_telefono, celular:_celular, extension:_extension, select_Sexo: _selectSexo, select_Cargo:_selectCargo, eMail:_eMail, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
              tablaEmpleado.ajax.reload(null, false);
            }else{
              alertify.warning("Este código de empleado, ya se encuentra registrado.");
              $('#codEmpleado').focus();
            }
          }
      });                                        
  }); 
    

  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _codEmpleado = parseInt(fila.find('td:eq(0)').text());   //ID
    _nombres = fila.find('td:eq(1)').text();
    _apellidos = fila.find('td:eq(2)').text();
    _telefono = fila.find('td:eq(3)').text();
    _celular = fila.find('td:eq(4)').text();
    _extension = fila.find('td:eq(5)').text();
    _selectSexo = fila.find('td:eq(6)').text();
    _selectCargo = fila.find('td:eq(7)').text();
    _eMail = fila.find('td:eq(8)').text();
    _estado = fila.find('td:eq(9)').text();
  
    opcion = 2; //editar
    $("#codEmpleadoU").val(_codEmpleado);
    $("#nombresU").val(_nombres);
    $("#apellidosU").val(_apellidos);
    $("#telefonoU").val(_telefono);
    $("#celularU").val(_celular);
    $("#extensionU").val(_extension);
    $("#eMailU").val(_eMail);
    //$("#estadoU").val(_estado);
    
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Empleado");
    $("#modalUPDATE").modal("show"); 
    
    //for, que permite el llenado del select de Cargo
    //console.log(diccionarioCargo.length);
    for (let index = 0; index < diccionarioCargo.length; index++) {
      const element = diccionarioCargo[index];
      console.dir(diccionarioCargo);

      let cargoId = element.idCargo;
      let cargoNombre = element.cargo;
      
      if (_selectCargo.toString().trim() == cargoNombre.toString().trim()) {
        let element = document.getElementById("select_CargoU");
        element.value = cargoId;  // asigna el idDepartamento al element.value
      }
    }

    //for, que permite el llenado del select de Sexo
    //console.log(diccionarioSexo.length);
    for (let index = 0; index < diccionarioSexo.length; index++) {
      const element = diccionarioSexo[index];
      console.dir(diccionarioSexo);

      let sexoId = element.idSexo;
      let sexoNombre = element.sexo;
      
      if (_selectSexo.toString().trim() == sexoNombre.toString().trim()) {
        let element = document.getElementById("select_SexoU");
        element.value = sexoId;  // asigna el idDepartamento al element.value
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
  $('#formEmpleadoU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _codEmpleado = $.trim($('#codEmpleadoU').val()); 
    _nombres = $.trim($('#nombresU').val());  
    _apellidos = $.trim($('#apellidosU').val()); 
    _telefono = $.trim($('#telefonoU').val()); 
    _celular = $.trim($('#celularU').val());
    _extension = $.trim($('#extensionU').val()); 
    _selectSexo = $.trim($('#select_SexoU').val() || []); 
    _selectCargo = $.trim($('#select_CargoU').val() || []); 
    _eMail = $.trim($('#eMailU').val()); 
    _estado = $.trim($('#estadoU').val()); 

    //alert(_eMail+ ">>>>>>>"+_estado);
    //alert(_extension);
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data: {codEmpleado:_codEmpleado, nombres:_nombres, apellidos:_apellidos, telefono:_telefono, celular:_celular, extension:_extension, select_Sexo: _selectSexo, select_Cargo:_selectCargo, eMail:_eMail, estado:_estado, opcion:opcion},   

          success: function(data) {
          console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaEmpleado.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
            } 
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _codEmpleado = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _nombre = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Empleado: " + _nombre);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Empleado");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, codEmpleado:_codEmpleado},    
            success: function(data) {
              //console.log(data);
              if(data == 0){
                alertify.success("Registro eliminado satisfactoriamente.");
                $("#modalEliminar").modal("hide");
                tablaEmpleado.row(fila.parents('tr')).remove().draw(); 
              }else{
                alertify.warning("Primero, necesita eliminar este registro en la entidad Gestión de Usuario, para que este sea eliminado.");
                $('#codEmpleado').focus();
              }
                               
            }
          }); 
  });
     
});    

