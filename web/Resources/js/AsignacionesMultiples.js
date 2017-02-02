/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function agregaralista(elcod, elcampo){
    var todoslosnumeros=$(elcampo).val();
    var arrnumeros=todoslosnumeros.split("_xk12x_");
    var nuevosnum="";
    var existia=false;
    for(var i=0; i<arrnumeros.length; i++){
        if(arrnumeros[i]!=elcod){
            if(nuevosnum===""){
                nuevosnum=arrnumeros[i];
            }else{
                nuevosnum=nuevosnum+"_xk12x_"+arrnumeros[i];
            }
        }else{
            existia=true;
        }
    }
    
    if(!existia){
        if(nuevosnum===""){
            nuevosnum=elcod;
        }else{
            nuevosnum=nuevosnum+"_xk12x_"+elcod;
        }
    }
    $(elcampo).val(nuevosnum);
}

function validarlista(elcod, elcampo, idcheck){
    var todoslosnumeros=$(elcampo).val();
    if(todoslosnumeros===""){
        $(elcampo).val(elcod);
    }else{
        if(todoslosnumeros==elcod){
            document.getElementById(idcheck).checked = false;
            $(elcampo).val("");
        }else{
            document.getElementById('checkboxid'+todoslosnumeros).checked = false;
            $(elcampo).val(elcod);
            return false;
        }
    }    
}

