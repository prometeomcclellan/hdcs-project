$(document).ready(function() {
let isPhoto = false;
  var currentUrl = location.pathname;
  let mantenimientosArray = [];
  let mantenimientosArrayX = [];
  let mantenimientosXUsuarioArray = [];
  let mantenimientosPendientesArray = [];
  let userCountArray = [];
  let deptIdsCount = [];
  let deptCountArray = [];
  let notificacionesIdsArray = [];
  let arrayFilter = [];
  let tableHeight = 300;
  let deptosHeight = 0;

  let esCambioFoto = false;
  let esECambioFoto = false;
  let esCambioNombre = false;
  let esCambioUsuario = false;

  let fotoUrl = "";
  let eFotoUrl = "";
  let uNombres = "";
  let uNombre = "";
  let fotoStatus = "";
  let fotoIndex = 0;

  let statusD = 0;
  let statusP = 0;
  let statusF = 0;

  let oClass;
  let oClassUs;

  let countDept;
  let esteEstado;

  let totalMantenimientos = 0;

  let outUrl;
  let outCallUrl;
  let urlString;
  let urlFilter = "inicio";

  let tiempoNotificacion = 0;
  let estadoNotificacion = "";

  var mantPorDepHeight;

  let thumbIndex = 0;
  const className = "active";
  let indexThumb; let thumbElements;
  let thumbElement;

  let wrapperWidth;
  let percentWidth;
  function percentwidth(elem){
    if (elem) {
      var pa= elem.offsetParent || elem;
      return ((elem.offsetWidth/pa.offsetWidth)*100).toFixed(2);//+'%';  
    }
    
}



$('#formLogin').submit(function(e){
  
  e.preventDefault();
  var _usuario = $.trim($("#usuario").val());    
  var _password =$.trim($("#password").val());
  //var _abierta =$.trim($("#abierta").val());  
  let sAbierta = document.getElementById("abierta").checked;

  //alert(sAbierta)
    
  if(usuario.length == "" || password == ""){
    Swal.fire({
      type:'warning',
      title:'Debe ingresar un usuario y/o password',
    });
    return false; 

  }else{
    let thisData = [];
    $.ajax({
      url:"bd/login.php",
      type:"POST",
      //datatype: "json",
      data: {usuario:_usuario, password:_password, abierta:sAbierta}, 
        success:function(data){  
          //console.log("mi data");
          //console.dir(JSON.parse(data));
          //console.dir(thisData); 
          //console.log(thisData[0].status)

          thisData = JSON.parse(data);
          //thisData = data;
                    
          localStorage.setItem("nombreUsuario", thisData[0].nombreEmpleado);  
          
          if(thisData[0].status == 500){
            Swal.fire({
              type:'error',
              title:'Usuario / password incorrecta   o se encuentra inactivo ',
            });
          }else{
            let idDeUsuario = thisData[0].idUsuario;
            localStorage.setItem("idDeUsuario", idDeUsuario);

            if (sAbierta == true) {
              localStorage.setItem("esSesion", true);
            }else{
              localStorage.setItem("esSesion", false);
            }

            $.ajax({
              url:"bd/get_user_photo.php",
              type:"POST",
              async: false,
              data: {idUsuario:idDeUsuario}, 
                success:function(dataPhoto){
                  //console.log("de la foto");
                  if(dataPhoto.toString().trim() == "0"){
                    localStorage.setItem("fotoStatus", 0);
                  }else{
                    localStorage.setItem("fotoStatus", 1);
                    localStorage.setItem( "urlFoto", dataPhoto.toString().trim());
                  }
                  
                }      
              });

              $.ajax({
                url:"bd/get_user_name.php",
                type:"POST",
                async: false,
                data: {idUsuario:idDeUsuario}, 
                  success:function(dataName){
                    //console.log("del nombre");
                    //console.log(dataName);
                  if(dataName.toString().trim() == "0"){}else{
                    localStorage.setItem( "usuarioNombre", dataName.toString().trim());
                  }
                }      
              });

            Swal.fire({
              type:'success',
              title:'¡Bienvenido ' + thisData[0].nombreEmpleado +'!',
              confirmButtonColor:'#3085d6',
              confirmButtonText:'Ingresar'
            }).then((result) => {
                if(result.value){
                  //window.location.href = "forms/controlMantenimiento/index.php";
                  window.location.href = "../HDCS/inicio/dashboard.php";
                  // http://localhost/HDCS/dashboard/index2.html
                }
              })       
          }
          /**/
        } 
      });
    }       
});
var formData = new FormData();
var eFormData = new FormData();

urlString = currentUrl.indexOf(urlFilter);

if (urlString == -1) {
  outCallUrl = "../../forms/usuario/crud.php";
}else{
  outCallUrl = "../forms/usuario/crud.php";
}
 /**/ 

  $.ajax({
    type: "post",
    crossOrigin: true,
    url: outCallUrl,
    data: {opcion:4},
    async: false,
    success: function (data) {
      //console.log("data de usuarios");
      //console.dir(JSON.parse(data));
      userCountArray = JSON.parse(data);
      //console.log(userCountArray.length);

      if (userCountArray.length == 0 || userCountArray.length == null) {
        $("#userCount").text(0);
      }else{
        $("#userCount").text(userCountArray.length);
      }
      
    }
  });

//alert(currentUrl)
if(currentUrl == "/HDCS/inicio/reporteria.php"){

  //console.log("Mi array");
  //console.dir(userCountArray);

  // mantenimientos por usuario
  let elemRep = document.getElementById("wrapperRep"); // .offsetWidth; //$("#wrapper").attr("width");
  let wrapperWidthR = percentwidth(elemRep);
  
  let percentWidthR = Math.round(wrapperWidthR);

  fotoStatus = localStorage.getItem("fotoStatus");
  nombreU = localStorage.getItem("nombreUsuario");
  uNombre = localStorage.getItem("usuarioNombre");

  $("#usuarioNombreR").text(nombreU);

  //alert(fotoStatus)
  if(fotoStatus == "0"){}else{
    fotoUrl = localStorage.getItem("urlFoto");
    $('#fotoDeUsuarioR').css("background-image", "url('" + fotoUrl + "')");
    $("#fotoDeUsuarioR").css("display", "inherit");
    $("#iconoUsuarioR").css("display", "none");
  }

  

  $.ajax({
    type: "get",
    crossOrigin: true,
    url: "../bd/get_control_mantenimiento_pendiente.php",
    async: false,
    success: function (data) {
      console.log("datos de mantenimientos pendientes");
      console.dir(JSON.parse(data));
      mantenimientosPendientesArray = JSON.parse(data);
      let sortedPArray = mantenimientosPendientesArray.sort();

      for (let indexPend = 0; indexPend < sortedPArray.length; indexPend++) {

        const elementPend = sortedPArray[indexPend];
        let oNumberP = elementPend.idControlMantenimiento+"-"+elementPend.idSolicitudMantenimiento;
        let oEquipmentP = elementPend.descripcionEquipo;
        let oDeptoP = elementPend.departamentoP;
        let oStatusP = elementPend.estadoControlMantenimiento;
        let oSDateP = elementPend.fechaSolicitudMantenimiento;
        let oDateP = elementPend.fechaControlMantenimiento;
        let oClassP = "success";
        

        //alert(oStatusP) diagnosPercent  repairPercent finishPercent

        if(oStatusP == "Diagnosticado"){
          oClassP = "danger";
        }

        if(oStatusP == "En reparación"){
          oClassP = "warning";
        }

        if(oStatusP == "Finalizado"){
          oClassP = "success";
        }

        if (indexPend == (mantenimientosArray.length - 1)) {
          $("#statusD").text(statusD);
          $("#statusP").text(statusP);
          $("#statusF").text(statusF);

          let porcentajeD = (statusD/mantenimientosArray.length)*100;
          let porcentajeP = (statusP/mantenimientosArray.length)*100;
          let porcentajeF = (statusF/mantenimientosArray.length)*100;
          $("#diagnosPercent").text(porcentajeD+"%");
          $("#repairPercent").text(porcentajeP+"%");
          $("#finishPercent").text(porcentajeF+"%");

          
        }

        $("#mantenimientosPendientesTable").append(
          "<tr class='maintinance-pending'>"
            +"<td>"+oNumberP+"</td>"+"<input type='hidden' value="+elementPend.idControlMantenimiento+" class='order-number'>"
            +"<td>"+oEquipmentP+"<span class='order-description' style='display:none;'>"+oEquipmentP+"</span></td>"
            +"<td><span class='badge badge-"+oClassP+"' style='width:120px;'>"+oStatusP+"</span><span class='order-status' style='display:none;'>"+oStatusP+"</span></td>"
            +"<td>"
              +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oSDateP+"</div>"+"<input type='hidden' value="+oSDateP+" class='order-sdate'>"
            +"</td>"
            +"<td>"
              +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDateP+"</div>"+"<input type='hidden' value="+oDateP+" class='order-odate'>"
            +"</td>"
            +"<td>"
              +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDeptoP+"</div>"+"<input type='hidden' value="+oDeptoP+" class='order-odate'>"
            +"</td>"
            
           +"</tr>");
      }

    }
  });

  for (let indexUsu = 0; indexUsu < userCountArray.length; indexUsu++) {
    const element = userCountArray[indexUsu];
    
    $.ajax({
      type: "post",
      crossOrigin: true,
      url: "../bd/get_control_mantenimiento_por_usuario.php",
      data: {idUsuario:element.idUsuario},
      async: false,
      success: function (data) {
        //console.log("datos de mantenimiento por usuario");
        //console.dir(JSON.parse(data));
        mantenimientosXUsuarioArray = JSON.parse(data);
        let sortedArray = mantenimientosXUsuarioArray.sort();

        for (let index = 0; index < sortedArray.length; index++) {
          const element = sortedArray[index];
          let responseStatus = element.status;

          if (responseStatus == 500) {
            
          }

          if (responseStatus == 200) {
            let oNumberUs = element.nombre;
            let telefono = element.telefono;
            let celular = element.celular;
            let extension = element.extension;
            let idCargo = element.idCargo;
            let cargo = element.cargo;
            let estado = element.estado;
            let row_cnt = element.row_cnt;


            if (window.matchMedia("(max-width: 700px)").matches) {
              /* The viewport is less than, or equal to, 700 pixels wide */
              if (row_cnt == 0) {
                $("#mantenimientosXUsuarioTable").append(
                  "<tr class='user-maintinance'>"
                    +"<td>"
                      +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oNumberUs+"</div>"
                    +"</td>"
                    
                    +"<td>"+celular+"</td>"
                    +"<td>"+extension+"</td>"
                    
                    +"<td>"
                      +row_cnt
                    +"</td>"
                   +"</tr>");
              }else{
                $("#mantenimientosXUsuarioTable").prepend(
                  "<tr class='user-maintinance'>"
                    +"<td>"
                      +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oNumberUs+"</div>"
                    +"</td>"
                    
                    +"<td>"+celular+"</td>"
                    +"<td>"+extension+"</td>"
                    
                    +"<td>"
                      +row_cnt
                    +"</td>"
                   +"</tr>");
              }
            } else {
              /* The viewport is greater than 700 pixels wide */
              if (row_cnt == 0) {
                $("#mantenimientosXUsuarioTable").append(
                  "<tr class='user-maintinance'>"
                    +"<td>"
                      +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oNumberUs+"</div>"
                    +"</td>"
                    +"<td>"+telefono+"</td>"
                    +"<td>"+celular+"</td>"
                    +"<td>"+extension+"</td>"
                    +"<td>"
                      +cargo
                    +"</td>"
                    +"<td>"
                      +estado
                    +"</td>"
                    +"<td>"
                      +row_cnt
                    +"</td>"
                   +"</tr>");
              }else{
                $("#mantenimientosXUsuarioTable").prepend(
                  "<tr class='user-maintinance'>"
                    +"<td>"
                      +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oNumberUs+"</div>"
                    +"</td>"
                    +"<td>"+telefono+"</td>"
                    +"<td>"+celular+"</td>"
                    +"<td>"+extension+"</td>"
                    +"<td>"
                      +cargo
                    +"</td>"
                    +"<td>"
                      +estado
                    +"</td>"
                    +"<td>"
                      +row_cnt
                    +"</td>"
                   +"</tr>");
              }
            }

            
            
          }
        }
      }
    });

    


  }

}  

if(currentUrl == "/HDCS/forms/equipo/index.php"){
    let elems = document.getElementsByClassName("wrapper"); // .offsetWidth; //$("#wrapper").attr("width");
    let elem = elems[0];
    wrapperWidth = percentwidth(elem);
    percentWidth = Math.round(wrapperWidth);
    //alert(percentWidth)
    //MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    

    $("#eUsuarioNombreN").text(nombreU);
    if(fotoStatus == "0"){}else{
      fotoUrl = localStorage.getItem("urlFoto");
      $('#eFotoDeUsuario').css("background-image", "url('../" + fotoUrl + "')");
      $("#eFotoDeUsuario").css("display", "inherit");
      $("#eIconoUsuario").css("display", "none");
    }

    

  }

  if(currentUrl == "/HDCS/forms/usuario/index.php"){
    let elemU = document.getElementById("uWrapper"); // .offsetWidth; //$("#wrapper").attr("width");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
    //alert(percentWidthU)
    //MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    

    $("#eUsuarioNombreU").text(nombreU);
    if(fotoStatus == "0"){}else{
      fotoUrlU = localStorage.getItem("urlFoto");
      $('#eFotoDeUsuarioU').css("background-image", "url('../" + fotoUrlU + "')");
      $("#eFotoDeUsuarioU").css("display", "inherit");
      $("#eIconoUsuarioU").css("display", "none");
    }

    $("#sbarToggler").click(function(){
      if(percentWidthU <= 80){
        $("#uWrapper").css("width", "100%");
      }else{
        $("#uWrapper").css("width", "80%");
      }
      elemU = document.getElementById("uWrapper")
      wrapperWidthU = percentwidth(elemU);
      percentWidthU = Math.round(wrapperWidthU);
    })

  }

  //  sendDateButton
/*
let fromDateValue;
let toDateValue;

let date_input = document.getElementById("fechaInicio");
let date_end = document.getElementById("fechaFinal");
date_input.onchange = function(){
  fromDateValue = this.value;
}
date_end.onchange = function(){
  toDateValue = this.value;
}


$("#sendDateButton").click(function(){

$.ajax({
  type: "post",
  crossOrigin: true,
  url: "../bd/get_mantenimientos_por_periodo.php",
  data: {from:fromDateValue, to:toDateValue},
  async: false,
  success: function (data) {
    //console.log("mantenimiento data extra");
    //console.dir(JSON.parse(data));
    //mantenimientosArrayX = JSON.parse(data);
    //console.log(mantenimientosArrayX.length);
  }
})
});
*/
  if(currentUrl == "/HDCS/forms/departamento/index.php"){
    let elemU = document.getElementById("dWrapper"); // .offsetWidth; //$("#wrapper").attr("width");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
    //alert(percentWidthU)
    //MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    

    $("#eUsuarioNombreU").text(nombreU);
    if(fotoStatus == "0"){}else{
      fotoUrlU = localStorage.getItem("urlFoto");
      $('#eFotoDeUsuarioU').css("background-image", "url('../" + fotoUrlU + "')");
      $("#eFotoDeUsuarioU").css("display", "inherit");
      $("#eIconoUsuarioU").css("display", "none");
    }

    $(".topnav-toggler").click(function(){
      if(percentWidthU <= 80){
        $("#dWrapper").css("width", "100%");
      }else{
        $("#dWrapper").css("width", "80%");
      }
      elemU = document.getElementById("dWrapper")
      wrapperWidthU = percentwidth(elemU);
      percentWidthU = Math.round(wrapperWidthU);
    })

  }

  if(currentUrl == "/HDCS/forms/asignacionEquipo/index.php"){
    let elemU = document.getElementById("dWrapper"); // .offsetWidth; //$("#wrapper").attr("width");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
    //alert(percentWidthU)
    //MOSTRAR ---------------------------------------------------------------------------------------
//DataTable que carga la tabla de inicio del index
fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    

    $("#eUsuarioNombreU").text(nombreU);
    if(fotoStatus == "0"){}else{
      fotoUrlU = localStorage.getItem("urlFoto");
      $('#eFotoDeUsuarioU').css("background-image", "url('../" + fotoUrlU + "')");
      $("#eFotoDeUsuarioU").css("display", "inherit");
      $("#eIconoUsuarioU").css("display", "none");
    }

    $("#dbarToggler").click(function(){
      if(percentWidthU <= 80){
        $("#dWrapper").css("width", "100%");
      }else{
        $("#dWrapper").css("width", "80%");
      }
      elemU = document.getElementById("dWrapper")
      wrapperWidthU = percentwidth(elemU);
      percentWidthU = Math.round(wrapperWidthU);
    })

  }

  if(currentUrl == "/HDCS/inicio/dashboard.php"){
    mantPorDepHeight = document.getElementById('mantPorDep').clientHeight;
    document.getElementById('repSegEst').style.height = (mantPorDepHeight)+"px";

    $.ajax({
      type: "post",
      crossOrigin: true,
      url: "../forms/equipo/crud.php",
      data: {opcion:4},
      async: false,
      success: function (data) {
        //console.log("data de equipos");
        //console.dir(JSON.parse(data));
        let equipoArray = JSON.parse(data);
        //console.log(equipoArray.length);

        if (equipoArray.length == 0 || equipoArray.length == null) {
          $("#equipmentCount").text(0);
        }else{
          $("#equipmentCount").text(equipoArray.length);
        }
        
      }
    });

    // Gráficas 
    var donutData        = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor : ['purple', '#007bff', '#17a2b8', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }

    let colorIndex = 0;
    let oDeptoId;
    let colorClassArray = ["danger", "success", "warning", "info", "primary", "secondary"];

    $.ajax({
      type: "get",
      crossOrigin: true,
      url: "../bd/get_maintineance_data.php",
      async: false,
      success: function (data) {
        //console.log("mantenimiento data extra");
        //console.dir(JSON.parse(data));
        mantenimientosArrayX = JSON.parse(data);
        //console.log(mantenimientosArrayX.length);

        for (let index = 0; index < mantenimientosArrayX.length; index++) {
          const element = mantenimientosArrayX[index];
          oDeptoId = element.idDepartamento;
          let estadoId = element.idEstadoControlMantenimiento;
          let sum = 0;

          if (deptIdsCount.includes(oDeptoId)) {
            sum = sum+1;
            deptIdsCount.push({depto: oDeptoId, suma:sum, estado:estadoId});
          }else{
            sum = 1;
            deptIdsCount.push({depto: oDeptoId, suma:sum, estado:estadoId});
          }

        

          if (index == (mantenimientosArrayX.length-1)) {
            //console.log("los valores por depto");
            //console.dir(deptIdsCount);
          }
        }
        
      }
    })

    $.ajax({
      type: "get",
      crossOrigin: true,
      url: "../bd/get_control_mantenimiento.php",
      async: false,
      success: function (data) {
        //console.log("mantenimiento data");
        //console.dir(JSON.parse(data));
        mantenimientosArray = JSON.parse(data);
        //console.log(mantenimientosArray.length);

        $("#mantenimientosTable").empty();

        for (let index = 0; index < mantenimientosArray.length; index++) {
          totalMantenimientos = mantenimientosArray.length;
          const element = mantenimientosArray[index];
          let oNumber = element.idControlMantenimiento+"-"+element.idSolicitudMantenimiento;
          let oEquipment = element.descripcionEquipo;
          let oStatus = element.estadoControlMantenimiento;
          let oSDate = element.fechaSolicitudMantenimiento;
          let oDate = element.fechaControlMantenimiento;
          
          oClass = "success";
          

          //alert(oStatus) diagnosPercent  repairPercent finishPercent

          if(oStatus == "Diagnosticado"){
            oClass = "danger";
            statusD++;
          }

          if(oStatus == "En reparación"){
            oClass = "warning";
            statusP++;
          }

          if(oStatus == "Finalizado"){
            oClass = "success";
            statusF++;
          }

          if (index == (mantenimientosArray.length - 1)) {
            $("#statusD").text(statusD);
            $("#statusP").text(statusP);
            $("#statusF").text(statusF);

            let porcentajeD = (statusD/mantenimientosArray.length)*100;
            let porcentajeP = (statusP/mantenimientosArray.length)*100;
            let porcentajeF = (statusF/mantenimientosArray.length)*100;
            $("#diagnosPercent").text(porcentajeD+"%");
            $("#repairPercent").text(porcentajeP+"%");
            $("#finishPercent").text(porcentajeF+"%");

            
          }

          
          $("#mantenimientosTable").append(
            "<tr class='maintinance'>"
              +"<td>"+oNumber+"</td>"+"<input type='hidden' value="+element.idControlMantenimiento+" class='order-number'>"
              +"<td>"+oEquipment+"<span class='order-description' style='display:none;'>"+oEquipment+"</span></td>"
              +"<td><span class='badge badge-"+oClass+"' style='width:120px;'>"+oStatus+"</span><span class='order-status' style='display:none;'>"+oStatus+"</span></td>"
              +"<td>"
                +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oSDate+"</div>"+"<input type='hidden' value="+oSDate+" class='order-sdate'>"
              +"</td>"
              +"<td>"
                +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDate+"</div>"+"<input type='hidden' value="+oDate+" class='order-odate'>"
              +"</td>"
             +"</tr>");
        }

        $(".maintinance").mouseover(function(){
          $(this).css("cursor", "pointer");
        });



        $(".maintinance").click(function(){
          let orderIndex = $(".maintinance").index(this);
          $('.carousel').carousel('pause');
          $('#modalEquipoDetalle').modal('show');
          //alert(orderIndex)
          let orderNumber = $(".order-number").eq(orderIndex).val();
          localStorage.setItem("idDeMantenimiento", orderNumber);

          let orderDescription = $(".order-description").eq(orderIndex).text();
          let orderStatus = $(".order-status").eq(orderIndex).text();
          let orderSDate = $(".order-sdate").eq(orderIndex).val();
          let orderODate = $(".order-odate").eq(orderIndex).val();

          let ordersContainer = document.getElementsByClassName("order-"+orderNumber);

          $("#carouselContainer").empty();
          $("#thumbnailsContainer").empty();
          $("#manDetalles").empty();
          
          $("#manTitulo").text(orderDescription);
          $("#manDescripcion").text(orderDescription);
          $("#manDetalles").append("<li class='list-group-item'>Estado : "+orderStatus+"</li>");
          $("#manDetalles").append("<li class='list-group-item'>Fecha Solicitud : "+orderSDate+"</li>");
          $("#manDetalles").append("<li class='list-group-item'>Fecha Mantenimiento : "+orderODate+"</li>");
          


          
          
          if (ordersContainer.length > 0) {
            
           for (let indexT = 0; indexT < ordersContainer.length; indexT++) {
            const elementT = ordersContainer[indexT];
            let thumbUrl = elementT.value;
            fotoIndex = ordersContainer.length+1;

            $("#thumbnailsContainer").append("<li><a href='#slide"+(indexT+1)+"'><img src="+thumbUrl+" class='thumb-nail'></a></li>");

            if (indexT == 0) {
              $("#carouselContainer").append(
              "<div class='carousel-item active'>"
              +"<img class='d-block w-100' style='background-image:url("+thumbUrl+");background-size:cover;background-position:center;width:60px; height:240px;' >"
              +"<input type='hidden' value="+indexT+" class='thumb-index'>"
              +"</div>");
            }else{
              $("#carouselContainer").append(
              "<div class='carousel-item'>"
              +"<img class='d-block w-100' style='background-image:url("+thumbUrl+");background-size:cover;background-position:center;width:60px; height:240px;' >"
              +"<input type='hidden' value="+indexT+" class='thumb-index'>"
              +"</div>");
            }

            if (indexT == (ordersContainer.length-1)) {
              $(".thumb-nail").click(function(){
                $(".carousel-item").eq(thumbIndex).removeClass(className);
                
                indexThumb = $(".thumb-nail").index(this);
                $(".carousel-item").eq(indexThumb).addClass(className);
          
                thumbElements = document.getElementsByClassName("carousel-item");
                thumbElement = thumbElements[indexThumb];
                //alert(thumbElement.classList.contains(className));
                if (indexThumb==(ordersContainer.length-1)) {
                  thumbIndex = 0;
                }else{
                  thumbIndex = indexThumb;
                }
              })
            }
            

          }
        }else{
          fotoIndex = 0;
          $("#thumbnailsContainer").append("<li><a href='#slide1'><img src='dist/img/HDCS-imagotipo.png' class='thumb-nail'></a></li>");
          $("#carouselContainer").append(
            "<div class='carousel-item active'>"
            +"<img class='d-block w-100' style='background-image:url(dist/img/HDCS-imagotipo.png);background-size:cover;background-position:center;width:60px; height:240px;' >"
            +"<input type='hidden' value='0' class='thumb-index'>"
            +"</div>");
        }
          
          // thumbnailsContainer
          //alert();
        });


        

      }
    });

    let deptoIndicador;
    let deptoIdArreglo = [];
    $.ajax({
      type: "post",
      crossOrigin: true,
      url: "../forms/departamento/crud.php",
      data: {opcion:4},
      async: false,
      success: function (data) {
        //console.log("data de departamento");
        //console.dir(JSON.parse(data));
        deptCountArray = JSON.parse(data);
        //console.log(deptCountArray.length);

        $("#deptosContenedor").empty();

        for (let indexPie = 0; indexPie < deptCountArray.length; indexPie++) {
          const element = deptCountArray[indexPie];
          let deptoNombre = element.departamento;
          let deptoId = element.idDepartamento;
          //alert(deptoId+", "+deptIdsCount[indexPie].depto);
          donutData.labels.push(deptoNombre);
          
          $.ajax({
            type: "post",
            crossOrigin: true,
            url: "../bd/get_depto_mantenimientos_por_estado.php",
            data: {deptoId:deptoId},
            async: false,
            success: function (data) {
              
              //console.log("data de departamento mantenimiento");
              //console.dir(JSON.parse(data));
              let deptMCountArray = JSON.parse(data);
              //console.log(deptMCountArray.length);
              let contadorD = deptMCountArray[0].d_count;
              let contadorP = deptMCountArray[0].p_count;
              let contadorF = deptMCountArray[0].f_count;
              let totalDepto = deptMCountArray[0].row_cnt;

              $("#deptosContenedor").append(
                "<div class='col-md-4' style='box-shadow: 3px 3px 6px #bebebe;border-radius: 6px;margin-bottom:12px;'>"
              +"<p class='text-left'>"
                +"<strong>"+deptoNombre+"</strong>"
              +"</p>"
              +"<div class='progress-group'>"
                +"Diagnosticados"
                +"<span class='float-right'><b class='d-count'>"+contadorD+"</b></span>"
                +"<div class='progress progress-sm'>"
                  +"<div class='progress-bar bg-danger' style='width: "+(contadorD/totalDepto)*100+"%'></div>"
                +"</div>"
              +"</div>"
              +"<div class='progress-group'>"
                +"En Reparación"
                +"<span class='float-right'><b class='p-count'>"+contadorP+"</b></span>"
                +"<div class='progress progress-sm'>"
                  +"<div class='progress-bar bg-warning' style='width: "+(contadorP/totalDepto)*100+"%'></div>"
                +"</div>"
              +"</div>"
              +"<div class='progress-group'>"
                +"<span class='progress-text'>"
                +"Finalizados"
                +"</span>"
                +"<span class='float-right'><b class='f-count'>"+contadorF+"</b></span>"
                +"<div class='progress progress-sm'>"
                  +"<div class='progress-bar bg-success' style='width: "+(contadorF/totalDepto)*100+"%'></div>"
                +"</div>"
              +"</div>"
              +"<div class='total-dept' style='text-align:right;'><strong>"
              +"Total mantenimientos : "+ totalDepto
              +"</strong></div>"
            +"</div>");

            $("#reportsTable").append(
              "<tr class='reporte'>"
                +"<td>"+deptoNombre+"</td>"
                +"<td>"+contadorD+"</td>"
                +"<td>"+contadorP+"</td>"
                +"<td>"+contadorF+"</td>"
                +"<td>"+totalDepto+"</td>"
               +"</tr>");


            }
          });

          let dContador=0;
          let pContador=0;
          let fContador=0;

          for (let indexDept = 0; indexDept < deptIdsCount.length; indexDept++) {
            const element = deptIdsCount[indexDept];
            let idDept = element.depto;
            countDept = element.suma;
            esteEstado = element.estado;

            if(esteEstado == 1){
              dContador+=1;
            }else{}
            if(esteEstado == 2){
              pContador+=1;
            }
            if(esteEstado == 3){
              fContador+=1;
            }

            if (idDept == deptoId) {
              if (countDept == null || countDept == "" || countDept == undefined || countDept == 0) {
                donutData.datasets[0].data.push(0);
              }else{
                donutData.datasets[0].data.push(countDept);
              }
            }
            
          }

          if (colorIndex == (deptCountArray.length-1)) {
            colorIndex = 0;
          }else{
            colorIndex = indexPie;
          }
          if (indexPie == (deptCountArray.length-1)) {
            //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        //var pieChartCanvas = $('#pieChartE').get(0).getContext('2d');

        var donutChartCanvas = $('#donutChartE').get(0).getContext('2d')

        var pieData        = donutData;
        var pieOptions     = {
          maintainAspectRatio : true,
          responsive : true,
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        var donutChart = new Chart(donutChartCanvas, {
          type: 'doughnut',
          data: donutData,
          options: donutOptions      
        })
          }
        }

        if (deptCountArray.length == 0 || deptCountArray.length == null) {
          $("#deptCount").text(0);
        }else{
          $("#deptCount").text(deptCountArray.length);
        }
        
      }
    });

    let idDeUsuarioAsign = localStorage.getItem("idDeUsuario");
    let idUsuarioAsign = parseInt(idDeUsuarioAsign);
    $.ajax({
      type: "post",
      crossOrigin: true,
      url: "../forms/asignacionEquipo/crud.php",
      data: {opcion:4, s_idUsuario:idUsuarioAsign},
      async: false,
      success: function (data) {
        //console.log("data de asignación");
        ////console.dir(data);
        
        //console.dir(JSON.parse(data));
        let asignCountArray = JSON.parse(data);
        //console.log(asignCountArray.length);

        if (asignCountArray.length == 0 || asignCountArray.length == null) {
          $("#asignCount").text(0);
        }else{
          $("#asignCount").text(asignCountArray.length);
        }
        
      }
    });

    $.ajax({
      type: "get",
      crossOrigin: true,
      url: "../bd/get_mantenimiento_imagenes.php",
      async: false,
      success: function (data) {
        let mantenimiento = document.getElementsByClassName("order-number");
        //console.log("data imágenes");
        //console.dir(JSON.parse(data));
        let imagesArray = JSON.parse(data);
        for (let indexI = 0; indexI < imagesArray.length; indexI++) {
          const element = imagesArray[indexI];
          let orderI = element.fotoMantenimientoId;
          let orderPhotoUrl = element.fotoUrl;
          for (let indexM = 0; indexM < mantenimiento.length; indexM++) {
            const elementM = mantenimiento[indexM];
            let orderM = elementM.value;
            if(orderI==orderM){
              $(".maintinance").eq(indexM).append("<input type='hidden' value="+orderPhotoUrl+" class='order-"+orderM+"'>");
            }else{}
          }
          //salert(element.fotoUrl);
          if (indexI == (imagesArray.length-1)) {
            
          }
        }
      }
    });

  } // if dashboard

  urlString = currentUrl.indexOf(urlFilter);

  if (urlString == -1) {
    outCallUrl = "../../bd/get_notificaciones.php";
  }else{
    outCallUrl = "../bd/get_notificaciones.php";
  }

    $.ajax({
      type: "get",
      crossOrigin: true,
      url: outCallUrl,
      async: false,
      success: function (data) {
        notificacionesIdsArray = JSON.parse(data);
        console.log("data de notificaciones");
        console.dir(notificacionesIdsArray);
        for (let indexNotificacion = 0; indexNotificacion < notificacionesIdsArray.length; indexNotificacion++) {
          const element = notificacionesIdsArray[indexNotificacion];

          $(".menu-notificaciones").eq(0).append("");

          if(indexNotificacion == 0){
            let fechaNotificacion = element.fechaNotificacion;
            let nFecha = new Date(fechaNotificacion);
            let hoy = new Date();
            let diferencia = hoy.getTime() - nFecha.getTime();
            let tiempoHoras = Math.round(diferencia/3600000);
            estadoNotificacion = element.estadoNotificacion;
            
            if (tiempoHoras < 24) {
              tiempoNotificacion = tiempoHoras+" horas";
            }else{
              tiempoNotificacion = Math.floor(tiempoHoras/24)+" días";
            }
            
          }

          if(indexNotificacion == (notificacionesIdsArray.length-1)){
            let conteo = element.row_cnt;

            if (conteo > 0) {
              $(".notificaciones-conteo").css("display", "inherit");
            }
            $(".notificaciones-conteo").eq(0).text(conteo);
            $(".conteo-notificaciones").eq(0).text(conteo);
            $(".conteo-diagnosticados").eq(0).text(conteo);
            $(".tiempo-diagnosticados").eq(0).text(tiempoNotificacion);
            $(".notificacion").addClass(estadoNotificacion);

            $(".notificacion").click(function(){
                $(".modal-dialog").eq(1).css("max-width", "1000px");
                arrayFilter = [];

                for (let indexMant = 0; indexMant < mantenimientosArray.length; indexMant++) {
                  const element = mantenimientosArray[indexMant];
                  let mEstado = element.estadoControlMantenimiento;
                  let mId = element.idControlMantenimiento;

                  for (let indexNotifi = 0; indexNotifi < notificacionesIdsArray.length; indexNotifi++) {
                    const elementNotifi = notificacionesIdsArray[indexNotifi];
                    let estadoNotifi = elementNotifi.estadoNotificacion;
                    let idNotifi = elementNotifi.idControlMantenimiento;

                    if (mEstado.toString().trim() == "Diagnosticado" && (mId == idNotifi)) {
                      arrayFilter.push(element);
                    }
                  }

                  if (indexMant == (mantenimientosArray.length - 1)) {
                    console.dir(arrayFilter);
                    $("#quickReportsTable").empty();
                    for (let indexFilt = 0; indexFilt < arrayFilter.length; indexFilt++) {
                      const elementFilt = arrayFilter[indexFilt];
                      let mEstadoFilt = elementFilt.estadoControlMantenimiento;
                      let mNumberfilt = elementFilt.idControlMantenimiento+"-"+elementFilt.idSolicitudMantenimiento;
                      let mEquipmentfilt = elementFilt.descripcionEquipo;
                      let mSDateFilt = elementFilt.fechaSolicitudMantenimiento;
                      let mDateFilt = elementFilt.fechaControlMantenimiento;
                      let mClassFilt = "danger";

                      $("#quickReportsTable").append(
                        "<tr class='maintinance'>"
                        +"<td>"+mNumberfilt+"</td>"
                        +"<td>"+mEquipmentfilt+"</td>"
                        +"<td><span class='badge badge-"+mClassFilt+"' style='width:120px;'>"+mEstadoFilt+"</span></td>"
                        +"<td>"
                          +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+mSDateFilt+"</div>"
                        +"</td>"
                        +"<td>"
                          +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+mDateFilt+"</div>"
                        +"</td>"
                       +"</tr>");

                       $(".notificacion").removeClass(estadoNotificacion);
                       $(".notificacion").addClass("read");
                       // ajax a notificacion para cambiar el estado de esa notificacion a read 2 pasando el idControlMantenimiento
                       $.ajax({
                        type: "post",
                        crossOrigin: true,
                        url: "../bd/update_notificacion_estado.php",
                        data: {idControlMantenimiento:elementFilt.idControlMantenimiento},
                        async: false,
                        success: function (data) {
                          $(".notificaciones-conteo").eq(0).text(0);
                          $(".notificaciones-conteo").css("display", "none");
                          $(".conteo-notificaciones").eq(0).text(0);
                        }
                       });
                    }
                  }
                }
            });
          }
        }
      }
    });

    

    


    

    $(".user-maintinance").mouseover(function(){
      $(this).css("cursor", "pointer");
    });

    

    $(".thumb-nail").click(function(){
      $(".carousel-item").eq(thumbIndex).removeClass(className);
                //alert(thumbIndex)
                indexThumb = $(".thumb-nail").index(this);
                $(".carousel-item").eq(indexThumb).addClass(className);
          
                thumbElements = document.getElementsByClassName("carousel-item");
                thumbElement = thumbElements[indexThumb];
                //alert(thumbElement.classList.contains(className));
                if (indexThumb==(ordersContainer.length-1)) {
                  thumbIndex = 0;
                }else{
                  thumbIndex = indexThumb;
                }
    })

    fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    //alert(fotoStatus)
    
    $(".usuario-nombre").eq(0).text(nombreU);
    
    if(fotoStatus == "0"){}else{
      fotoUrl = localStorage.getItem("urlFoto");
      //alert(fotoUrl)
      urlString = currentUrl.indexOf(urlFilter);
      if (urlString == -1) {
        fotoUrl = "../"+fotoUrl;
      }else{}
      $('.foto-usuario').eq(0).css("background-image", "url('" + fotoUrl + "')");
      $(".foto-usuario").eq(0).css("display", "inherit");
      $(".icono-usuario").eq(0).css("display", "none");
    }

    function formatBytes(a,b=2){
      if(0===a)
      return"0 Bytes";
      const c=0>b?0:b,d=Math.floor(Math.log(a)/Math.log(1024));
      return parseFloat((a/Math.pow(1024,d)).toFixed(c))
      +" "+["Bytes","KB","MB","GB","TB","PB","EB","ZB","YB"][d];
    }

    $(function(){
        
      $('#inputEditUName').change(function(){
        uNombre = this.value;
        esCambioUsuario = true;
      });
      

      $('#img').change(function(){

        var input = this;
        var url = $(this).val();
        var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();

        

        if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) 
        {

          //alert(Math.round(input.files[0].size/1024));
          let sizeFile = Math.round(input.files[0].size);
          let pesoDeImagen = formatBytes(sizeFile,2);
          let isMb = pesoDeImagen.indexOf("MB");

          if (isMb != -1) {
            let mbPrefix = pesoDeImagen.substring(0,1);//+1
            let megaBytes = parseInt(mbPrefix);
            if (megaBytes>2) {
              $(document).Toasts('create', {
                class: 'bg-warning', 
                title: pesoDeImagen,
                subtitle: 'Cerrar',
                autohide: true,
                delay: 6000,
                body: 'La imagen debe ser menor a 2MB.'
              })
            }else{
              var reader = new FileReader();
          
              reader.onload = function (e) {
                //$('#uploadUserPhotoImg').attr('src', e.target.result);
                let urlPhoto = e.target.result;
                fotoUrl = urlPhoto.toString().trim();

                $('#uploadUserPhotoImg').css("background-image", "url('" + urlPhoto + "')");
                $('#uploadUserPhotoImg').css("display", "inherit");
                $('#fotoDeUsuario').css("background-image", "url('" + urlPhoto + "')");
                $('#fotoDeUsuario').css("display", "inherit");
              
                $('#uploadUserPhotoIcon').css("display", "none");
                $('#iconoUsuario').css("display", "none");

                esCambioFoto = true;
              
                //$('#usuarioAfl_Foto').css('background-image', "url("+e.target.result+")");
                let idDeUsuarioX = localStorage.getItem("idDeUsuario");
                let idUsuario = parseInt(idDeUsuarioX);
                //alert(idUsuario)
                formData.append("userId", idUsuario);
                formData.append('file', input.files[0]);
                // codeB64
            
            
              }
            reader.readAsDataURL(input.files[0]);
            }
          }else{
            var reader = new FileReader();
          
            reader.onload = function (e) {
              //$('#uploadUserPhotoImg').attr('src', e.target.result);
              let urlPhoto = e.target.result;
              fotoUrl = urlPhoto.toString().trim();

              $('#uploadUserPhotoImg').css("background-image", "url('" + urlPhoto + "')");
              $('#uploadUserPhotoImg').css("display", "inherit");
              $('#fotoDeUsuario').css("background-image", "url('" + urlPhoto + "')");
              $('#fotoDeUsuario').css("display", "inherit");
            
              $('#uploadUserPhotoIcon').css("display", "none");
              $('#iconoUsuario').css("display", "none");

              esCambioFoto = true;
            
              //$('#usuarioAfl_Foto').css('background-image', "url("+e.target.result+")");
              let idDeUsuarioX = localStorage.getItem("idDeUsuario");
              let idUsuario = parseInt(idDeUsuarioX);
              //alert(idUsuario)
              formData.append("userId", idUsuario);
              formData.append('file', input.files[0]);
              // codeB64
          
          
            }
            reader.readAsDataURL(input.files[0]);
          }
          
        }
        else
        {
        
          esCambioFoto = false;
              //$('#usuarioAfl_Foto').attr('src', "img/clients/academy-user-icon_n.png");
  
          //$('#usuarioAfl_Foto').css('background-image', "url('img/clients/academy-user-icon_n.png')");
        }
        /**/
      });

      $('#imgEquipo').change(function(){

        var input = this;
        var url = $(this).val();
        var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();

        

        if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) 
        {
          var reader = new FileReader();

          let sizeFileE = Math.round(input.files[0].size);
          let pesoDeImagenE = formatBytes(sizeFileE,2);
          let isMbE = pesoDeImagenE.indexOf("MB");

          if (isMbE != -1) {
            let mbPrefixE = pesoDeImagenE.substring(0,1);//+1
            let megaBytesE = parseInt(mbPrefixE);
            if (megaBytesE>2) {
              $(document).Toasts('create', {
                class: 'bg-warning', 
                title: pesoDeImagenE,
                subtitle: 'Cerrar',
                autohide: true,
                delay: 6000,
                body: 'La imagen debe ser menor a 2MB.'
              })
            }else{
              reader.onload = function (e) {
                //$('#uploadUserPhotoImg').attr('src', e.target.result);
                let urlEPhoto = e.target.result;
                eFotoUrl = urlEPhoto.toString().trim();
  
                
                //alert(fotoIndex);
                if (fotoIndex == 0) {
  
                    $(".carousel-item").eq(0).removeClass("active");
                    $("#carouselContainer").append(
                      "<div class='carousel-item'>"
                      +"<img class='d-block w-100' style='background-image:url("+urlEPhoto+");background-size:cover;background-position:center;width:60px; height:240px;display:inherit;' >"
                      +"<input type='hidden' value="+fotoIndex+" class='thumb-index'>"
                      +"</div>");
                    $(".carousel-item").eq(1).addClass("active");
                    $(".carousel-item").eq(0).remove();
                    $(".thumb-nail").eq(0).remove();
                    $("#thumbnailsContainer").append("<li><a href='#slide1'><img src="+urlEPhoto+" class='thumb-nail'></a></li>");
                    fotoIndex+=1;
                }else{
                  $("#carouselContainer").append(
                    "<div class='carousel-item'>"
                    +"<img class='d-block w-100' style='background-image:url("+urlEPhoto+");background-size:cover;background-position:center;width:60px; height:240px;' >"
                    +"<input type='hidden' value="+(fotoIndex)+" class='thumb-index'>"
                    +"</div>");
                    $("#thumbnailsContainer").append("<li><a href='#slide"+(fotoIndex+1)+"'><img src="+urlEPhoto+" class='thumb-nail'></a></li>");
                    fotoIndex+=1;
                }
    
                esECambioFoto = true;
                
              let idDeMantenimiento = localStorage.getItem("idDeMantenimiento");
              let idMantenimiento = parseInt(idDeMantenimiento);
              
              eFormData.append("mantenimientoId", idMantenimiento);
              eFormData.append('file', input.files[0]);
  
              $.ajax({
                type: "post",
                crossOrigin: true,
                url: "../bd/upload_equipment_photo.php",
                data: eFormData,
                processData: false,
                contentType: false,
                success: function (data) {
                }
        
              })

              }
              reader.readAsDataURL(input.files[0]);
            }
            
          }else{
            reader.onload = function (e) {
              //$('#uploadUserPhotoImg').attr('src', e.target.result);
              let urlEPhoto = e.target.result;
              eFotoUrl = urlEPhoto.toString().trim();

              
              //alert(fotoIndex);
              if (fotoIndex == 0) {

                  $(".carousel-item").eq(0).removeClass("active");
                  $("#carouselContainer").append(
                    "<div class='carousel-item'>"
                    +"<img class='d-block w-100' style='background-image:url("+urlEPhoto+");background-size:cover;background-position:center;width:60px; height:240px;display:inherit;' >"
                    +"<input type='hidden' value="+fotoIndex+" class='thumb-index'>"
                    +"</div>");
                  $(".carousel-item").eq(1).addClass("active");
                  $(".carousel-item").eq(0).remove();
                  $(".thumb-nail").eq(0).remove();
                  $("#thumbnailsContainer").append("<li><a href='#slide1'><img src="+urlEPhoto+" class='thumb-nail'></a></li>");
                  fotoIndex+=1;
              }else{
                $("#carouselContainer").append(
                  "<div class='carousel-item'>"
                  +"<img class='d-block w-100' style='background-image:url("+urlEPhoto+");background-size:cover;background-position:center;width:60px; height:240px;' >"
                  +"<input type='hidden' value="+(fotoIndex)+" class='thumb-index'>"
                  +"</div>");
                  $("#thumbnailsContainer").append("<li><a href='#slide"+(fotoIndex+1)+"'><img src="+urlEPhoto+" class='thumb-nail'></a></li>");
                  fotoIndex+=1;
              }
  
              esECambioFoto = true;
              
            let idDeMantenimiento = localStorage.getItem("idDeMantenimiento");
            let idMantenimiento = parseInt(idDeMantenimiento);
            
            eFormData.append("mantenimientoId", idMantenimiento);
            eFormData.append('file', input.files[0]);

            $.ajax({
              type: "post",
              crossOrigin: true,
              url: "../bd/upload_equipment_photo.php",
              data: eFormData,
              processData: false,
              contentType: false,
              success: function (data) {
              }
      
            })

            }
            reader.readAsDataURL(input.files[0]);
          }
      }
      else
      {
        esECambioFoto = false;
      }
      
      });

    });

    $(".usuario-nombre").eq(0).text(nombreU);

    

    $(".boton-excel").click(function(excv){
      excv.preventDefault();
      excv.stopPropagation();

      

      /*
      var element = document.getElementsByClassName('tabla-data');
      let excelIndex = $(".boton-excel").index(this);
      let myTableId = element[excelIndex].id;
      $("#"+myTableId).table2excel({
        exclude: ".excludeThisClass",
        name: "Worksheet Name",
        filename: "SomeFile.xls", // do include extension
        preserveColors: true // set to true if you want background colors and font colors preserved
      });

      */

    });
    
    
    let escala = 2;
    $(".boton-imprimir").click(function(event){
      event.preventDefault();
      event.stopPropagation();
      let printIndex = $(".boton-imprimir").index(this);
      if (window.matchMedia("(max-width: 700px)").matches) {
        escala = 1;
      }else{
        escala = 2;
      }
      
      var element = document.getElementsByClassName('print-container');
      var botonesAccion = document.getElementsByClassName("boton-accion");

      document.getElementById('repSegEst').style.height = "auto";

      for (let indexA = 0; indexA < botonesAccion.length; indexA++) {
        const element = botonesAccion[indexA];
        element.style.display = "none";
      }

      let elem = element[printIndex];
      var opt = {
        margin:       1,
        filename:     'myfile.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 1},
        jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
      };
      html2pdf().set(opt).from(elem).toPdf().save('prueba.pdf').then(function(pdf) {
        for (let indexB = 0; indexB < botonesAccion.length; indexB++) {
          const element = botonesAccion[indexB];
          element.style.display = "inherit";
        }

      document.getElementById('repSegEst').style.height = mantPorDepHeight+"px";
        
      });
    });

    $(".boton-pdf").click(function(evpdf){
      evpdf.preventDefault();
      evpdf.stopPropagation();
      let pdftIndex = $(".boton-pdf").index(this);
      if (window.matchMedia("(max-width: 700px)").matches) {
        escala = 1;
      }else{
        escala = 2;
      }
      
      var element = document.getElementsByClassName('print-container');
      var botonesAccion = document.getElementsByClassName("boton-accion");

      document.getElementById('repSegEst').style.height = "auto";

      for (let indexA = 0; indexA < botonesAccion.length; indexA++) {
        const element = botonesAccion[indexA];
        element.style.display = "none";
      }

      let elem = element[pdftIndex];
      var opt = {
        margin:       1,
        filename:     'myfile.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 1},
        jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
      };
      html2pdf().set(opt).from(elem).toPdf().save('prueba.pdf').then(function(pdf) {
        for (let indexB = 0; indexB < botonesAccion.length; indexB++) {
          const element = botonesAccion[indexB];
          element.style.display = "inherit";
        }

       
      document.getElementById('repSegEst').style.height = mantPorDepHeight+"px";
        
      });
    });

  //}
  

  function isDateBeforeToday(date) {
    return new Date(date.toDateString()) < new Date(new Date().toDateString());
}

let fechaSolicitud;

  $("#fechaInput").change(function(){
    let thisValue = this.value;
    let thisDate = new Date(thisValue);
    if (isDateBeforeToday(thisDate)) {
      $(document).Toasts('create', {
        class: 'bg-warning', 
        title: "Fecha Inválida",
        subtitle: 'Cerrar',
        autohide: true,
        delay: 6000,
        body: 'La fecha seleccionada ya no es vigente.'
      })
    }else{
      fechaSolicitud = thisDate;
    }
  })

  







  $("#updateUserPhotoIcon").click(function(){
    $("#img").click();
  });

  $("#updateEquipmentPhotoIcon").click(function(){
    $("#imgEquipo").click();
  });

  

  $(".user-info").click(function(){
    
    if(fotoStatus == "0"){}else{
      fotoUrl = localStorage.getItem("urlFoto");
      $('#uploadUserPhotoImg').css("background-image", "url('" + fotoUrl + "')");
      $("#uploadUserPhotoImg").css("display", "inherit");
      $("#uploadUserPhotoIcon").css("display", "none");
    }

    let nameUser = $("#usuarioNombre").text();
    let uName = localStorage.getItem("usuarioNombre");
    //$("#inputEditUserName").attr("placeholder", nameUser);
    $("#inputEditUName").attr("placeholder", uName);
    
  });

  
  $("#saveChangesButton").click(function(){
    
    $("#page_loader_afl").fadeIn();


    if(esCambioFoto == true){
      //alert("voy");
      $.ajax({
        type: "post",
        crossOrigin: true,
        url: "../bd/upload_user_photo.php",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
        }

        
      }).then(function(some){
        //alert("vengo")
      }) ;


      setTimeout(() => {
        let esteIdDeUsuarioX = localStorage.getItem("idDeUsuario");
        let esteIdUsuario = parseInt(esteIdDeUsuarioX);

        $.ajax({
          url:"../bd/get_user_photo.php",
          type:"POST",
          async: false,
          data: {idUsuario:esteIdUsuario}, 
            success:function(dataPhoto){
              //console.log("de la foto");
              if(dataPhoto.toString().trim() == "0"){
                localStorage.setItem("fotoStatus", 0);
              }else{
                localStorage.setItem("fotoStatus", 1);
                localStorage.setItem( "urlFoto", dataPhoto.toString().trim());

                  if (esCambioUsuario) {
                    // userId uName
                    $.ajax({
                      url:"../bd/update_user_name.php",
                      type:"POST",
                      async: false,
                      data: {userId:esteIdUsuario, uName:uNombre}, 
                        success:function(thisDataName){
                          $("#page_loader_afl").fadeOut("slow");
                          $('#editUserModal').modal('hide');

                          $(document).Toasts('create', {
                            class: 'bg-success', 
                            title: 'Cambios Guardados',
                            subtitle: 'Cerrar',
                            autohide: true,
                            delay: 6000,
                            body: 'Los cambios se han realizado Exitosamente!'
                          })
                        }
                      });

                  }else{
                    $("#page_loader_afl").fadeOut("slow");
                    $('#editUserModal').modal('hide');

                    $(document).Toasts('create', {
                      class: 'bg-success', 
                      title: 'Cambios Guardados',
                      subtitle: 'Cerrar',
                      autohide: true,
                      delay: 6000,
                      body: 'Los cambios se han realizado Exitosamente!'
                    })

                  }

              }
              
            }      
          });
        
      }, 3000);
      
              
    }else{
      let esteIdDeUsuarioX = localStorage.getItem("idDeUsuario");
        let esteIdUsuario = parseInt(esteIdDeUsuarioX);
      if (esCambioUsuario) {
        // userId uName
        $.ajax({
          url:"../bd/update_user_name.php",
          type:"POST",
          async: false,
          data: {userId:esteIdUsuario, uName:uNombre}, 
            success:function(thisDataName){
              $("#page_loader_afl").fadeOut("slow");
              $('#editUserModal').modal('hide');

              $(document).Toasts('create', {
                class: 'bg-success', 
                title: 'Cambios Guardados',
                subtitle: 'Cerrar',
                autohide: true,
                delay: 6000,
                body: 'Los cambios se han realizado Exitosamente!'
              })
            }
          });

      }else{
        $("#page_loader_afl").fadeOut("slow");
        $('#editUserModal').modal('hide');

        $(document).Toasts('create', {
          class: 'bg-success', 
          title: 'Cambios Guardados',
          subtitle: 'Cerrar',
          autohide: true,
          delay: 6000,
          body: 'Los cambios se han realizado Exitosamente!'
        })

      }
    }

    if(esCambioNombre == true){}else{}

    if(esCambioUsuario == true){}else{}

  });
  
  $(".top-report").click(function(){
    let typeIndex = $(".top-report").index(this);
    let typeM = $(".top-report-text").eq(typeIndex).text();

    $(".modal-dialog").eq(1).css("max-width", "1000px");

    arrayFilter = [];

    for (let index = 0; index < mantenimientosArray.length; index++) {
      const element = mantenimientosArray[index];
      let mEstado = element.estadoControlMantenimiento;

      if (typeM.toString().trim() == mEstado.toString().trim()) {
        arrayFilter.push(element);
      }

      if (index == (mantenimientosArray.length - 1)) {
        //console.dir(arrayFilter);

        $("#quickReportsTable").empty();


        for (let indexF = 0; indexF < arrayFilter.length; indexF++) {
          const elementF = arrayFilter[indexF];
          let mEstadoF = elementF.estadoControlMantenimiento;
          let mNumber = elementF.idControlMantenimiento+"-"+elementF.idSolicitudMantenimiento;
          let mEquipment = elementF.descripcionEquipo;
          let mSDate = elementF.fechaSolicitudMantenimiento;
          let mDate = elementF.fechaControlMantenimiento;
          let mClass = "success";
          if(mEstadoF == "Diagnosticado"){
            mClass = "danger";
          }
          if(mEstadoF == "En reparación"){
            mClass = "warning";
          }
          if(mEstadoF == "Finalizado"){
            mClass = "success";
          }
          $("#quickReportsTable").append(
            "<tr class='maintinance'>"
            +"<td>"+mNumber+"</td>"
            +"<td>"+mEquipment+"</td>"
            +"<td><span class='badge badge-"+mClass+"' style='width:120px;'>"+mEstadoF+"</span></td>"
            +"<td>"
              +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+mSDate+"</div>"
            +"</td>"
            +"<td>"
              +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+mDate+"</div>"
            +"</td>"
           +"</tr>");
          }
      }
    }
    
    $("#tipoMantenimiento").text(typeM);
  });

