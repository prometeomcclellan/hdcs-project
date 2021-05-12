$("#page_loader").fadeIn();

$(document).ready(function() {

  function accessCount (){
    var loaded = parseInt(localStorage.getItem('loaded'), 10),
        loaded_numb = loaded?loaded+1:1;
    localStorage.setItem('loaded', loaded_numb);
    console.log(loaded_numb);
  }
  console.log("Acá el conteo");
  accessCount ();

  window.addEventListener("unload", function(){
    //parent.alert("me voy")
  })

  let mantenimientosArray = [];
  let mantenimientosArrayX = [];
  let mantenimientosXUsuarioArray = [];
  let mantenimientosPendientesArray = [];
  let userCountArray = [];
  let deptIdsCount = [];
  let deptCountArray = [];
  let notificacionesIdsArray = [];
  let arrayFilter = [];
  let arrayFiltered = [];
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
  let deactivateUrl;
  let urlString;
  let urlFilter = "inicio";

  let tiempoNotificacion = 0;
  let estadoNotificacion = "";

  var mantPorDepHeight;

  let thumbIndex = 0;
  const className = "active";
  let indexThumb; let thumbElements;
  let thumbElement;

  let isFirstFilter = true;
  let dFrom; let dTo; let fromTo;

  let loginRedirectUrl;

  let sizeFile;
  let pesoDeImagen;
  let isMb;

  let temporizador;
  let titulo_doc;

  let wrapperWidth;
  let percentWidth;

  let isPhoto = false;
  var currentUrl = location.pathname;
  let loginUrl = "HDCS/index.php";
  let thisHash;

  let idDeMantenimiento;
  let idMantenimiento;
  let elStatusClass;
  let elStatusIcon;
  let cargoIni;

  

  if (currentUrl.indexOf(loginUrl) == 1) {
    let esSesion = localStorage.getItem("isSession");
  }else{

    let esInicio = localStorage.getItem("esInicio");
    thisHash = localStorage.getItem("thisHash");

    urlString = currentUrl.indexOf(urlFilter);
    if (urlString == -1) {
      outCallUrl = "../../bd/verificar_sesion.php";
      outUrl = "../../index.php";
    }else{
      outCallUrl = "../bd/verificar_sesion.php";
      outUrl = "../index.php";
    }

    $(".boton-edicion").click(function(edev){
      edev.preventDefault();
      edev.stopPropagation();

      let editIndex = $(".boton-edicion").index(this);
      let dOrderNumber = localStorage.getItem("idDeMantenimiento");
      let orderStat = document.getElementById("status_class");
      let orderStatClass = orderStat.classList;
      elStatusClass = document.getElementById("status_class");
      elStatusIcon = document.getElementById("status_icon");
      //alert(orderStatClass.toString().trim().indexOf("bg-success"))
      //alert(dOrderNumber)
      
      
      if (editIndex == 0) {
        urlString = currentUrl.indexOf(urlFilter);
        if (urlString == -1) {
          outCallUrl = "../../bd/update_maint_data.php";
        }else{
          outCallUrl = "../bd/update_maint_data.php";
        }

        let titleContainer = $(".man-titulo").eq(0).val();
        let descripcionContainer = $(".man-descripcion").eq(0).val();
        if(titleContainer != ""){
          //alert(titleContainer+", "+descripcionContainer)
          // ajax update_maint_data.php enviando titulo y descripcion
          $.ajax({
            type: "post",
            crossOrigin: true,
            url: outCallUrl,
            data: {titulo:titleContainer, descripcion:descripcionContainer, idControlMantenimiento:dOrderNumber},
            async: false,
            success: function (uMaintData) {
              let uData = JSON.parse(uMaintData);
              console.dir(uData)
              let updateStatus = uData[0].status;
              if (updateStatus == 200) {
                $(document).Toasts('create', {
                  class: 'bg-success', 
                  title: "Cambios guardados!",
                  subtitle: 'Cerrar',
                  autohide: true,
                  delay: 6000,
                  body: 'Se actualizó la información exitosamente.'
                })
              }
            }
          });

        }else{
          if(descripcionContainer != ""){
            urlString = currentUrl.indexOf(urlFilter);
            if (urlString == -1) {
              outCallUrl = "../../bd/update_maint_description.php";
            }else{
              outCallUrl = "../bd/update_maint_description.php";
            }

            $.ajax({
              type: "post",
              crossOrigin: true,
              url: outCallUrl,
              data: {descripcion:descripcionContainer, idControlMantenimiento:dOrderNumber},
              async: false,
              success: function (uDescData) {
                let udData = JSON.parse(uDescData);
                console.dir(udData)
                let updatedStatus = udData[0].status;
                if (updatedStatus == 200) {
                  $(document).Toasts('create', {
                    class: 'bg-success', 
                    title: "Cambios guardados!",
                    subtitle: 'Cerrar',
                    autohide: true,
                    delay: 6000,
                    body: 'Se actualizó la información exitosamente.'
                  })
                }
              }
            });

          }else{
            $(document).Toasts('create', {
              class: 'bg-warning', 
              title: "Falta infrmación!",
              subtitle: 'Cerrar',
              autohide: true,
              delay: 6000,
              body: 'Los campos deben estar llenos.'
            })
          }
        }
      }

      if (editIndex == 1) {
        if (orderStatClass.toString().trim().indexOf("bg-success") == -1) {
        
        
        urlString = currentUrl.indexOf(urlFilter);
        if (urlString == -1) {
          outCallUrl = "../../bd/update_estado_mantenimiento.php";
        }else{
          outCallUrl = "../bd/update_estado_mantenimiento.php";
        }
        //alert(orderNumber)
        
        $.ajax({
          type: "post",
          crossOrigin: true,
          url: outCallUrl,
          data: {idControlMantenimiento:dOrderNumber},
          async: false,
          success: function (data) {
            console.log(data);
            elStatusClass.className = '';
            elStatusIcon.className = '';
            $("#status_title").text("");

            $("#status_class").addClass("info-box-icon elevation-1 bg-success");
            $("#status_icon").addClass("fas fa-thumbs-up");
            $("#status_title").text("Finalizado");

            $(document).Toasts('create', {
              class: 'bg-success', 
              title: "Finalizado!",
              subtitle: 'Cerrar',
              autohide: true,
              delay: 6000,
              body: 'Esta orden ha sido finalizada.'
            })
          }
         });
         
      }else{
        $(document).Toasts('create', {
          class: 'bg-success', 
          title: "Finalizado!",
          subtitle: 'Cerrar',
          autohide: true,
          delay: 6000,
          body: 'No más cambios por realizar.'
        })
      }
    }
    });

     
      $.ajax({
        url:outCallUrl,
        type:"POST",
        async: false,
        data: {hash: thisHash}, 
          success:function(dataAccess){
            let dataDeAcceso = JSON.parse(dataAccess);
            let  estadoR = dataDeAcceso[0].status;
            if (estadoR == 200) {
              console.log("acceso verificado");
            }
            if (estadoR == 500) {
              console.log("acceso no verificado");
              document.body.style.display = "none";
              location.href = outUrl;
            }
            
          }      
        });

   
    if(document.referrer == location.href){
      location.href = 'error.php';
    }else{}
    
    if (esInicio == false || esInicio == null || esInicio == "false") {
      document.body.style.display = "none";
      location.href = '../index.php';
    }else{
    cargoIni = localStorage.getItem('cargoIni');
    if (cargoIni == null) {}
    let brandLink = document.getElementsByClassName("brand-link");
    let rolTodosContainer = document.getElementsByClassName("rol-todos");
    let rolAdminContainer = document.getElementsByClassName("rol-admin");
    let rolTecnicoContainer = document.getElementsByClassName("rol-tecnico");
    let rolPersonalContainer = document.getElementsByClassName("rol-personal");
  
    if (cargoIni.toString().trim().toLocaleLowerCase().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u") 
    != "admin") {
    $("#usuarioNombre").attr("data-target", "");
    
    for (let indexBr = 0; indexBr < brandLink.length; indexBr++) {
      const elementBr = brandLink[indexBr];
      elementBr.href = "#";
    }
    
    for (let indexRol = 0; indexRol < rolAdminContainer.length; indexRol++) {
      const element = rolAdminContainer[indexRol];
      element.style.display = "none";
    }
    if (cargoIni.toString().trim().toLocaleLowerCase().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u") 
    == "tecnico") {
    for (let indexPersonal = 0; indexPersonal < rolPersonalContainer.length; indexPersonal++) {
      const elementPersonal = rolPersonalContainer[indexPersonal];
      elementPersonal.style.display = "none";
    }
   }else{
    for (let indexTecnico = 0; indexTecnico < rolTecnicoContainer.length; indexTecnico++) {
      const elementTecnico = rolTecnicoContainer[indexTecnico];
      elementTecnico.style.display = "none";
    }
   }
  }else{
    for (let indexPersonal = 0; indexPersonal < rolPersonalContainer.length; indexPersonal++) {
      const elementPersonal = rolPersonalContainer[indexPersonal];
      elementPersonal.style.display = "none";
    }
    for (let indexTecnico = 0; indexTecnico < rolTecnicoContainer.length; indexTecnico++) {
      const elementTecnico = rolTecnicoContainer[indexTecnico];
      elementTecnico.style.display = "none";
    }
  }
}
}

  
  function percentwidth(elem){
    if (elem) {
      var pa= elem.offsetParent || elem;
      return ((elem.offsetWidth/pa.offsetWidth)*100).toFixed(2);//+'%';  
    }
    
}

    let ahora = new Date();
    let ahoraAnio = ahora.getFullYear();
    let ahoraMonth = ahora.getMonth();
    let ahoraDay = ahora.getDate();
    let ahoraHour = ahora.getHours();
    let ahoraMinutes = ahora.getMinutes();
    let ahoraSeconds = ahora.getSeconds();
    let ahoraDia;
    let ahoraMes;
    if (ahoraMonth < 10) {
      ahoraMes = "0"+ahoraMonth;
    }else{
      ahoraMes = ahoraMonth;
    }

    if (ahoraDay < 10) {ahoraDia = "0"+ahoraDay;}else{ahoraDia = ahoraDay;}

    let hora = ahoraHour+"_"+ahoraMinutes+"_"+ahoraSeconds;
    let fechaActual = ahoraAnio+"-"+ahoraMes+"-"+ahoraDia+"_"+hora;
    let titulo = "";

$('#formLogin').submit(function(e){
  
  e.preventDefault();
  let checkSession = localStorage.getItem("thisHash");
  // ajax para revisar si hash existe y esta activo y es el mismo id
  
  
  
  var _usuario = $.trim($("#usuario").val());
  var _password =$.trim($("#password").val());
  let sAbierta = document.getElementById("abierta").checked;
  let cargoU = localStorage.getItem('cargoIni');
    
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
      data: {usuario:_usuario, password:_password, abierta:sAbierta}, 
        success:function(data){
          thisData = JSON.parse(data);
                    
          localStorage.setItem("nombreUsuario", thisData[0].nombreEmpleado);  
          
          if(thisData[0].status == 500){
            Swal.fire({
              type:'error',
              title:'Usuario / contraseña incorrecta o se encuentra inactivo ',
            });
            esInicio = false;
            localStorage.setItem("esInicio", esInicio);
          }else{
            esInicio = true;
            localStorage.setItem("esInicio", esInicio);
            let idDeUsuario = thisData[0].idUsuario;
            let cargoIni = thisData[0].cargo;
            localStorage.setItem("idDeUsuario", idDeUsuario);
            localStorage.setItem("cargoIni", cargoIni);

            let ahoraAcceso = new Date();
            let accesoAnio = ahoraAcceso.getFullYear();
            let accesoMonth = ahoraAcceso.getMonth();
            let accesoDay = ahoraAcceso.getDate();
            let accesoHour = ahoraAcceso.getHours();
            let accesoMinutes = ahoraAcceso.getMinutes();
            let accesoSeconds = ahoraAcceso.getSeconds();
            let accesoDia;
            let accesoMes;
            if (accesoMonth < 10) {
              accesoMes = "0"+(accesoMonth+1);
            }else{
              accesoMes = (accesoMonth+1);
            }

            if (accesoDay < 10) {
              accesoDia = "0"+accesoDay;
            }else{
              accesoDia = accesoDay;
            }
    
            let hora = accesoHour+":"+accesoMinutes+":"+accesoSeconds;
            let fechaAcceso = accesoAnio+"-"+accesoMes+"-"+accesoDia+" "+hora;
            
            if (cargoIni.toString().trim().toLocaleLowerCase().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u") 
            != "admin") {
              if (cargoIni.toString().trim().toLocaleLowerCase().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u") 
            == "tecnico") {
              loginRedirectUrl = "../HDCS/forms/tecnico/index.php";
            }else{
              loginRedirectUrl = "../HDCS/forms/personal/index.php";
            }
            }else{
              loginRedirectUrl = "../HDCS/inicio/dashboard.php";
            }
            

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
                  if(dataName.toString().trim() == "0"){}else{
                    localStorage.setItem( "usuarioNombre", dataName.toString().trim());
                  }
                }      
              });

              if (checkSession == null || checkSession == "null") {
                $.ajax({
                      url:"bd/crear_acceso.php",
                      type:"POST",
                      async: false,
                      data: {idUsuario:idDeUsuario, accessUrl: "login", usuario:_usuario, password:_password,
                      fechaAcceso:fechaAcceso}, 
                      success:function(dataAccess){
                        console.log("acceso creado");
                        let accesos = JSON.parse(dataAccess);
                        let esAcceso = accesos[0].status;
                        console.log(esAcceso);
                    
                        if (esAcceso == 200) {
                          let thisHash = accesos[0].hash;
                          localStorage.setItem("thisHash", thisHash);
                          window.location.href = loginRedirectUrl;
                        }
                    
                        if (esAcceso == 500) {
                          localStorage.setItem("thisHash", null);
                        }
                      }      
                    });
              }else{

                $.ajax({
                  url:"bd/get_hash.php",
                  type:"POST",
                  async: false,
                  data: {idUsuario:idDeUsuario, hash:checkSession}, 
                    success:function(dataHash){
                      let hashData = JSON.parse(dataHash);
                      let esHash = hashData[0].status;

                      console.log(esHash);

                      if (esHash == 200) {
                        window.location.href = loginRedirectUrl;
                      }
                  
                      if (esHash == 500) {
                        Swal.fire({
                          type:'warning',
                          title:'Ya existe una sesión de usuario abierta',
                        });
                      }
                    }      
                  });
              }
          }
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
  $('div.dataTables_scrollBody').height(300);
}

  $.ajax({
    type: "post",
    crossOrigin: true,
    url: outCallUrl,
    data: {opcion:4},
    async: false,
    success: function (data) {
      userCountArray = JSON.parse(data);
      if (userCountArray.length == 0 || userCountArray.length == null) {
        $("#userCount").text(0);
      }else{
        $("#userCount").text(userCountArray.length);
      }
    }
  });

if(currentUrl == "/HDCS/inicio/reporteria.php"){
  

  $("input[type=date]").val("");

  $('input[type=date]').change(function (val) {
    let indexDate = $('input[type=date]').index(this);
    if (indexDate == 0) {
      dFrom = this.value;
    }
    if (indexDate == 1) {
      dTo = this.value;
    }
  });

  $(".boton-filtrar").click(function(){
    $("#mantenimientosFiltradosFecha").empty();
    fromTo = dFrom>dTo;
    if (fromTo == true) {
      $(document).Toasts('create', {
        class: 'bg-warning', 
        title: "Error",
        subtitle: 'Cerrar',
        autohide: true,
        delay: 6000,
        body: 'La fecha inicial no puede ser mayor a la final.'
      })
    }else{
      $("#page_loader").fadeIn();
      $.ajax({
        type: "post",
        crossOrigin: true,
        url: "../bd/get_mantenimientos_por_periodo.php",
        data: {from:dFrom, to:dTo},
        async: false,
        success: function (data) {
          arrayFiltered = JSON.parse(data);
          console.log("data filtrada");
          console.dir(arrayFiltered);
          let sortedPeriodArray = mantenimientosPendientesArray.sort();
          for (let indexFilt = 0; indexFilt < arrayFiltered.length; indexFilt++) {
            const elementFiltered = arrayFiltered[indexFilt];
            let estadoFiltrado = elementFiltered.status;
            if (estadoFiltrado == 200) {
              $(".alerta-no-data").eq(0).fadeOut("slow");
              let oNumberFilt = elementFiltered.idControlMantenimiento+"-"+elementFiltered.idSolicitudMantenimiento;
              let oEquipmentFilt = elementFiltered.descripcionEquipo;
              let oDeptoFilt = elementFiltered.departamentoP;
              let oStatusFilt = elementFiltered.estadoControlMantenimiento;
              let oSDateFilt = elementFiltered.fechaSolicitudMantenimiento;
              let oDateFilt = elementFiltered.fechaControlMantenimiento;
              let oClassFilt = "success";
  
              if(oStatusFilt == "Diagnosticado"){
                oClassFilt = "danger";
              }
      
              if(oStatusFilt == "En reparación"){
                oClassFilt = "warning";
              }
      
              if(oStatusFilt == "Finalizado"){
                oClassFilt = "success";
              }
  
              $("#mantenimientosFiltradosFecha").append(
                "<tr class='maintinance-filtered'>"
                  +"<td>"+oNumberFilt+"</td>"+"<input type='hidden' value="+elementFiltered.idControlMantenimiento+" class='order-number'>"
                  +"<td>"+oEquipmentFilt+"<span class='order-description' style='display:none;'>"+oEquipmentFilt+"</span></td>"
                  +"<td><span class='badge badge-"+oClassFilt+"' style='width:120px;'>"+oStatusFilt+"</span><span class='order-status' style='display:none;'>"+oStatusFilt+"</span></td>"
                  +"<td>"
                    +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oSDateFilt+"</div>"+"<input type='hidden' value="+oSDateFilt+" class='order-sdate'>"
                  +"</td>"
                  +"<td>"
                    +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDateFilt+"</div>"+"<input type='hidden' value="+oDateFilt+" class='order-odate'>"
                  +"</td>"
                  +"<td>"
                    +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDeptoFilt+"</div>"+"<input type='hidden' value="+oDeptoFilt+" class='order-odate'>"
                  +"</td>"
                 +"</tr>");
            }
                
            if (estadoFiltrado == 500) {
              $(".alerta-no-data").eq(0).fadeIn();
            }
  
            if (indexFilt == (arrayFiltered.length-1)) {
              $("#page_loader").fadeOut("slow");
            }
          }
          
        }
      });
    }
  
  });

  if (isFirstFilter == true) {
    var thisDate = new Date();
    var firstDay = new Date(thisDate.getFullYear(), thisDate.getMonth(), 1);
    let esteMes = firstDay.getMonth();
    let elMes = esteMes+1;
    let esteDia = thisDate.getDate();

    if (elMes < 10) {
      elMes = "0"+elMes;
    }else{}

    if (esteDia < 10) {
      esteDia = "0"+esteDia;
    }else{}

    dFrom = firstDay.getFullYear()+"-"+elMes+"-0"+1;
    dTo = firstDay.getFullYear()+"-"+elMes+"-"+esteDia;

    $.ajax({
      type: "post",
      crossOrigin: true,
      url: "../bd/get_mantenimientos_por_periodo.php",
      data: {from:dFrom, to:dTo},
      async: false,
      success: function (data) {
        arrayFiltered = JSON.parse(data);
        console.log("data filtrada");
        console.dir(arrayFiltered);
        let sortedPeriodArray = mantenimientosPendientesArray.sort();
        for (let indexFilt = 0; indexFilt < arrayFiltered.length; indexFilt++) {
          const elementFiltered = arrayFiltered[indexFilt];
          let estadoFiltrado = elementFiltered.status;
          if (estadoFiltrado == 200) {
            $(".alerta-no-data").eq(0).fadeOut("slow");
            let oNumberFilt = elementFiltered.idControlMantenimiento+"-"+elementFiltered.idSolicitudMantenimiento;
            let oEquipmentFilt = elementFiltered.descripcionEquipo;
            let oDeptoFilt = elementFiltered.departamentoP;
            let oStatusFilt = elementFiltered.estadoControlMantenimiento;
            let oSDateFilt = elementFiltered.fechaSolicitudMantenimiento;
            let oDateFilt = elementFiltered.fechaControlMantenimiento;
            let oClassFilt = "success";

            if(oStatusFilt == "Diagnosticado"){
              oClassFilt = "danger";
            }
    
            if(oStatusFilt == "En reparación"){
              oClassFilt = "warning";
            }
    
            if(oStatusFilt == "Finalizado"){
              oClassFilt = "success";
            }

            $("#mantenimientosFiltradosFecha").append(
              "<tr class='maintinance-filtered'>"
                +"<td>"+oNumberFilt+"</td>"+"<input type='hidden' value="+elementFiltered.idControlMantenimiento+" class='order-number'>"
                +"<td>"+oEquipmentFilt+"<span class='order-description' style='display:none;'>"+oEquipmentFilt+"</span></td>"
                +"<td><span class='badge badge-"+oClassFilt+"' style='width:120px;'>"+oStatusFilt+"</span><span class='order-status' style='display:none;'>"+oStatusFilt+"</span></td>"
                +"<td>"
                  +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oSDateFilt+"</div>"+"<input type='hidden' value="+oSDateFilt+" class='order-sdate'>"
                +"</td>"
                +"<td>"
                  +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDateFilt+"</div>"+"<input type='hidden' value="+oDateFilt+" class='order-odate'>"
                +"</td>"
                +"<td>"
                  +"<div class='sparkbar' data-color='#00a65a' data-height='20'>"+oDeptoFilt+"</div>"+"<input type='hidden' value="+oDeptoFilt+" class='order-odate'>"
                +"</td>"
               +"</tr>");
          }
              
          if (estadoFiltrado == 500) {
            $(".alerta-no-data").eq(0).fadeIn();
          }
        }
        
      }
    });
  }else{}
  
  let elemRep = document.getElementById("wrapperRep");
  let wrapperWidthR = percentwidth(elemRep);
  
  let percentWidthR = Math.round(wrapperWidthR);

  fotoStatus = localStorage.getItem("fotoStatus");
  nombreU = localStorage.getItem("nombreUsuario");
  uNombre = localStorage.getItem("usuarioNombre");

  $("#usuarioNombreR").text(nombreU);

  if(fotoStatus == "0"){}else{
    fotoUrl = localStorage.getItem("urlFoto");
    $('#fotoDeUsuarioR').css("background-image", "url('" + fotoUrl + "')");
    $("#fotoDeUsuarioR").css("display", "inherit");
    $("#iconoUsuarioR").css("display", "none");
  }
s
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
            let estadoDescripcion = "";
            let oClassU = "";

            if (estado.toString().trim() == "1") {
              estadoDescripcion = "Activo";
              oClassU = "success";
            }else{
              estadoDescripcion = "Inactivo";
              oClassU = "danger";
            }

            if (window.matchMedia("(max-width: 700px)").matches) {
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
                    +"<td><span class='badge badge-"+oClassU+"' style='width:120px;'>"
                      +estadoDescripcion
                    +"</span></td>"
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
                    +"<td><span class='badge badge-"+oClassU+"' style='width:120px;'>"
                      +estadoDescripcion
                    +"</span></td>"
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
    let elems = document.getElementsByClassName("wrapper");
    let elem = elems[0];
    wrapperWidth = percentwidth(elem);
    percentWidth = Math.round(wrapperWidth);
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
    let elemU = document.getElementById("uWrapper");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
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
  }

  if(currentUrl == "/HDCS/forms/departamento/index.php"){
    let elemU = document.getElementById("dWrapper");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
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
  }

  if(currentUrl == "/HDCS/forms/asignacionEquipo/index.php"){
    let elemU = document.getElementById("dWrapper");
    let wrapperWidthU = percentwidth(elemU);
    let percentWidthU = Math.round(wrapperWidthU);
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
        let equipoArray = JSON.parse(data);
        if (equipoArray.length == 0 || equipoArray.length == null) {
          $("#equipmentCount").text(0);
        }else{
          $("#equipmentCount").text(equipoArray.length);
        }
        
      }
    });
    
    var donutData = {
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
        mantenimientosArrayX = JSON.parse(data);
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

          if (index == (mantenimientosArrayX.length-1)) {}
        }
        
      }
    })

    $.ajax({
      type: "get",
      crossOrigin: true,
      url: "../bd/get_control_mantenimiento.php",
      async: false,
      success: function (data) {
        mantenimientosArray = JSON.parse(data);

        $("#mantenimientosTable").empty();

        for (let index = 0; index < mantenimientosArray.length; index++) {
          totalMantenimientos = mantenimientosArray.length;
          const element = mantenimientosArray[index];
          let oNumber = element.idControlMantenimiento+"-"+element.idSolicitudMantenimiento;
          let oEquipment = element.descripcionEquipo;
          let oStatus = element.estadoControlMantenimiento;
          let oSDate = element.fechaSolicitudMantenimiento;
          let oDate = element.fechaControlMantenimiento;
          let oTitulo = element.tituloControlmantenimiento;
          
          oClass = "success";

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
              +"<td>"+oEquipment+"<span class='order-description' style='display:none;'>"+oEquipment+"</span>"+"<span class='order-titulo' style='display:none;'>"+oTitulo+"</span></td>"
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

        $(".maintinance").click(function(mevt){
          mevt.preventDefault();
          mevt.stopPropagation();
          let orderIndex = $(".maintinance").index(this);
          $('.carousel').carousel('pause');
          $('#modalEquipoDetalle').modal('show');

          let orderNumber = $(".order-number").eq(orderIndex).val();
          //alert(orderNumber)
          localStorage.setItem("idDeMantenimiento", orderNumber);

          let orderDescription = $(".order-description").eq(orderIndex).text();
          let orderTitulo = $(".order-titulo").eq(orderIndex).text();
          let orderStatus = $(".order-status").eq(orderIndex).text();
          let orderSDate = $(".order-sdate").eq(orderIndex).val();
          let orderODate = $(".order-odate").eq(orderIndex).val();

          let ordersContainer = document.getElementsByClassName("order-"+orderNumber);

          $("#carouselContainer").empty();
          $("#thumbnailsContainer").empty();
          $("#manDetalles").empty();
          
          $("#manTitulo").text(orderTitulo);
          $("#manDescripcion").text(orderDescription);
          //$("#manDetalles").append("<li class='list-group-item'>Estado : "+orderStatus+"</li>");
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

              elStatusClass = document.getElementById("status_class");
              elStatusIcon = document.getElementById("status_icon");
              elStatusClass.className = '';
              elStatusIcon.className = '';
              $("#status_title").text("");

              let dClass = "bg-warning";
              let dIcon = "fas fa-cog";
              let finalizarContainer = document.getElementsByClassName("finalizar-mantenimiento");
              let finalizarCount = finalizarContainer.length;
              if(orderStatus == "Diagnosticado"){
                if (finalizarCount == 0) {
                  //$("#order_body").append("<a href='#' class='card-link finalizar-mantenimiento boton-edicion'>Finalizar</a>");
                }
                
                dClass = "info-box-icon elevation-1 bg-danger";
                dIcon = "fas fa-hourglass-start";
              }
              if(orderStatus == "En reparación"){
                if (finalizarCount == 0) {
                  //$("#order_body").append("<a href='#' class='card-link finalizar-mantenimiento boton-edicion'>Finalizar</a>");
                }
                
                dClass = "info-box-icon elevation-1 bg-warning";
                dIcon = "fas fa-cog"
              }
              if(orderStatus == "Finalizado"){
                if (finalizarCount > 0) {
                  //$(".boton-edicion").eq(1).remove();
                }
                //$(".boton-edicion").eq(1).remove();
                dClass = "info-box-icon elevation-1 bg-success";
                dIcon = "fas fa-thumbs-up";
              }

              $("#status_class").addClass(dClass);
              $("#status_icon").addClass(dIcon);
              $("#status_title").text(orderStatus);

              

              $(".thumb-nail").click(function(){
                $(".carousel-item").eq(thumbIndex).removeClass(className);
                
                indexThumb = $(".thumb-nail").index(this);
                $(".carousel-item").eq(indexThumb).addClass(className);
          
                thumbElements = document.getElementsByClassName("carousel-item");
                thumbElement = thumbElements[indexThumb];

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
        deptCountArray = JSON.parse(data);

        $("#deptosContenedor").empty();

        for (let indexPie = 0; indexPie < deptCountArray.length; indexPie++) {
          const element = deptCountArray[indexPie];
          let deptoNombre = element.departamento;
          let deptoId = element.idDepartamento;
          donutData.labels.push(deptoNombre);
          
          $.ajax({
            type: "post",
            crossOrigin: true,
            url: "../bd/get_depto_mantenimientos_por_estado.php",
            data: {deptoId:deptoId},
            async: false,
            success: function (data) {
              let deptMCountArray = JSON.parse(data);
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
            var donutChartCanvas = $('#donutChartE').get(0).getContext('2d')
            var pieData        = donutData;
            var pieOptions     = {
              maintainAspectRatio : true,
              responsive : true,
            }
        
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
        let asignCountArray = JSON.parse(data);
        
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
          if (indexI == (imagesArray.length-1)) {}
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
                indexThumb = $(".thumb-nail").index(this);
                $(".carousel-item").eq(indexThumb).addClass(className);
          
                thumbElements = document.getElementsByClassName("carousel-item");
                thumbElement = thumbElements[indexThumb];
                if (indexThumb==(ordersContainer.length-1)) {
                  thumbIndex = 0;
                }else{
                  thumbIndex = indexThumb;
                }
    })

    fotoStatus = localStorage.getItem("fotoStatus");
    nombreU = localStorage.getItem("nombreUsuario");
    uNombre = localStorage.getItem("usuarioNombre");

    $(".usuario-nombre").eq(0).text(nombreU);
    
    if(fotoStatus == "0"){}else{
      fotoUrl = localStorage.getItem("urlFoto");
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

          sizeFile = Math.round(input.files[0].size);
          pesoDeImagen = formatBytes(sizeFile,2);
          isMb = pesoDeImagen.indexOf("MB");

          if (isMb != -1) {
            let mbPrefix = pesoDeImagen.substring(0,1);
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
                let urlPhoto = e.target.result;
                fotoUrl = urlPhoto.toString().trim();

                $('#uploadUserPhotoImg').css("background-image", "url('" + urlPhoto + "')");
                $('#uploadUserPhotoImg').css("display", "inherit");
                $('#fotoDeUsuario').css("background-image", "url('" + urlPhoto + "')");
                $('#fotoDeUsuario').css("display", "inherit");
              
                $('#uploadUserPhotoIcon').css("display", "none");
                $('#iconoUsuario').css("display", "none");

                esCambioFoto = true;
              
                let idDeUsuarioX = localStorage.getItem("idDeUsuario");
                let idUsuario = parseInt(idDeUsuarioX);
                
                formData.append("userId", idUsuario);
                formData.append('file', input.files[0]);
            
              }
            reader.readAsDataURL(input.files[0]);
            }
          }else{
            var reader = new FileReader();
          
            reader.onload = function (e) {
              let urlPhoto = e.target.result;
              fotoUrl = urlPhoto.toString().trim();

              $('#uploadUserPhotoImg').css("background-image", "url('" + urlPhoto + "')");
              $('#uploadUserPhotoImg').css("display", "inherit");
              $('#fotoDeUsuario').css("background-image", "url('" + urlPhoto + "')");
              $('#fotoDeUsuario').css("display", "inherit");
            
              $('#uploadUserPhotoIcon').css("display", "none");
              $('#iconoUsuario').css("display", "none");

              esCambioFoto = true;
              
              let idDeUsuarioX = localStorage.getItem("idDeUsuario");
              let idUsuario = parseInt(idDeUsuarioX);
              
              formData.append("userId", idUsuario);
              formData.append('file', input.files[0]);
              
            }
            reader.readAsDataURL(input.files[0]);
          }
          
        }
        else
        {
          esCambioFoto = false;
        }
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
            let mbPrefixE = pesoDeImagenE.substring(0,1);
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
                let urlEPhoto = e.target.result;
                eFotoUrl = urlEPhoto.toString().trim();
  
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
                
              idDeMantenimiento = localStorage.getItem("idDeMantenimiento");
              idMantenimiento = parseInt(idDeMantenimiento);
              
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
              let urlEPhoto = e.target.result;
              eFotoUrl = urlEPhoto.toString().trim();

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
              
            idDeMantenimiento = localStorage.getItem("idDeMantenimiento");
            idMantenimiento = parseInt(idDeMantenimiento);
            
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

      var doc = new jsPDF(); 
      
      var element = document.getElementsByClassName('print-container');
      var botonesAccion = document.getElementsByClassName("boton-accion");

      if(currentUrl == "/HDCS/inicio/dashboard.php") {
      document.getElementById('repSegEst').style.height = "auto";
      }

      for (let indexA = 0; indexA < botonesAccion.length; indexA++) {
        const element = botonesAccion[indexA];
        element.style.display = "none";
      }

      let elem = element[printIndex];
      let fechaActual = new Date();

      var opt = {
        margin:       1,
        filename:     'myfile.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 1},
        jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
      };
      html2pdf().set(opt).from(elem).toPdf().save('control-matenimientos-'+fechaActual+'.pdf').then(function(pdf) {
        for (let indexB = 0; indexB < botonesAccion.length; indexB++) {
          const element = botonesAccion[indexB];
          element.style.display = "inherit";
        }

        if(currentUrl == "/HDCS/inicio/dashboard.php") {
          document.getElementById('repSegEst').style.height = mantPorDepHeight+"px";
          }
      
      });
    });

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

      urlString = currentUrl.indexOf(urlFilter);
      if (urlString == -1) {
        fotoUrl = "../"+fotoUrl;
      }else{
        fotoUrl = fotoUrl;
      }

      $('.thumb').eq(0).css("background-image", "url('" + fotoUrl + "')");
      $(".thumb").eq(0).css("display", "inherit");
      $("#uploadUserPhotoIcon").css("display", "none");
    }

    let nameUser = $("#usuarioNombre").text();
    let uName = localStorage.getItem("usuarioNombre");
    $("#inputEditUName").attr("placeholder", uName);
    
  });

  
  $(".save-changes-button").click(function(){
    $("#page_loader").fadeIn();

    urlString = currentUrl.indexOf(urlFilter);
  if (urlString == -1) {
    outCallUrl = "../../bd/upload_user_photo.php";
  }else{
    outCallUrl = "../bd/upload_user_photo.php";
  }


    if(esCambioFoto == true){
      $.ajax({
        type: "post",
        crossOrigin: true,
        url: outCallUrl,
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
        }

        
      }).then(function(some){});


      setTimeout(() => {
        let esteIdDeUsuarioX = localStorage.getItem("idDeUsuario");
        let esteIdUsuario = parseInt(esteIdDeUsuarioX);

        urlString = currentUrl.indexOf(urlFilter);
        if (urlString == -1) {
          outCallUrl = "../../bd/get_user_photo.php";
          outUrl = "../../bd/update_user_name.php";
        }else{
          outCallUrl = "../bd/get_user_photo.php";
          outUrl = "../bd/update_user_name.php";
        }

        $.ajax({
          url:outCallUrl,
          type:"POST",
          async: false,
          data: {idUsuario:esteIdUsuario}, 
            success:function(dataPhoto){
              if(dataPhoto.toString().trim() == "0"){
                localStorage.setItem("fotoStatus", 0);
              }else{
                localStorage.setItem("fotoStatus", 1);
                localStorage.setItem( "urlFoto", dataPhoto.toString().trim());
                  if (esCambioUsuario == true) {
                    $.ajax({
                      url:outUrl,
                      type:"POST",
                      async: false,
                      data: {userId:esteIdUsuario, uName:uNombre}, 
                        success:function(thisDataName){
                          $("#page_loader").fadeOut("slow");
                          $('#editUserModal').modal('hide');
                          $(".modal-backdrop").eq(0).removeClass("show");
                          $(".modal-backdrop").eq(0).css("display", "none");

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
                    $("#page_loader").fadeOut("slow");

                    $(document).Toasts('create', {
                      class: 'bg-success', 
                      title: 'Cambios Guardados',
                      subtitle: 'Cerrar',
                      autohide: true,
                      delay: 6000,
                      body: 'Los cambios se han realizado Exitosamente!'
                    })
                    
                    $('#editUserModal').modal('hide');
                    $(".modal-backdrop").eq(0).removeClass("show");
                    $(".modal-backdrop").eq(0).css("display", "none");
                  }
              }
            }      
          });
        
      }, 3000);
      
              
    }else{
      let esteIdDeUsuarioX = localStorage.getItem("idDeUsuario");
        let esteIdUsuario = parseInt(esteIdDeUsuarioX);
        urlString = currentUrl.indexOf(urlFilter);
        if (urlString == -1) {
          outUrl = "../../bd/update_user_name.php";
        }else{
          outUrl = "../bd/update_user_name.php";
        }

      if (esCambioUsuario) {
        $.ajax({
          url:outUrl,
          type:"POST",
          async: false,
          data: {userId:esteIdUsuario, uName:uNombre}, 
            success:function(thisDataName){
              $("#page_loader").fadeOut("slow");
              $('#editUserModal').modal('hide');
              $(".modal-backdrop").eq(0).removeClass("show");
                    $(".modal-backdrop").eq(0).css("display", "none");

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
        $("#page_loader").fadeOut("slow");
        $('#editUserModal').modal('hide');
        $(".modal-backdrop").eq(0).removeClass("show");
                    $(".modal-backdrop").eq(0).css("display", "none");

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
    deactivateUrl = "../../bd/desactivar_sesion.php";
    outUrl = "../../index.php";
  }else{
    outCallUrl = "../bd/logout.php";
    deactivateUrl = "../bd/desactivar_sesion.php";
    outUrl = "../index.php";
  }
  
    $.ajax({
      type: "get",
      crossOrigin: true,
      url: outCallUrl,
      async: true,
      success: function (data) {
        localStorage.setItem("esSesion", false);
        localStorage.setItem('isSession', false);
        
        $.ajax({
          url:deactivateUrl,
          type:"POST",
          async: false,
          data: {hash: thisHash}, 
            success:function(dataAccess){
              let dataDeAcceso = JSON.parse(dataAccess);
              let  estadoR = dataDeAcceso[0].status;
              if (estadoR == 200) {
                console.log("acceso desactivado");
                localStorage.setItem("thisHash", null);
              }
              if (estadoR == 500) {
                console.log("acceso no desactivado");
              }
              
            }      
          });
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

  if (currentUrl == "/HDCS/inicio/dashboard.php") {temporizador = 3000;}
  if (currentUrl == "/HDCS/forms/equipo/index.php") {temporizador = 6000;}
  if (currentUrl == "/HDCS/forms/asignacionEquipo/index.php") {temporizador = 9000;}
  if (currentUrl == "/HDCS/forms/capacidad/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/cargo/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/controlGarantia/index.php") {temporizador = 3000;}
  if (currentUrl == "/HDCS/forms/controlMantenimiento/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/departamento/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/detEquipoComputadora/index.php") {temporizador = 5000;}
  if (currentUrl == "/HDCS/forms/empleado/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/empresaGarantia/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/equipo/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/estadoControlMantenimiento/index.php") {temporizador = 0;}
  if (currentUrl == "/HDCS/forms/marca/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/modelo/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/personal/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/solicitudMantenimiento/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/tecnico/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/tipoDisco/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/tipoEquipo/index.php") {temporizador = 6000;}
  if (currentUrl == "/HDCS/forms/tipoMantenimiento/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/tipoRam/index.php") {temporizador = 4000;}
  if (currentUrl == "/HDCS/forms/usuario/index.php") {temporizador = 2000;}
  if (currentUrl == "/HDCS/forms/velocidadRam/index.php") {temporizador = 4000;}

  urlString = currentUrl.indexOf(urlFilter);

  setTimeout(() => {
    var tablaContainer = document.getElementsByClassName('tabla-data');
  for (let indexTabla = 0; indexTabla < tablaContainer.length; indexTabla++) {
    const element = tablaContainer[indexTabla];
    titulo = $(".file-title").eq(indexTabla).val();
    titulo_doc = $(".document-title").eq(indexTabla).val();
    let myTableId = element.id;

  TableExport(document.getElementById(myTableId), {
    
    headers: true,
    footers: true,
    formats: ["xlsx"],
    filename: titulo+fechaActual,
    bootstrap: false,
    exportButtons: true,
    position: "top",
    ignoreRows: null,
    ignoreCols: null,
    trimWhitespace: true,
    RTL: false,
    sheetname: "Reporte "+fechaActual
  });

  if (indexTabla == (tablaContainer.length-1)) {
    let botoneras = document.getElementsByClassName("tableexport-caption");
    if (window.matchMedia("(max-width: 700px)").matches) {
      for (let indexBoton = 0; indexBoton < botoneras.length; indexBoton++) {
        $(".tableexport-caption").eq(indexBoton).prepend(
          "<div class='row'><div class='col-md-6' style='margin-bottom:6px;'>"
          +"<button type='button' tableexport-id='bbb618"
          +indexBoton+"-todas' class='btn btn-info crear boton-accion boton-crear create-orders-button' style='width:110px;'>Nueva <i class='fas fa-plus'></i></span></button>"
          +"<button type='button' tableexport-id='bba618"
          +indexBoton+"-todas' class='btn btn-secondary todas boton-accion boton-todas all-orders-button' style='width:110px;'>Todas <i class='fas fa-eye'></i></span></button>"
          +"<button type='button' tableexport-id='baa618"
          +indexBoton+"-pdf' class='btn btn-danger pdf boton-accion boton-pdf' style='width:110px;'><span id='pdfIconContainer'>Pdf <i class='fas fa-file-pdf'></i></span></button>"
          +"</div></div>"
        );

        if (indexBoton == (botoneras.length-1)) {
          let botonesXlsx = document.getElementsByClassName("xlsx");

            urlString = currentUrl.indexOf(urlFilter);

            if (urlString == -1) {}else{}

          for (let indexXlsx = 0; indexXlsx < botonesXlsx.length; indexXlsx++) {
            const elementXlsx = botonesXlsx[indexXlsx];
            $(".xlsx").eq(indexXlsx).removeClass("button-default");
            $(".xlsx").eq(indexXlsx).addClass("btn");
            $(".xlsx").eq(indexXlsx).addClass("btn-success");
            $(".xlsx").eq(indexXlsx).addClass("boton-accion");
            $(".xlsx").eq(indexXlsx).addClass("boton-excel");
            $(".xlsx").eq(indexXlsx).css("margin-right", "6px");
            $(".xlsx").eq(indexXlsx).css("width", "110px");
            $(".xlsx").eq(indexXlsx).text("");
            $(".xlsx").eq(indexXlsx).append(" <span>Excel <i class='fas fa-file-excel'></i></span>");
            
            
          }
      }
    }
    }else{
      for (let indexBoton = 0; indexBoton < botoneras.length; indexBoton++) {
        $(".tableexport-caption").eq(indexBoton).prepend(
          "<button type='button' tableexport-id='bbb618"
          +indexBoton+"-todas' class='btn btn-info crear boton-accion boton-crear create-orders-button' style='width:110px;margin-right:6px'>Nueva <i class='fas fa-plus'></i></span></button>"
          +"<button type='button' tableexport-id='bba618"
          +indexBoton+"-todas' class='btn btn-secondary todas boton-accion boton-todas all-orders-button' style='width:110px;margin-right:6px'>Todas <i class='fas fa-eye'></i></span></button>"
          +"<button type='button' tableexport-id='baa618"
          +indexBoton+"-pdf' class='btn btn-danger pdf boton-accion boton-pdf' style='width:110px;margin-right:6px'><span id='pdfIconContainer'>Pdf <i class='fas fa-file-pdf'></i></span></button>"
          );
        if (indexBoton == (botoneras.length-1)) {
          let botonesXlsx = document.getElementsByClassName("xlsx");
          for (let indexXlsx = 0; indexXlsx < botonesXlsx.length; indexXlsx++) {
            const elementXlsx = botonesXlsx[indexXlsx];
            $(".xlsx").eq(indexXlsx).removeClass("button-default");
            $(".xlsx").eq(indexXlsx).addClass("btn");
            $(".xlsx").eq(indexXlsx).addClass("btn-success");
            $(".xlsx").eq(indexXlsx).addClass("boton-accion");
            $(".xlsx").eq(indexXlsx).css("margin-right", "6px");
            $(".xlsx").eq(indexXlsx).css("width", "110px");
            $(".xlsx").eq(indexXlsx).text("");
            $(".xlsx").eq(indexXlsx).append(" <span>Excel <i class='fas fa-file-excel'></i></span>");
            
          }
        }
      }
    }
   }
  }

  $(".create-orders-button").click(function(evc){
    evc.preventDefault();
    evc.stopPropagation();
    window.open("/HDCS/forms/solicitudMantenimiento/index.php", "_self");
  });

  $(".boton-pdf").click(function(evpdf){
    evpdf.preventDefault();
    evpdf.stopPropagation();
    let pdftIndex = $(".boton-pdf").index(this);
    $("#page_loader").fadeIn();
    if (window.matchMedia("(max-width: 700px)").matches) {
      escala = 1;
    }else{
      escala = 2;
    }
    
    var element = document.getElementsByClassName('print-container');
    var elementTitle = document.getElementsByClassName('file-title');
    
    let miContenedor = document.getElementsByClassName("tableexport-caption");
    $('div.dataTables_scrollBody').height("auto");

    var botonesAccion = document.getElementsByClassName("boton-accion");
    var captionS = document.getElementsByClassName("tableexport-caption");
    var tblthis = document.getElementsByTagName("table")[pdftIndex];
    var widthT = tblthis.offsetWidth;
    let doc = new jsPDF();

    for (let indexBA = 0; indexBA < botonesAccion.length; indexBA++) {
      const elementBA = botonesAccion[indexBA];
      elementBA.style.display = "none";
    }
    
    if(currentUrl == "/HDCS/inicio/dashboard.php") {
      document.getElementById('repSegEst').style.height = "auto";
      }
    

    for (let indexA = 0; indexA < botonesAccion.length; indexA++) {
      const element = botonesAccion[indexA];
    }

    let elem = element[pdftIndex];
    titulo = $(".file-title").eq(pdftIndex).val();
    titulo_doc = $(".documento-title").eq(pdftIndex).text();
    $(".documento-title").eq(pdftIndex).text(titulo_doc+" "+fechaActual);
    $(".documento-title").eq(pdftIndex).css("display", "inherit");

    var opt = {
      margin:       1,
      pagebreak: {avoid: 'tr'},
      filename:     'myfile.pdf',
      image:        { type: 'jpeg', quality: 0.98 },
      html2canvas:  { scale: 1},
      jsPDF:        { unit: 'in', format: 'legal', orientation: 'landscape' }
    };

    
    html2pdf().set(opt).from(elem).toPdf().save(titulo+fechaActual+'.pdf').then(function(pdf) {
      
      $(".documento-title").eq(pdftIndex).css("display", "none");
      for (let indexBA = 0; indexBA < botonesAccion.length; indexBA++) {
        const elementBA = botonesAccion[indexBA];
        elementBA.style.display = "inherit";
      }
      
      for (let indexB = 0; indexB < botonesAccion.length; indexB++) {
        const element = botonesAccion[indexB];
      }

      $('div.dataTables_scrollBody').height(300);
      if(currentUrl == "/HDCS/inicio/dashboard.php") {
        document.getElementById('repSegEst').style.height = mantPorDepHeight+"px";
        }
        $("#page_loader").fadeOut("slow");
    });
  });

  $(".all-orders-button").click(function(){
    let ordersIndex = $(".all-orders-button").index(this);
    let contenedor = document.getElementsByClassName("dataTables_scrollBody").eq(0);
      let scrollHeight = contenedor.clientHeight;

    if(currentUrl == "/HDCS/inicio/dashboard.php"){
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
    }else{
      $('.dataTables_scrollBody').css('height', 300);  
    }
  });

  

  $("#page_loader").fadeOut("slow");
  }, temporizador);

}); // document ready