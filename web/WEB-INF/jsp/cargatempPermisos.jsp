<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <body>
        <input type="hidden" id="resp" name="resp" value="${resp}">
        <c:set var="valida" value="${fn:length(nomper)}" />
        <c:if test="${valida > 0}">

            <c:set var="linea4" value="<div class='table-responsive'>"/>${linea4}
            <c:set var="linea4" value="<table class='table table-striped table-striped table-bordered' style='background: #0C1F32' id='TablapermisosUsuarios'>"/>${linea4}
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
                <input type="checkbox" id="op${idp[i]}" name="op${idp[i]}" value="${idp[i]}">
                <c:set var="linea5" value="</td>" />${linea5}
                <c:set var="linea10" value="</tr>" />${linea10}
            </c:forEach>
            <c:set var="linea4" value="</tbody></table><br>
                   </div>"/>${linea4}
        </c:if>

    </body>
</html>