$(".logout-button").click(function(){
  
  urlString = currentUrl.indexOf(urlFilter);
  if (urlString == -1) {
    outCallUrl = "../../bd/logout.php";
    outUrl = "../../index.php";
  }else{
    outCallUrl = "../bd/logout.php";
    outUrl = "../index.php";
  }
  
    $.ajax({
      type: "get",
      crossOrigin: true,
      url: outCallUrl,
      async: true,
      success: function (data) {
        localStorage.setItem("esSesion", false);
        window.open(outUrl, "_self");
      }
    });
  
  });


  $(".topnav-toggler").click(function(){
    let elems = document.getElementsByClassName("wrapper"); // .offsetWidth; //$("#wrapper").attr("width");
    let elem = elems[0];
    wrapperWidth = percentwidth(elem);
    percentWidth = Math.round(wrapperWidth);
    if(percentWidth <= 80){
      $(".wrapper").eq(0).css("width", "100%");
    }else{
      $(".wrapper").eq(0).css("width", "80%");
    }
  })


  $(".all-orders-button").click(function(){
    let ordersIndex = $(".all-orders-button").index(this);
    //alert(ordersIndex)
    if(ordersIndex == 0){
      if (tableHeight == 300) {
        $("#table-wrapper").css("max-height", "auto");
        $("#table-wrapper").css("height", "auto");
        tableHeight = 0;
      }else{
        $("#table-wrapper").css("max-height", "300px");
        $("#table-wrapper").css("height", "300px");
        tableHeight = 300;
      }
    }

    if(ordersIndex == 1){
      deptosHeight = document.getElementById('repSegEst').clientHeight;
      if (deptosHeight == mantPorDepHeight) {
        $("#repSegEst").css("max-height", "auto");
        $("#repSegEst").css("height", "auto");
        deptosHeight = 0;
      }else{
        $("#repSegEst").css("max-height", mantPorDepHeight+"px");
        $("#repSegEst").css("height", mantPorDepHeight+"px");
        deptosHeight = mantPorDepHeight;
      }
    }
  });

  var tablaContainer = document.getElementsByClassName('tabla-data');
  //let excelIndex = $(".boton-excel").index(this);
