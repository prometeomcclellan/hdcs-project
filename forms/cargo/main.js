$(document).ready(function() {
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var deptosDiccionario = [];
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
      deptosDiccionario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaCargos = $('#tablaCargos').DataTable({  
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
          {"data": "idCargo"},
          {"data": "cargo"},
          {"data": "departamento"}
          //{"defaultContent": ""} //"<div class='text-center'><div class='btn-group'><button class='btn btn-warning btnEditar'><i class='material-icons' >edit</i></button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i></button></div></div>" 
      ]
  });  



    



  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formCargosC").trigger("reset");
    $('#cargo').focus();
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Cargo");          
    $("#modalCREAR").modal("show");       
  });   


    //submit para el alta
  $('#formCargosC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _cargo = $.trim($('#cargo').val());   
    _depto = $.trim($('#select_Depto').val() || []); 

    //alert(_depto);                       
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {cargo:_cargo, idDepartamento:_depto, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
            }else{
              alertify.warning("Este cargo, ya se encuentra registrado.");
              $('#cargo').focus();
            }
            tablaCargos.ajax.reload(null, false);
          }
      });                                             
  }); 
    
  

  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    id = parseInt(fila.find('td:eq(0)').text());   //ID
    cargo = fila.find('td:eq(1)').text();
    _nombreDepto = fila.find('td:eq(2)').text();
    
    opcion = 2; //editar
    $("#cargoU").val(cargo);
    
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Cargo");
    $("#modalUPDATE").modal("show"); 
    
    //for, que permite el llenado del select de departamento
    //console.log(deptosDiccionario.length);
    for (let index = 0; index < deptosDiccionario.length; index++) {
      const element = deptosDiccionario[index];
      console.dir(deptosDiccionario);

      let depId = element.idDepartamento;
      let depNombre = element.departamento;
      
      if (_nombreDepto.toString().trim() == depNombre.toString().trim()) {
        let element = document.getElementById("select_DeptoU");
        element.value = depId;  // asigna el idDepartamento al element.value
      }
    }
    
  });


    //submit para la Actualización
  $('#formCargosU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _cargo = $.trim($('#cargoU').val());   
    _depto = $.trim($('#select_DeptoU').val() || []);   
    //alert(_depto);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {id:id, cargo:_cargo, idDepartamento:_depto, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              $('#modalUPDATE').modal('hide');
            }else{
              alertify.warning("Este cargo, ya se encuentra registrado.");
              $('#cargoU').focus();
            }
            tablaCargos.ajax.reload(null, false);
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    cargo = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Cargo: " + cargo);
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Cargo");            
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
              tablaCargos.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    