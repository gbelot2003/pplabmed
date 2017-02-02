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
    <body>
            <div class="row">
                <div  class="col-md-1"></div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="Nombre">Nombre:</label>
                        <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="" value="${Nombre}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div  class="col-md-1"></div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="Codigo">Código:</label>
                        <input type="text" class="form-control" id="Codigo" name="Codigo" placeholder="" value="${Codigo}">
                        
                    </div>
                </div>
            </div>           
             <div class="row">
                  <div  class="col-md-1"></div>
                   <div class="col-md-8">
                     <div class="form-group">
                        <label for="Estado" class="col-md-2 form-control-label">Estado:</label>
                        <c:if test="${estado eq 'true'}">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default active">
                                    <input type="radio" name="Estado" id="Estado" autocomplete="off" value="Activo" checked> Activo
                                </label>
                                <label class="btn btn-default ">
                                    <input type="radio" name="Estado" id="Estado" autocomplete="off" value="Inactivo"> Inactivo
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${estado eq 'false'}">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default ">
                                    <input type="radio" name="Estado" id="Estado" autocomplete="off" value="Activo" > Activo
                                </label>
                                <label class="btn btn-default active">
                                    <input type="radio" name="Estado" id="Estado" autocomplete="off" value="Inactivo" checked> Inactivo
                                </label>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
                        
                        
                        
    </body>
</html>
