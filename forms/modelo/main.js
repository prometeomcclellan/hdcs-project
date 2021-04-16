$(document).ready(function() {
var idModelo, opcion;
var fila; //captura la fila, para editar o eliminar
var marcaDiccionario = [];
opcion = 4;


//Consulta a la tabla departamentos   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      console.log("nuestra data length");

      console.log(JSON.parse(data));
      marcaDiccionario = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });

//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  tablaModelos = $('#tablaModelos').DataTable({  
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
          {"data": "idModelo"},
          {"data": "modelo"},
          {"data": "marca"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-warning btnEditar'><i class='material-icons' >edit</i></button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i></button></div></div>" }
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
    $(".modal-title").text("Nuevo Modelo");          
    $("#modalCREAR").modal("show");       
  });   


    //submit para el alta
  $('#formModeloC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _modelo = $.trim($('#modelo').val());   
    _marca = $.trim($('#select_Marca').val() || []); 

    //alert(_marca);                       
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {modelo:_modelo, marca:_marca, opcion:opcion},   

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro agregado satisfactoriamente.");
              $('#modalCREAR').modal('hide');
            }else{
              alertify.warning("Este modelo, ya se encuentra registrado.");
              $('#modelo').focus();
            }
            tablaModelos.ajax.reload(null, false);
          }
      });                                             
  }); 
    
  

  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _idModelo = parseInt(fila.find('td:eq(0)').text());   //ID
    _modelo = fila.find('td:eq(1)').text();
    _nombreMarca = fila.find('td:eq(2)').text();
    
    opcion = 2; //editar
    $("#modeloU").val(_modelo);
    
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardarU").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Modificar Modelo");
    $("#modalUPDATE").modal("show"); 
    
    //for, que permite el llenado del select de departamento
    //console.log(marcaDiccionario.length);
    for (let index = 0; index < marcaDiccionario.length; index++) {
      const element = marcaDiccionario[index];
      console.dir(marcaDiccionario);

      let marcaId = element.idMarca;
      let marcaNombre = element.marca;
      
      if (_nombreMarca.toString().trim() == marcaNombre.toString().trim()) {
        let element = document.getElementById("select_MarcaU");
        element.value = marcaId;  // asigna el idMarca al element.value
      }
    }
    
  });


    //submit para la Actualización
  $('#formModeloU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _modelo = $.trim($('#modeloU').val());   
    _marca = $.trim($('#select_MarcaU').val() || []);   
    //alert(_depto);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {idModelo:_idModelo, modelo:_modelo, marca:_marca, opcion:opcion},    

          success: function(data) {
          //console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              $('#modalUPDATE').modal('hide');
            }else{
              alertify.warning("Este modelo, ya se encuentra registrado.");
              $('#modeloU').focus();
            }
            tablaModelos.ajax.reload(null, false);
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _idModelo = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _modelo = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Modelo: " + _modelo);
    $(".modal-header").css("background-color", "#1a3c8a");
    $(".modal-header").css("color", "white");
    $("#btnGuardar").css("background-color", "#1a3c8a"); 
    $(".modal-title").text("Eliminar Modelo");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, idModelo:_idModelo},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaModelos.row(fila.parents('tr')).remove().draw();                  
             }
          }); 
  });
     
});    