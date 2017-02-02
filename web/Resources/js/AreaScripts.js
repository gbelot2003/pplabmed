/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function cargaInfoArea(id) {
    $("#tempId").val(id);
    $('#processing-modal').modal('show');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaArea").innerHTML = xhttp.responseText;
            $('#processing-modal').modal('hide');
            $('#editaarea').modal('show');
        }
    }
    xhttp.open("POST", "CargaVistaArea.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idp=" + id);

}


function guardarArea() {
    $('#processing-modal').modal('show');
    var nomp = $('#NombreArea').val().trim();
    var e = 0;
    var variables = "";
    if (nomp === "") {
        e = 1;
        document.getElementById("NombreArea").style["border-color"] = "#A94442";
        variables += "- Nombre del area\n";
    }
    if (e !== 0) {
        var mensaje = '<h2>Favor validar:</h2>';
        $('#processing-modal').modal('hide');
        $('#processing-modal').modal('hide');
        swal({
            title: '',
            text: mensaje + '<p>' + variables + '</p>',
            type: 'error'
        });
    } else {
        enviarArea();
    }
}


function enviarArea() {
    var nomp = $('#NombreArea').val().trim();
    var estado = document.getElementById('Estado').checked;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title: 'Area creada correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                cargarContenido("ListadoDeAreas.htm", "contenido");
            })
        }
    }
    xhttp.open("POST", "NuevaArea.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("NombreArea=" + nomp + "&Estado=" + estado);

}
//
//
//function estAreaEdit(id, est) {
//    var estadoA = "";
//    if (est === "true") {
//        est = 'false';
//        estadoA = "Desactivado";
//    } else {
//        est = 'true';
//        estadoA = "Activado";
//    }
//    swal({
//        title: 'Alerta!',
//        text: "Se ha cambiado el Estado del Área a " + estadoA + "?",
//        type: "success",
//        timer: 2000
//    }).then(function () {
//        $('#processing-modal').modal('show');
//        var xhttp = new XMLHttpRequest();
//        xhttp.onreadystatechange = function () {
//            if (xhttp.readyState == 4 && xhttp.status == 200) {
//                $('#processing-modal').modal('hide');
//                cargarContenido("ListadoDeAreas.htm", "contenido");
//            }
//        }
//        xhttp.open("POST", "upAreaEstado.htm", true);
//        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//        xhttp.send("idp=" + id + "&bol=" + est);
//    });
//}

function estAreaEdit(id, est) {
    var estadoA = "";
    var xhttp = new XMLHttpRequest();
    if (est === "true") {
        est = 'false';
        estadoA = "Desactivado";
    } else {
        est = 'true';
        estadoA = "Activado";
    }
    xhttp.onreadystatechange = function (){
    if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaArea").innerHTML = xhttp.responseText;
            swal({
                title: 'Area modificada correctamente.',
                text: "",
                type: 'success',
                timer:2000
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editaarea').modal('hide');
                cargarContenido("ListadoDeAreas.htm", "contenido");
            });
        }
        };
        xhttp.open("POST", "upAreaEstado.htm", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("idp=" + id + "&bol=" + est);
    }







function updateArea() {
    $('#processing-modal').modal('show');
    var nomp = $('#Nombre').val().trim();
    var e = 0;
    var variables = "";
    if (nomp === "") {
        e = 1;
        document.getElementById("Nombre").style["border-color"] = "#A94442";
        variables += "- Nombre de usuario no puede estar vacio.\n";
    }

    if (e !== 0) {
        var mensaje = '<h2>Favor validar:</h2>';
        $('#processing-modal').modal('hide');
        $('#processing-modal').modal('hide');
        swal({
            title: 'Alerta:',
            text: mensaje + '<p>' + variables + '</p>',
            type: 'error'
        });
    } else {
        actualizaArea();
    }
}



function actualizaArea(mn, bool) {
    var id = $("#tempId").val();
    var nomp = $('#Nombre').val().trim();
    var estado = $('input[name="Estado"]:checked').val();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaPreviaArea").innerHTML = xhttp.responseText;
            swal({
                title: 'Area modificada correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function () {
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                $('#editaarea').modal('hide');
                cargarContenido("ListadoDeAreas.htm", "contenido");
            })
        }
    }
    xhttp.open("POST", "upd_area.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    alert(id, nomp, estado);
    xhttp.send("id=" + id + "&Nombre=" + nomp + "&Estado=" + estado);
}







