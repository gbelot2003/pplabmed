/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function guardarFirma(){
    $('#processing-modal').modal('show');        
    var nomp = $('#NombreDoc').val().trim();
    var code = $('#CodDoc').val().trim();
       
    var e=0;
    var variables="";
    if(nomp===""){
        e = 1;
        document.getElementById("NombreDoc").style["border"]="3px solid #A94442";
        variables += "- Nombre del Medico\n";
    }
    if(code===""){
        e = 1;
        document.getElementById("CodDoc").style["border"]="3px solid #A94442";
        variables += "- Codigo de busqueda del Medico\n";
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
        enviarFirma();    
    }  
}


function enviarFirma(){    
    var nomp = $('#NombreDoc').val().trim();
    var code = $('#CodDoc').val().trim();
    var estado =  document.getElementById('Estado').checked;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title:'Firma  creada correctamente.',
                text: "",
                type:'success',
                confirmButtonText: 'Ok'
            }).then(function() {                
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                cargarContenido("listaFirmas.htm","contenido");
            })
        }
    }
    alert("NombreDoc="+nomp+"&CodDoc="+code+"&Estado="+estado);
    xhttp.open("POST","NuevaFirma2.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("NombreDoc="+nomp+"&CodDoc="+code+"&Estado="+estado);
}

function cargaInfoFirma(id){
    $("#tempId").val(id);
    $('#processing-modal').modal('show');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaFirma").innerHTML = xhttp.responseText;
             $('#processing-modal').modal('hide');
             $('#editafirma').modal('show');
        }
    }
    xhttp.open("POST", "cargaVistaFirma.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp="+id); 
}



function estFirmasEdit(id, est) {
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
            document.getElementById("cargaPreviaFirma").innerHTML = xhttp.responseText;
            swal({
                title: 'Firma modificada correctamente.',
                text: "",
                type: 'success',
                timer: 2000
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editaarea').modal('hide');
                cargarContenido("listaFirmas.htm", "contenido");
            })
        }
    }
    xhttp.open("POST", "upFirmaEstado.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp=" + id + "&bol=" + est);
}





//function estFirmasEdit(id,est){
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
//        text: "Desea cambiar el estado de la Firma, al modo "+estadoA+"?",
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
//                    cargarContenido("listaFirmas.htm","contenido");
//                }
//            }
//            xhttp.open("POST", "upFirmaEstado.htm", true);
//            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//            alert(id,est);
//            xhttp.send("idp=" + id +"&bol="+est);
//    });
//}



function updateFirma(){
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
        actualizaFirma();
    }  
}

function actualizaFirma(mn,bool){
    var id =  $("#tempId").val();
    var nomp = $('#Nombre').val().trim();
    var codigo = $('#Codigo').val().trim();
    var estado = $('input[name="Estado"]:checked').val();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaFirma").innerHTML = xhttp.responseText;
            swal({
                title:'Detalles de Firma ha sido modificada correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function() {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editafirma').modal('hide');
                cargarContenido("listaFirmas.htm","contenido");
            })
        }
    }
    xhttp.open("POST", "upd_firma.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    alert(id+nomp+codigo+estado);
    xhttp.send("id="+id+"&Nombre="+nomp+"&Codigo="+codigo+"&Estado="+estado);   
}