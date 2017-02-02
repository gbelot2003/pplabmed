/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


  function guardarHistopatologia(){
    $('#processing-modal').modal('show');        
    var idtblhansa_ =$("#Nofactura").val().trim();
    var firma1 = document.getElementById("Firma1").options[document.getElementById("Firma1").selectedIndex].value;
       
    var e=0;
    var variables="";
    alert("Nofactura="+idtblhansa_+"&firma="+firma1);
    if(idtblhansa_===""){
        e=1;
        document.getElementById("Nofactura").style["border"]="3px solid #A94442";
        variables += "- No. Factura\n";
    }
    if(firma1==="0"){
        e=2;
         document.getElementById("Firma1").style["border"]="3px solid #A94442";
        variables += "- Firma\n";
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
        enviarHistopatologia();    
    }  
}


function enviarHistopatologia(){  
    var idtblhansa_ =$("#Nofactura").val().trim();
    var diagnosticoclinico_ =$("#DiagnosticoClinico").val().trim();
    var muestra_ = $("#Muestra").val().trim();
    var mor1_ = $("#Mor1").val().trim();
    var mor2_ = $("#Mor2").val().trim();
    var fechainforme_ = $("#Finforme").val();
    var fechabiopsia_ = $("#FBiopsia").val();
    var firmas1 = document.getElementById("Firma1").options[document.getElementById("Firma1").selectedIndex].value;
    var firmas2 = document.getElementById("Firma2").options[document.getElementById("Firma2").selectedIndex].value;
    var topog_ = $("#TOPOG").val().trim();
    var fechamuestra_ = $("#FMuestra").val().trim();
    var descmacro_ = $("#DescMacro").val().trim();
    var descmicro_ = $("#DescMicro").val().trim();
    var diagnostico_ = $("#Diagnostico").val().trim();
    var codigohisto_ = $("#code").val().trim();
//    var code = document.getElementById("elID").innerHTML;
//   alert('the value is:' + values);
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
    xhttp.open("POST", "histopatologia.htm", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    alert("Nofactura="+idtblhansa_+"&DescMicro"+descmicro_+"&Diagnostico="+diagnostico_+"&code="+codigohisto_);
    xhttp.send("Nofactura="+idtblhansa_+"&DiagnosticoClinico="+diagnosticoclinico_+"&Muestra="+muestra_+"&Mor1="+mor1_+"&Mor2="+mor2_+"&Finforme="+fechainforme_+"&FBiopsia="+fechabiopsia_+"&Firma1="+firmas1+"&Firma2="+firmas2+"&TOPOG="+topog_+"&FMuestra="+fechamuestra_+"&DescMacro="+descmacro_+"&DescMicro="+descmicro_+"&Diagnostico="+diagnostico_+"&code="+codigohisto_);
 }
      



 
//    var fechainforme_ = $("#Finforme").val();
//    var fechabiopsia_ = $("#FBiopsia").val();
//    var firmas1 = document.getElementById("Firma1").options[document.getElementById("Firma1").selectedIndex].value;
//    var firmas2 = document.getElementById("Firma2").options[document.getElementById("Firma2").selectedIndex].value;
//    var topog_ = $("#TOPOG").val().trim();
//    var fechamuestra_ = $("#FMuestra").val().trim();
//    var descmacro_ = $("#DescMacro").val().trim();
//    var descmicro_ = $("#DescMicro").val().trim();
//    var diagnostico_ = $("#Diagnostico").val().trim();
//    var codigohisto_ = $("#code").val().trim();