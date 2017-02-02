/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function cargaInfoUsuarios(id){  
    $("#tempId").val(id);
    $('#processing-modal').modal('show');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaUser").innerHTML = xhttp.responseText;
            $('#processing-modal').modal('hide');
            $('#editausr').modal('show');
        }
    }
    xhttp.open("POST", "cargaVistaUser.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp=" + id);
}

function guardarUsuario(){
    $('#processing-modal').modal('show');        
    var nomp = $('#Nombre').val().trim();
    var correo = $('#Correo').val().trim();
    var area = document.getElementById("Area").options[document.getElementById("Area").selectedIndex].value;
    var estado = $('input[name="Estado"]:checked').val();
    var boolaw =document.getElementById('WebApp').checked;
    var boolam =document.getElementById('MobileApp').checked;
    var perfiles = $('#asignados').val().trim();
       
    var e=0;
    var variables="";
    if(nomp===""){
        e = 1;
        document.getElementById("Nombre").style["border"]="3px solid #A94442";
        variables += "- Nombre de usuario\n";
    }
    if(correo===""){
        e = 2;
        document.getElementById("Correo").style["border"]="3px solid #A94442";
        variables += "- Correo\n";
    }
    if(area==="0"){
        e=3;
        document.getElementById("Area").style["border"]="3px solid #A94442";
        variables += "- Area\n";
    }
    if(!(boolaw || boolam)){
        e=4;
        document.getElementById("WebApp").style["outline"]="1.5px solid #A94442";
        document.getElementById("MobileApp").style["outline"]="1.5px solid #A94442";
        variables += "- Accesos a app web y movil (Seleccionar al menos uno)\n";
    }
    if(perfiles===""){
        e=5; 
        variables += "- Asignar Perfiles\n";
    }
    if (e!==0) {
        var mensaje = '<h2>Favor validar:</h2>';
        $('#processing-modal').modal('hide');
        $('#processing-modal').modal('hide');
        swal({
            title: '',
            text:  mensaje+'<p>'+variables+'</p>',
            type: 'error'
        });
    }else{
        enviarUsuario();    
    }  
}


function enviarUsuario(){    
    var nomp = $('#Nombre').val().trim();
    var correo = $('#Correo').val().trim();
    var area = document.getElementById("Area").options[document.getElementById("Area").selectedIndex].value;
    var estado = $('input[name="Estado"]:checked').val();
    var boolaw =document.getElementById('WebApp').checked;
    var boolam =document.getElementById('MobileApp').checked;
    var perfiles = $('#asignados').val().trim();

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title: 'Usuario creado correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function() {                
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                cargarContenido("ListaUsuarios.htm","contenido");
            })
        }
    }
    xhttp.open("POST", "NuevoUsuario.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("Nombre="+nomp+"&Correo="+correo+"&Area="+area+"&Estado="+estado+"&WebApp="+boolaw+"&MobileApp="+boolam+"&asignados="+perfiles);
    
}




function estUserEdit(id, est) {
    var estadoA = "";
    var xhttp = new XMLHttpRequest();
    if (est === "true") {
        est = 'false';
        estadoA = "Desactivado";
    } else {
        est = 'true';
        estadoA = "Activado";
    }
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaUser").innerHTML = xhttp.responseText;
            swal({
                title: 'Estado modificado.',
                text: "",
                type: 'success',
                timer: 2000
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editaarea').modal('hide');
                cargarContenido("ListaUsuarios.htm", "contenido");
            });
        }
    };
    xhttp.open("POST", "updUsrEstado.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp=" + id + "&bol=" + est);
}




//function estUserEdit(id,est){
//    var estadoA = "";
//    if(est==="true"){
//        est='false';
//        estadoA="Desactivado";
//    }else{
//        est='true';
//        estadoA="Activado"
//    ;}
//    swal({
//        title: 'Alerta!',
//        text: "Desea cambiar el estado del perfil, al modo "+estadoA+"?",
//        type: 'warning',
//        showCancelButton: true,
//        confirmButtonColor: '#3085d6',
//        cancelButtonColor: '#d33',
//        confirmButtonText: 'Si',
//        cancelButtonText: 'No'
//    }).then(function() {
//            $('#processing-modal').modal('show');
//            var xhttp = new XMLHttpRequest();
//            xhttp.onreadystatechange = function () {
//                if (xhttp.readyState == 4 && xhttp.status == 200) {
//                    $('#processing-modal').modal('hide');
//                    cargarContenido("ListaUsuarios.htm","contenido");
//                }
//            }
//            xhttp.open("POST", "updUsrEstado.htm", true);
//            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//            xhttp.send("idp=" + id +"&bol="+est);
//    });
//    
//}

function updateUsuario(){
    $('#processing-modal').modal('show');        
    var nomp = $('#Nombre').val().trim();
    var area = document.getElementById("Area").options[document.getElementById("Area").selectedIndex].value;
    var boolaw =document.getElementById('WebApp').checked;
    var boolam =document.getElementById('MobileApp').checked;
    var perfiles = $('#asignados').val().trim();
       
    var e=0;
    var variables="";
    if(nomp===""){
        e = 1;
        document.getElementById("Nombre").style["border-color"]="#A94442";
        variables += "- Nombre de usuario no puede estar vacio.\n";
    }
    if(area==="0"){
        e=3;
        document.getElementById("Area").style["border-color"]="#A94442";
        variables += "- Area no puede ser vacia.\n";
    }
    if(!(boolaw || boolam)){
        e=4;
        document.getElementById("WebApp").style["outline"]="1px solid #A94442";
        document.getElementById("MobileApp").style["outline"]="1px solid #A94442";
        variables += "- Accesos a app web y movil (Seleccionar al menos uno).\n";
    }
    if(perfiles===""){
        e=5; 
        variables += "- Debe de asignar al menos un Perfil\n";
    }
    if (e!==0) {
        var mensaje = '<h2>Favor validar:</h2>';
        $('#processing-modal').modal('hide');
        $('#processing-modal').modal('hide');
        swal({
            title: 'Alerta:',
            text:  mensaje+'<p>'+variables+'</p>',
            type: 'error'
        });
    }else{
        actualizaUser();
    }  
}

function actualizaUser(mn,bool){
    
    var id =  $("#tempId").val();
    var nomp = $('#Nombre').val().trim();
    var area = document.getElementById("Area").options[document.getElementById("Area").selectedIndex].value;
    var estado = $('input[name="Estado"]:checked').val();
    var boolaw =document.getElementById('WebApp').checked;
    var boolam =document.getElementById('MobileApp').checked;
    var perfiles = $('#asignados').val().trim();
    var perfilesant = $('#originales').val().trim();

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaUser").innerHTML = xhttp.responseText;
            swal({
                title:'Usuario modificado correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function() {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editausr').modal('hide');
                cargarContenido("ListaUsuarios.htm","contenido");
            })
        }
    }
    xhttp.open("POST", "updUsuarioC.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("Nombre="+nomp+"&Area="+area+"&Estado="+estado+"&WebApp="+boolaw+"&MobileApp="+boolam+"&asignados="+perfiles+"&originales="+perfilesant+"&id="+id);
}
