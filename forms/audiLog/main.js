$(document).ready(function() {
  var id, opcion;
  var fila; //captura la fila, para editar o eliminar
  opcion = 1;
    
  tablaAuditoria = $('#tablaAuditoria').DataTable({  
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
          {"data": "idAudiLog"},
          {"data": "fechaEvento"},
          {"data": "userName"},
          {"data": "tipoTransaccion",
              render: function(data,type,row){
                        if(data == "Inserción"){
                          return "<span class='IAE badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "Actualización"){
                          return "<span class='IAE badge badge-warning badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }else if(data == "Eliminación"){
                          return "<span class='IAE badge badge-danger badge-pill m-r-5 m-b-5'>"+data+"</span>";
                        }
              }
          },
          {"data": "descripcion"}
        ]
  });     
     
});    