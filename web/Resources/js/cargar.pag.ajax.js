function nuevoAjax(xmlhttp){
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;
        }
    }
    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}

function cargarContenido(pagina,destino){
    var contenedor;
    var ajax;
    
    contenedor = document.getElementById(destino);
    ajax = nuevoAjax(ajax);
    ajax.open("GET", pagina, true);
    ajax.onreadystatechange=function() {
        if (ajax.readyState==4) {
            contenedor.innerHTML = ajax.responseText;
            //Asigna la clase de DataTable a los grid de las vistas*/
            if(pagina==='ListadoDeAreas.htm'){
                $('#TablaAreas').DataTable();
            }
            if(pagina==='ListaPerfiles.htm'){
                $('#tablaperfiles').DataTable();
            }
            if(pagina==='ListaUsuarios.htm'){
                $('#TablapermisosUsuarios').DataTable();
            }
             if(pagina==='listaFirmas.htm'){
                $('#TablaListaFirmas').DataTable();
            }
            if (pagina==='ListaIDCitologia.htm'){
                $('#TablaCatCitologia').DataTable();
            }
        }
    }
    ajax.send(null);
}

function agregarContenido(pagina,destino){
    var contenedor;
    var ajax;
    
    contenedor = document.getElementById(destino);
    ajax = nuevoAjax(ajax);
    ajax.open("GET", pagina, true);
    ajax.onreadystatechange=function() {
        if (ajax.readyState==4) {
            contenedor.innerHTML = contenedor.innerHTML+ajax.responseText;
        }
    }
    ajax.send(null);
}

function cargarfromselect(elsel, caso, destino, campo){
    var elvalor=$("#"+elsel+" option:selected").val();
    var lapagina="";
    var entro=false;
    if(elvalor!=="-1"){
        switch(caso){
            case 1:
                entro=true;
                lapagina='AlumnosClase.htm?c='+elvalor;
                break;  
                
            case 2:
                entro=true;
                lapagina='AlumnosUsuario.htm?p='+elvalor;
                break;
                
            case 3:
                entro=true;
                lapagina='DatosActividades.htm?p='+elvalor;
                break;
        }
    }else{
        $("#"+destino).html('');
    }   
    if(entro){
        $("#"+campo).val(elvalor);
        cargarContenido(lapagina, destino);
    }
}

function cargando(destino){
    $("#"+destino).html('<div style="text-align: center;"><br/><br/><br/><br/><h1>Cargando..</h1><img src="Resources/img/Cargando.gif" alt="cargando"/></div>');
}

function cargandoblanco(destino){
    $("#"+destino).html('<div style="text-align: center;"><br/><br/><br/><br/><h1 style="color: white;">Cargando..</h1><img src="Resources/img/Cargando.gif" alt="cargando"/></div>');
}

function cargandoAviso(destino){
    $("#"+destino).html('<div style="text-align: center;"><br/><br/><br/><br/><h1>Enviando avisos..</h1><img src="Resources/img/Cargando.gif" alt="cargando"/></div>');
}

function selectall(eldiv, elcheck){
    var check=document.getElementById(elcheck).checked;
    var collection = document.getElementById(eldiv).getElementsByTagName('INPUT');
    for (var x=0; x<collection.length; x++) {
        if (collection[x].type.toUpperCase()=='CHECKBOX'){
            if(check){
                if(!collection[x].checked){
                    agregaralista(collection[x].value, '#asignados');
                }
            }else{
                if(collection[x].checked){
                    agregaralista(collection[x].value, '#asignados');
                }
            }
            collection[x].checked = check;
        }
    }    
}