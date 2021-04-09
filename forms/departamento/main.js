$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  opcion = 4;
    
  tablaDepartamentos = $('#tablaDepartamentos').DataTable({  
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
          {"data": "idDepartamento"},
          {"data": "departamento"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btnEditar'><i class='material-icons' id='editar'>edit</i></button><button class='btn btn-danger btnBorrar'><i class='material-icons'>delete</i></button></div></div>" }
      ]
  });     


  //submit para el Alta y Actualización
  $('#formDepartamentos').submit(function(e){                         
    e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
    departamento = $.trim($('#departamento').val());                              
      $.ajax({
        url: "crud.php",
        type: "POST",
        datatype:"json",    
        data:  {id:id, departamento:departamento, opcion:opcion},    
          success: function(data) {
          //console.log(data);
            if(data == 0){
              if(opcion == 1){
                alertify.success("Registro agregado satisfactoriamente.");
              }else{
                alertify.success("Registro actualizado satisfactoriamente.");
              }
              $('#modalCRUD').modal('hide');
            }else{
              alertify.warning("Este departamento, ya se encuentra registrado.");
              $('#departamento').focus();
            }
            tablaDepartamentos.ajax.reload(null, false);
          }
      });			        											     			
  });
        


  //NUEVO    
  $("#btnNuevo").click(function(){
    id=null;
    opcion = 1; //alta
    $("#formDepartamentos").trigger("reset");
    $('#departamento').focus();
    //$(".modal-header").css("background-color", "#003399"); 
    $(".modal-header").css("color", "white");
    //$("#btnGuardar").css("background-color", "#28a745"); 
    $(".modal-title").text("Nuevo Departamento");          
    $("#modalCRUD").modal("show");       
  });    
    

  // EDITAR    
  $(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");                  //FILA
    id = parseInt(fila.find('td:eq(0)').text());   //ID
    departamento = fila.find('td:eq(1)').text();
      
    $("#departamento").val(departamento);

    opcion = 2; //editar
    
    $('#departamento').focus();
    //$(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    //$("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Modificar Departamento");            
    $("#modalCRUD").modal("show");    
  });


  //ELIMINAR
  $(document).on("click", ".btnBorrar", function(){
    fila = $(this);           
    id = parseInt($(this).closest('tr').find('td:eq(0)').text()) ;
    depto = ($(this).closest('tr').find('td:eq(1)').text()) ;   
    opcion = 3; //eliminar   

    $("#panel_eliminar").html("Departamento: " + depto);
    //$(".modal-header").css("background-color", "#003399");
    $(".modal-header").css("color", "white");
    //$("#btnGuardar").css("background-color", "#003399"); 
    $(".modal-title").text("Eliminar Departamento");            
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
        tablaDepartamentos.row(fila.parents('tr')).remove().draw();                  
      }
    }); 
  });
     
});    