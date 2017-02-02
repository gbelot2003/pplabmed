<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="pagina">
        <div class="bs-component">
            <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">   
                <a class="close"  onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </a>       
                <!-- <button type="button" class="close"  st onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </button>-->
                <div class="panel-heading"><h4>Lista Áreas</h4></div>
                <div class="panel-body">  
                            <fieldset>
                                <br/>
                                <div class="col-md-1"></div>         
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <c:if test="${!empty listaArea}">
                                            <table  id="TablaAreas"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr style="text-align:center; background: #253746; border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px;">
                                                        <th style="text-align:center">No.</th>
                                                        <th style="text-align:center">Nombre</th>
                                                        <th style="text-align:center">Estado</th>                                  
                                                        <th style="text-align:center">Editar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="contador" value="${0}" />
                                                    <c:forEach items="${listaArea}" var="Area">
                                                        <c:set var="contador" value="${contador+1}" />
                                                        <tr  scope="row">
                                                            <td>${contador}</td>
                                                            <td><c:out value="${Area.getNombre()}" /></td>
                                                            <td align="center" style="vertical-align:middle;"> 
                                                                <div class="switch2">
                                                                    <c:if test="${Area.isEstado() eq 'true'}">
                                                                        <input type="checkbox"  id="Estado" name="toggle" checked onclick="estAreaEdit('${Area.getIdtblarea()}', '${Area.isEstado()}');">
                                                                    </c:if> 
                                                                    <c:if test="${Area.isEstado() eq 'false'}">
                                                                        <input type="checkbox"  id="Estado" name="toggle" onclick="estAreaEdit('${Area.getIdtblarea()}', '${Area.isEstado()}');">
                                                                    </c:if>
                                                                    <label for="toggle"><i></i></label>
                                                                    <span></span>
                                                                </div>
                                                            </td>
                                                            <td align="center"><img src="Resources/image/Ver.png" style="cursor:pointer;" onclick="cargaInfoArea(${Area.getIdtblarea()})" alt="" height="25" width="25"/></td>                       
                                                        </tr>
                                                    </c:forEach>    
                                                </tbody>
                                            </table>
                                        </c:if>
                                        <input type="hidden" id="tempId">
                                    </div>
                                </div>                
                                </div> 
                                <br/>
                            </fieldset>
                        <div class="panel-footer">
                        <div class="col-md-8"></div>
                        <!--<button  id="btn-salir" type="button" class="btn btn-default" data-dismiss="modal" onclick="cargarContenido('vacio.htm', 'contenido');">Salir</button>-->
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>  
    <div class="modal fade" id="editaarea" role="dialog"  data-backdrop="static" aria-hidden="true" data-toggle="modal">
        <div class="modal-dialog modal-lg" >
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-weight:bold;" >Actualizar Area</h4>
                </div>
                <div class="modal-body" style="height:200px; overflow-y: auto;" >
                    <div id="cargaPreviaArea"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateArea();">Actualizar Area</button>  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>  
    <div id="tempId">  
    </div>
    <div class="modal modal-static fade" data-keyboard="false" data-backdrop="static" id="processing-modal" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center">
                        <img src="Resources/image/cargando2.gif" class="icon" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>



