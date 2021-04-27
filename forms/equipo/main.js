$(document).ready(function() {

  let esSesion = localStorage.getItem("esSesion");
  alert(esSesion)
var id, opcion;
var fila; //captura la fila, para editar o eliminar
var diccionarioTipoEquipo = [];
var diccionarioModelo = [];
opcion = 4;

let equipoNombre;
let diccionarioEquipoTipo = [];
let modeloNombreP;
let diccionarioModelos = [];

  //Consulta a la tabla empleado   
  $.ajax({
    url: "crud.php",
    type: "POST",
    datatype:"json",
    data: {opcion:5},
    success: function(data) {
      //console.log("nuestra data length");

      //console.log(JSON.parse(data));
      diccionarioTipoEquipo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
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
      diccionarioModelo = JSON.parse(data); //JSON.parse = cambiar el formato de dato a JSON
    }
  });


  //cargar la mascara de entrada para numero de inventario
  $("#telefono").mask("#-9999");


  
//MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
  
  


  tablaEquipo = $('#tablaEquipo').DataTable({
    //"sScrollY": (200), 
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "initComplete": function(settings, json) {

      //alert( 'DataTables has finished its initialisation.' );
      let editarContainer = document.getElementsByClassName("btnEditar");
        //alert(editarContainer.length)
        for (let index = 0; index < editarContainer.length; index++) {
          const element = editarContainer[index];
          $(".btnEditar").eq(index).removeClass("btn-primary");
          $(".btnEditar").eq(index).addClass("btn-warning");
        }

        $('#tablaEquipo').css("height", "300px");
        $('#tablaEquipo').css("max-height", "300px");

        $(".page-link").eq(1).css("background-color", "#1a3c8a");
        $(".page-link").eq(1).css("border-color", "#1a3c8a");

        $('div.dataTables_scrollBody').height(300);
    },
      
      "ajax":{            
          "url": "crud.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":"",
          "async": false
      },
      "columns":[
          {"data": "codEquipo"},
          {"data": "numInventario"},
          {"data": "tipoEquipo"},
          {"data": "modelo"},
          {"data": "serie"},
          {"data": "serviceTag"},
          {"data": "descripcionEquipo"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'>   <button class='btn btn-primary btnEditar'   data-toggle='tooltip' title='Editar'>  <i class='material-icons' >edit</i> </button>            <button class='btn btn-danger btnBorrar' data-toggle='tooltip'  title='Eliminar'><i class='material-icons'>delete</i> </button></div></div>" }
      ]
  });  


  //NUEVO  ---------------------------------------------------------------------------------------
  $("#btnNuevo").click(function(){
    opcion = 1; //alta
    $("#formEquipoC").trigger("reset");
    //$(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    //$("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo equipo");          
    $("#modalCREAR").modal("show");       
  });   

//al darle click en guargar equipo se mostrara la siguiente modal(Modal de pregunta)
  $("#btnGuardar").click(function(){
    //opcion = 1; //alta
    $("#formMADC").trigger("reset");
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarSI").css("background-color", "#28a745"); 
    $("#btnGuardarNO").css("background-color", "#FF0000"); 
    $(".modal-titleP").text("Detalle de computadora");                 
  }); 

//al darle click sobre la opcion de SI a la pregunta, se mostrara el modal(Detalle de Equipo)
  $("#btnGuardarSI").click(function(){
    opcion = 7; //alta detalle equipo
    $("#formDetalleEquipo").trigger("reset");
    $(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    $("#btnGuardarDetalleEquipo").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo detalle de equipo ");                
  });   



//EVENTO CHANGE = para mostrar los modelos de dicha marca seleccionada
$("#select_marca").on("change", selectMarcas);

    function selectMarcas(){

      marca = document.getElementById("select_marca");
      marcaId = marca.value;
      //alert(marcaId);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",
        data: {opcion:8, marca:marcaId },
          success: function(data) {
            console.log(data);
            diccionarioModelo = [];
            diccionarioModelo = JSON.parse(data);
            $("#select_Modelo").empty(); //Limpia el select, para cuando se cargue este listo. 

            for (let ind = 0; ind < diccionarioModelo.length; ind++) {
              const element = diccionarioModelo[ind];
              diccionarioModelos.push(
                {modeloId:element.idModelo, modeloNombre:element.modelo}
              )
              //Agrego los modelos al select, segun la marca seleccionada
              $("#select_Modelo").append("<option value="+element.idModelo+" class='form-control marca-input'>"+element.modelo+"</option>");
            }
//
            let tipoContenedor = document.getElementsByClassName("tipo-input");

            for (let index = 0; index < tipoContenedor.length; index++) {
              let tipoId = $(".tipo-input").eq(index).val();
              let tipoNombre = $(".tipo-input").eq(index).text();
              diccionarioEquipoTipo.push(
                {tipoId:tipoId, tipoNombre:tipoNombre}
              )
            }

          }
      });
    }



    //submit para el alta
  $('#formEquipoC').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

    _codEquipo = $.trim($('#codEquipo').val()); 
    _numInventario = $.trim($('#numInventario').val()); 
    _selectTipoEquipo = $.trim($('#select_TipoEquipo').val() || []);
    _descripcion = $.trim($('#descripcion').val()); 
    _selectMarca = $.trim($('#select_marca').val() || []); 
    _selectModelo = $.trim($('#select_Modelo').val() || []); 
    _serie = $.trim($('#serie').val()); 
    _serviceTag = $.trim($('#serviceTag').val()); 

    tipoEquipoNombre = $.trim($('#select_TipoEquipo').text() || []);
    selectModeloNombre = $.trim($('#select_Modelo').val() || []); 

    

      //alert(_fechaControl); 
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEquipo:_codEquipo, numInventario:_numInventario, selectTipoEquipo:_selectTipoEquipo, selectModelo:_selectModelo, serie:_serie, serviceTag:_serviceTag, descripcion:_descripcion, opcion:opcion},    

          success: function(data) {
            //console.log(data);
            if (data == 3) {
              alertify.warning("Este Código de Equipo, ya se encuentra registrado.");
              $('#codEquipo').focus();
            }else if(data == 1){
              alertify.warning("Esta serie, ya se encuentra registrada.");
              $('#serie').focus();
            }else if(data == 2){
              alertify.warning("Este ServiceTag, ya se encuentra registrado.");
              $('#serviceTag').focus();
            }
            else if(data == 0) {
              alertify.success("Registro de equipo agregado satisfactoriamente.");
              tablaEquipo.ajax.reload(null, false);
              $('#modalCREAR').modal('hide');       // Oculto la modal de crear Equipo
              
              if (_selectTipoEquipo == 3) { // 3=Computadora
                $('#modalPregunta').modal('show') //Muestro la modal de la pregunta si desea agregar detalle si es computadora

                $('#formMADC').submit(function(e){   //OBTENIDO DL VALOR DE SI DE LA MODAL DE LA PREGUNTA                      
                  e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
                  $('#modalPregunta').modal('hide')//Oculto la modal de la pregunta 
                  $('#modalDetalleEquipoCompu').modal('show') // muestro la modal (Detalle de Equipo)

                    $("#codEquipoP").val(_codEquipo);// el codigo del equipo que se guardo, ahora lo asigno a la caja de texto del detalle de equipo para guardar el detalle 

                    for (let index = 0; index < diccionarioEquipoTipo.length; index++) {
                      const element = diccionarioEquipoTipo[index];
                      let equipoId = element.tipoId;
                     
                      if(equipoId.toString().trim() == _selectTipoEquipo.toString().trim()){
                        equipoNombre = element.tipoNombre;
                        
                        $("#tipoEquipoP").val(equipoNombre);
                      }
                    }

                    for (let index = 0; index < diccionarioModelos.length; index++) {
                      const element = diccionarioModelos[index];
                      let modeloId = element.modeloId;
                      
                      if(modeloId.toString().trim() == selectModeloNombre.toString().trim()){
                        modeloNombreP = element.modeloNombre;
                        
                        $("#modeloP").val(modeloNombreP);
                      }
                    }



                    $('#formDetalleEquipo').submit(function(e){   //OBTENIDO DL VALOR DE SI DE LA MODAL DE LA PREGUNTA                      
                      e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página

                        _select_CodEquipo = $.trim($('#codEquipoP').val()); 
                        _select_TipoRam = $.trim($('#select_TipoRamP').val() || []);  
                        _select_CapacidadRam = $.trim($('#select_CapacidadRamP').val() || []); 
                        _select_VelocidadRam = $.trim($('#select_VelocidadRamP').val() || []); 
                        _select_TipoDisco = $.trim($('#select_TipoDiscoP').val() || []); 
                        _select_CapacidadDisco = $.trim($('#select_CapacidadDiscoP').val() || []); 

                          $.ajax({
                            url: "crud.php",
                            type: "POST",
                            datatype:"json",    
                            data:  {codEquipo:_select_CodEquipo, select_TipoRam:_select_TipoRam, select_CapacidadRam:_select_CapacidadRam, select_VelocidadRam:_select_VelocidadRam, select_TipoDisco:_select_TipoDisco, select_CapacidadDisco:_select_CapacidadDisco, opcion:opcion},    
                              success: function(data) {
                              console.log(data);
                                if(data == 0){
                                  alertify.success("Registro detalle de equipo agregado satisfactoriamente.");
                                  $('#modalDetalleEquipoCompu').modal('hide');
                                  tablaDetalleEquipo.ajax.reload(null, false);
                                }  
                              }
                          }); 
                    }); 
                }); 

              }else{ }
            }
          }
      }); 
                                           
  }); 
    


  // EDITAR  ---------------------------------------------------------------------------------------  
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    _codEquipo = (fila.find('td:eq(0)').text());   //ID
    _numInventario = fila.find('td:eq(1)').text();
    _tipoEquipo = fila.find('td:eq(2)').text();
    _modelo = fila.find('td:eq(3)').text();
    _serie = fila.find('td:eq(4)').text();
    _serviceTag = fila.find('td:eq(5)').text();
    _descripcionEquipo = fila.find('td:eq(6)').text();
  
    opcion = 2; //editar
    $("#codEquipoU").val(_codEquipo);
    $("#numInventarioU").val(_numInventario);
    $("#serieU").val(_serie);
    $("#serviceTagU").val(_serviceTag);
    $("#descripcionU").val(_descripcionEquipo);
    
    //$(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    //$("#btnGuardarU").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar equipo");
    $("#modalUPDATE").modal("show"); 
    

    //for, que permite el llenado del select de Tipo Equipo
    //console.log(diccionarioTipoEquipo.length);
    for (let index = 0; index < diccionarioTipoEquipo.length; index++) {
      const element = diccionarioTipoEquipo[index];
      console.dir(diccionarioTipoEquipo);

      let tipoEquipoId = element.idTipoEquipo;
      let tipoEquipoNombre = element.tipoEquipo;

      if (_tipoEquipo.toString().trim() == tipoEquipoNombre.toString().trim()) {
        let element = document.getElementById("select_TipoEquipoU");
        element.value = tipoEquipoId;  // asigna el idTipoEquipo al element.value
      }
    }

    //for, que permite el llenado del select de Modelo
    //console.log(diccionarioModelo.length);
    for (let index = 0; index < diccionarioModelo.length; index++) {
      const element = diccionarioModelo[index];
      console.dir(diccionarioModelo);

      let modeloId = element.idModelo;
      let modeloNombre = element.modelo;
      
      if (_modelo.toString().trim() == modeloNombre.toString().trim()) {
        let element = document.getElementById("select_ModeloU");
        element.value = modeloId;  // asigna el idModelo al element.value
      }
    }
    
  });


    //submit para la Actualización
  $('#formEquipoU').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
   
    _codEquipo = $.trim($('#codEquipoU').val()); 
    _numInventario = $.trim($('#numInventarioU').val()); 
    _selectTipoEquipo = $.trim($('#select_TipoEquipoU').val() || []);  
    _selectModelo = $.trim($('#select_ModeloU').val() || []); 
    _serie = $.trim($('#serieU').val()); 
    _serviceTag = $.trim($('#serviceTagU').val()); 
    _descripcion = $.trim($('#descripcionU').val());  

    //alert(_idControlMantU);

      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {codEquipo:_codEquipo, numInventario:_numInventario, selectTipoEquipo:_selectTipoEquipo, selectModelo:_selectModelo, serie:_serie, serviceTag:_serviceTag, descripcion:_descripcion, opcion:opcion},   

          success: function(data) {
          console.log(data);
            if(data == 0){
              alertify.success("Registro actualizado satisfactoriamente.");
              tablaEquipo.ajax.reload(null, false);
              $('#modalUPDATE').modal('hide');
            }else if(data == 2){
              alertify.warning("Esta ServiceTag, ya se encuentra registrada.");
              $('#serviceTagU').focus();
            }
            else if(data == 1) {
              alertify.warning("Esta serie, ya se encuentra registrada.");
              $('#serieU').focus();
            }
            
          }
      });                                             
  });






  //ELIMINAR  ---------------------------------------------------------------------------------------
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    _codEquipo = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    _serie = ($(this).closest('tr').find('td:eq(3)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Equipo con serie: " + _serie);
    //$(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    //$("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar control mantenimiento");            
    $("#modalEliminar").modal("show");  
  });

  $('#formEliminar').submit(function(e){  
        e.preventDefault();
          $.ajax({
            url: "crud.php",
            type: "POST",
            datatype:"json",    
            data:  {opcion:opcion, codEquipo:_codEquipo},    
            success: function(data) {
              $("#modalEliminar").modal("hide");
              alertify.success("Registro eliminado satisfactoriamente.");
              tablaEquipo.row(fila.parents('tr')).remove().draw();                  
            }
          }); 
  });
     
});    