//alert("voy")
  for (let indexTabla = 0; indexTabla < tablaContainer.length; indexTabla++) {
    const element = tablaContainer[indexTabla];
    let myTableId = element.id;
  TableExport(document.getElementById(myTableId), {
    headers: true,                      // (Boolean), display table headers (th or td elements) in the <thead>, (default: true)
    footers: true,                      // (Boolean), display table footers (th or td elements) in the <tfoot>, (default: false)
    formats: ["xlsx", "csv", "txt"],    // (String[]), filetype(s) for the export, (default: ['xlsx', 'csv', 'txt'])
    filename: "id",                     // (id, String), filename for the downloaded file, (default: 'id')
    bootstrap: false,                   // (Boolean), style buttons using bootstrap, (default: true)
    exportButtons: true,                // (Boolean), automatically generate the built-in export buttons for each of the specified formats (default: true)
    position: "bottom",                 // (top, bottom), position of the caption element relative to table, (default: 'bottom')
    ignoreRows: null,                   // (Number, Number[]), row indices to exclude from the exported file(s) (default: null)
    ignoreCols: null,                   // (Number, Number[]), column indices to exclude from the exported file(s) (default: null)
    trimWhitespace: true,               // (Boolean), remove all leading/trailing newlines, spaces, and tabs from cell text in the exported file(s) (default: false)
    RTL: false,                         // (Boolean), set direction of the worksheet to right-to-left (default: false)
    sheetname: "id"                     // (id, String), sheet name for the exported spreadsheet, (default: 'id')
  });
  }
  
});