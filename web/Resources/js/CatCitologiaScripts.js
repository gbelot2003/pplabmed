/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function guardarCatCitologia(){
    $('#processing-modal').modal('show');        
    var nomp = $('#NombreCatCitologia').val().trim();
    var e=0;
    var variables="";
    if(nomp===""){
        e = 1;
        document.getElementById("NombreCatCitologia").style["border"]="3px solid #A94442";
        variables += "- Nombre del Medico\n";
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
       enviarCatCitologia();    
    }  
}

function enviarCatCitologia(){    
    var nomp = $('#NombreCatCitologia').val().trim();
    var estado = $('input[name="Estado"]:checked').val();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title:'Registro creado correctamente.',
                text: "",
                type:'success',
                confirmButtonText: 'Ok'
            }).then(function() {                
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                cargarContenido("ListaIDCitologia.htm","contenido");
            })
        }
    }
    xhttp.open("POST","idCito.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("NombreCatCitologia="+nomp+"&Estado="+estado);
}





function estadoCatCitologiaEdit(id, est) {
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
            document.getElementById("cargaPreviaCatCitologia").innerHTML = xhttp.responseText;
            swal({
                title: 'Estado modificado.',
                text: "",
                type: 'success',
                timer: 2000
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editaarea').modal('hide');
                cargarContenido("ListaIDCitologia.htm", "contenido");
            });
        }
    };
    xhttp.open("POST", "upCatcitologiaEstado.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp=" + id + "&bol=" + est);
}



//function estadoCatCitologiaEdit(id,est){
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
//        text: "Desea cambiar el estado del Registro, al modo "+estadoA+"?",
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
//                    cargarContenido("ListaIDCitologia.htm","contenido");
//                }
//            }
//            xhttp.open("POST", "upCatcitologiaEstado.htm", true);
//            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//            xhttp.send("idp="+id+"&bol="+est);
//    });
//}


function cargaInfoCatCitologia(id){
    $("#tempId").val(id);
    $('#processing-modal').modal('show');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaCatCitologia").innerHTML = xhttp.responseText;
             $('#processing-modal').modal('hide');
             $('#editcatcitologia').modal('show');
        }
    }
    xhttp.open("POST", "cargaVistaCatCitologia.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp="+id); 
}


function updateCatCitologia(){
    $('#processing-modal').modal('show');        
    var nomp = $('#Nombre').val().trim();
    var e=0;
    var variables="";
    if(nomp===""){
        e = 1;
        document.getElementById("Nombre").style["border-color"]="#A94442";
        variables += "- Nombre de usuario no puede estar vacio.\n";
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
        actualizaCatCitologia();
    }  
}

function actualizaCatCitologia(mn,bool){
    var id =  $("#tempId").val();
    var nomp = $('#Nombre').val().trim();
    var estado = $('input[name="Estado"]:checked').val();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaCatCitologia").innerHTML = xhttp.responseText;
            swal({
                title:'Detalles del Registro han sido modificados correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function() {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editcatcitologia').modal('hide');
                cargarContenido("ListaIDCitologia.htm","contenido");
            })
        }
    }
    xhttp.open("POST", "upd_CatCitologia.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("id="+id+"&Nombre="+nomp+"&Estado="+estado);
    }