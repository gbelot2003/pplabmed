<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<html>
    <head>

    </head>
    <body>
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label for="Pefil">Nombre:</label>
                    <input type="text" class="form-control" id="Pefil" name="Pefil" placeholder="" value="${nombrePerfil}">

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label for="Desc">Descripción:</label>
                    <textarea class="form-control" id="Desc" name="Desc" rows="3">${descPerfil}</textarea>

                </div>
            </div>
        </div>            
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label for="CodDoc">Estado:</label>
                    <div class="form-group" style="font-size: 20px;">
                        <c:if test="${estado eq 'true'}">
                            <label class="radio-inline"><input type="radio" name="optestado" checked="checked"  value="true">Activado</label>  
                            <label class="radio-inline"><input type="radio" name="optestado" value="false">Desactivado</label>
                            </c:if>
                            <c:if test="${estado eq 'false'}">
                            <label class="radio-inline"><input type="radio" name="optestado" value="true">Activado</label>  
                            <label class="radio-inline"><input type="radio" name="optestado" checked="checked"   value="false">Desactivado</label>
                            </c:if>
                    </div>
                </div>
            </div>
        </div>
        <h3 class="text-center">Permisos asignados</h3>
        <c:set var="valida" value="${fn:length(nomper)}" />
        <c:if test="${valida > 0}">
            <c:set var="linea4" value="<div class='table-responsivetable'>"/>${linea4}
            <c:set var="linea4" value="<table class='table table-striped table-striped table-bordered' id='TablapermisosUsuarios' style='background: #0C1F32'>"/>${linea4}
            <c:set var="linea4" value="<thead>"/>${linea4}
            <c:set var="linea4" value="<tr>"/>${linea4}
            <c:set var="linea4" value="<th nowrap WIDTH='15'>#</th>"/>${linea4}
            <c:set var="linea4" value="<th nowrap WIDTH='450'>Nombre</th>"/>${linea4}
            <c:set var="linea4" value="<th>Asignar</th>"/>${linea4}
            <c:set var="linea4" value="</tr></thead><tbody>"/>${linea4}
            <c:forEach var="i" begin="0" end="${fn:length(nomper)-1}">
                <c:set var="linea3" value="<tr>" />${linea3}<c:set var="contador" value="${i+1}" />
                <c:set var="lineax" value="<td>" />${lineax}
                ${contador}
                <c:set var="lineay" value="</td>" />${lineay}
                <c:set var="linea4" value="<td>" />${linea4}
                <c:out value="${nomper[i]}"></c:out>
                <c:set var="linea5" value="</td>" />${linea5}
                <c:set var="linea4" value="<td>" />${linea4}
                <c:set var="validaSelec" value="${fn:length(idpermisos)}" />
                <c:set var="existeSeleccion" value="n" />
                <c:if test="${validaSelec > 0}">
                    <c:forEach var="j" begin="0" end="${fn:length(idpermisos)-1}">
                        <c:if test="${idpermisos[j] == idp[i]}">
                            <c:set var="existeSeleccion" value="s" />
                        </c:if> 
                    </c:forEach> 
                </c:if>    
                <c:if test="${existeSeleccion eq 's'}">
                    <input type="checkbox" checked id="op${idp[i]}" name="op${idp[i]}" value="${idp[i]}">  
                </c:if>
                <c:if test="${existeSeleccion eq 'n'}">
                    <input type="checkbox" id="op${idp[i]}" name="op${idp[i]}" value="${idp[i]}">  
                </c:if>    
                <c:set var="linea5" value="</td>" />${linea5}
                <c:set var="linea10" value="</tr>" />${linea10}
            </c:forEach>
            <c:set var="linea4" value="</tbody></table><br>
                   </div>"/>${linea4}
        </c:if> 
    </body>
</html>
