/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function guardarCitologia(){
    $('#processing-modal').modal('show');        
    var nofact =  $('#IdFactura').val().trim();
    var paciente = $('#Paciente').val().trim();
    var edad = $('#Edad').val().trim();
    var medico = $('#Medico').val().trim();
    var sexo = $('#Sexo').val().trim();
    var idcatcito = document.getElementById("idcatcito").options[document.getElementById("idcatcito").selectedIndex].value;
    var firma1 = document.getElementById("Firma1").options[document.getElementById("Firma1").selectedIndex].value;
    var e=0;
    var variables="";
    if(nofact==="0"){
        e=1;
        document.getElementById("IdFactura").style["border"]="3px solid #A94442"; 
        variables += "- ID Factura\n";
    }
    if(paciente==="0"){
        e=2;
         document.getElementById("Paciente").style["border"]="3px solid #A94442"; 
        variables += "- Paciente\n";
    }
     if(edad==="0"){
        e=3;
         document.getElementById("Edad").style["border"]="3px solid #A94442"; 
        variables += "- Edad\n";
    }
    if(sexo==="0"){
        e=4;
         document.getElementById("Sexo").style["border"]="3px solid #A94442"; 
        variables += "- Sexo\n";
    }
     if(medico==="0"){
        e=5;
         document.getElementById("Medico").style["border"]="3px solid #A94442"; 
        variables += "- Sexo\n";
    }
    if(idcatcito==="0"){
        e=6;
        document.getElementById("idcatcito").style["border"]="3px solid #A94442"; 
        variables += "- ID Citologia\n";
    }
    if(firma1==="0"){
        e=7;
         document.getElementById("Firma1").style["border"]="3px solid #A94442";     
         
         
        variables += "- Firma Medico\n";
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
        enviarcitologia();    
    }  
}
     

   function enviarcitologia(){ 
    //campos Hansa
    var nofact =  $('#IdFactura').val().trim();
    var paciente = $('#Paciente').val().trim();
    var edad = $('#Edad').val().trim();
    var medico = $('#Medico').val().trim();
    var sexo = $('#Sexo').val().trim();
    //campos citologia
    var detcancer =document.getElementById('DetCancer').checked;
    var indmadura =document.getElementById('IndMaduracion').checked;
    var otros = $('#Otros').val().trim();
    var diag = $('#Diagnostico').val().trim();
    var fur =  $('#FUR').val().trim();
    var fup = $("#FUP").val().trim();
    var gravidad = $("#TOPOG").val().trim();
    var para = $("#Para").val().trim();
    var aborto = $("#Abortos").val().trim();
    var catalogocito = document.getElementById("idcatcito").options[document.getElementById("idcatcito").selectedIndex].value;
    var firmas1 = document.getElementById("Firma1").options[document.getElementById("Firma1").selectedIndex].value;
    var firmas2 = document.getElementById("Firma2").options[document.getElementById("Firma2").selectedIndex].value;
    var otro2 = $("#Otros2").val().trim();
    var fi =  $("#FechaInforme").val();
    var fm1 = $("#Fmuestra").val();
    var info = $("#DescMacro").val();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("creaNuevo").innerHTML = xhttp.responseText;
            swal({
                title: 'Citologia creada correctamente.',
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
    alert('IdFactura='+nofact+'&Paciente='+paciente+'&Edad='+edad+'&Medico='+medico+'&Sexo='+sexo+"&DetCancer="+detcancer+"&IndMaduracion="+indmadura+"&Otros="+otros+"&Diagnostico="+diag+"&FUR="+fur+"&FUP="+fup+"&TOPOG="+gravidad+"&Para="+para+"&Abortos="+aborto+"&idcatcito="+catalogocito+"&Firma1="+firmas1+"&Firma2="+firmas2+"&Otros2="+otro2+"&FechaInforme="+fi+"&Fmuestra="+fm1+"&DescMacro="+info);                   
    xhttp.send('IdFactura='+nofact+'&Paciente='+paciente+'&Edad='+edad+'&Medico='+medico+'&Sexo='+sexo+"&DetCancer="+detcancer+"&IndMaduracion="+indmadura+"&Otros="+otros+"&Diagnostico="+diag+"&FUR="+fur+"&FUP="+fup+"&TOPOG="+gravidad+"&Para="+para+"&Abortos="+aborto+"&idcatcito="+catalogocito+"&Firma1="+firmas1+"&Firma2="+firmas2+"&Otros2="+otro2+"&FechaInforme="+fi+"&Fmuestra="+fm1+"&DescMacro="+info);                   
 }