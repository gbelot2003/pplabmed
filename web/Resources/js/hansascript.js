/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function guardarCamposHansa(){
    $('#processing-modal').modal('show');        
    var nofact =  $('#IdFactura').val().trim();
    var paciente = $('#Paciente').val().trim();
    var edad = $('#Edad').val().trim();
    var medico = $('#Medico').val().trim();
    var sexo = $('#Sexo').val().trim();
       
    var e=0;
    var variables="";
    if(nofact==="0"){
        e=1;
        document.getElementById("IdFactura").style["border-color"]="#A94442";
        variables += "- ID Factura\n";
    }
    if(paciente==="0"){
        e=2;
         document.getElementById("Paciente").style["border-color"]="#A94442";
        variables += "- Paciente\n";
    }
    
     if(edad==="0"){
        e=3;
         document.getElementById("Edad").style["border-color"]="#A94442";
        variables += "- Edad\n";
    }
    
     if(sexo==="0"){
        e=4;
         document.getElementById("Sexo").style["border-color"]="#A94442";
        variables += "- Sexo\n";
    }
     if(medico==="0"){
        e=4;
         document.getElementById("Medico").style["border-color"]="#A94442";
        variables += "- Sexo\n";
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
        enviarcamposhansa();    
    }  
}
     

   function enviarcamposhansa(){  
   
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title: ' creada correctamente.',
                text: "",
                type: 'success',
                confirmButtonText: 'Ok'
            }).then(function() {                
                $('#processing-modal').modal('hide');
                $('#processing-modal').modal('hide');
                cargarContenido("principal.htm","contenido");
            })
        }
    }
    xhttp.open("POST", "citologias.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    alert("DetCancer="+detcancer+"&IndMaduracion="+indmadura+"&Otros="+otros+"&Diagnostico="+diag+"&FUR="+fur+"&FUP="+fup+"&TOPOG="+gravidad+"&Para="+para+"&Abortos="+aborto+"&idcatcito="+catalogocito+"&Firma1="+firmas1+"&FechaInforme"+fi+"&Fmuestra="+fm1+"&DescMacro="+info);
    xhttp.send("DetCancer="+detcancer+"&IndMaduracion="+indmadura+"&Otros="+otros+"&Diagnostico="+diag+"&FUR="+fur+"&FUP="+fup+"&TOPOG="+gravidad+"&Para="+para+"&Abortos="+aborto+"&idcatcito="+catalogocito+"&Firma1="+firmas1+"&Firma2="+firmas2+"&Otros2="+otro2+"&FechaInforme="+fi+"&Fmuestra="+fm1+"&DescMacro="+info);                   
 }
