<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <label for="Nombre" class="col-md-2 form-control-label">Nombre:</label>
                        <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="" value="${nombre}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="Correo" class="col-md-2 form-control-label">Correo:</label>
                        <input type="text" class="form-control" id="Correo" name="Correo" placeholder="" value="${correo}" disabled>                        
                    </div>
                </div>
            </div> 
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="Area" class="col-md-2 form-control-label">Área:</label>
                        <select id="Area" name="Area" class="form-control">
                            <option value="0">Seleccionar</option>
                            <c:forEach items="${listaAreas}" var="Area">
                                <c:if test="${Area.getIdtblarea() == area}">
                                    <option value="${Area.getIdtblarea()}" selected>${Area.getNombre()}</option>
                                </c:if>
                                <c:if test="${Area.getIdtblarea() != area}">
                                    <option value="${Area.getIdtblarea()}">${Area.getNombre()}</option>
                                </c:if>    
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
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
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="Estado" class="col-md-2 form-control-label">Acesos:</label>
                        <div data-toggle="buttons">
                            <c:if test="${web eq 'true'}">
                                <input  type="checkbox" id="WebApp" name="WebApp" checked>&nbsp;Web App&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${web eq 'false'}">
                                <input  type="checkbox" id="WebApp" name="WebApp" >&nbsp;Web App&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${mobile eq 'true'}">
                                <input  type="checkbox" id="MobileApp" name="MobileApp" checked>&nbsp;App Mobile
                            </c:if>
                            <c:if test="${mobile eq 'false'}">
                                <input  type="checkbox" id="MobileApp" name="MobileApp" >&nbsp;App Mobile
                            </c:if>
                        </div>
                    </div>
                </div>
            </div> 
        <h3 class="text-center">Perfiles asignados</h3>
        <c:if test="${!empty listaPerfiles}">
        <table  id="TablaUsuarios" class="table table-striped table-striped table-bordered" style="background: #0C1F32; width:70%; margin-left: 15%;">
            <thead>
                <tr style="text-align:center">
                    <th style="text-align:center">No.</th>
                    <th style="text-align:center">Tipo</th>
                    <th style="text-align:center">Descripción</th>
                    <th style="text-align:center">Asignar</th>  
                </tr>
            </thead>
            <tbody>
            <c:set var="contador" value="${0}" />
            <c:forEach items="${listaPerfiles}" var="Perfil">
                <c:set var="contador" value="${contador+1}" />
                <tr scope="row">
                    <td>${contador}</td>
                    <td><c:out value="${Perfil.getNombreperfil()}" /></td>
                    <td><c:out value="${Perfil.getDescripcion()}" /></td>
                    <c:if test="${listaasignada.contains(Integer.toString(Perfil.getIdtblperfiles()))}">
                        <td style="text-align:center"><input type="checkbox" value="${Perfil.getIdtblperfiles()}" onclick="agregaralista(this.value, '#asignados');" checked/></td>                          
                    </c:if>
                    <c:if test="${!listaasignada.contains(Integer.toString(Perfil.getIdtblperfiles()))}">
                        <td style="text-align:center"><input type="checkbox" value="${Perfil.getIdtblperfiles()}" onclick="agregaralista(this.value, '#asignados');" /></td>                          
                    </c:if>                
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </c:if>
        <input type="hidden" name="asignados" value="${perfilesAsig}" id="asignados"/>
        <input type="hidden" name="originales" value="${perfilesAsig}" id="originales"/> 
    </body>
</html>
