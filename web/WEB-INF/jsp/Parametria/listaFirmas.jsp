<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="pagina">
        <div class="bs-component">
            <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
                <a class="close"  onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </a>       
                <div class="panel-heading"><h4>Lista Áreas</h4></div>
                <div class="panel-body">  
                            <fieldset>
                                <br/>
                                <div class="col-md-1">
                                </div>
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <c:if test="${!empty ListaFirmas}">
                                                <table  id="TablaListaFirmas" class="table table-striped table-bordered"  cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr style="text-align:center; background: #253746; border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px;">
                                                            <th style="text-align:center">No.</th>
                                                            <th style="text-align:center">Nombre</th>
                                                            <th style="text-align:center">Codigo</th>
                                                            <th style="text-align:center">Estado</th>                                  
                                                            <th style="text-align:center">Editar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody >
                                                        <c:set var="contador" value="${0}" />
                                                        <c:forEach items="${ListaFirmas}" var="Firmas">
                                                            <c:set var="contador" value="${contador+1}" />
                                                            <tr  scope="row">
                                                                <td>${contador}</td>
                                                                <td><c:out value="${Firmas.getNombre()}" /></td>
                                                                <td><c:out value="${Firmas.getCodigo()}" /></td>
                                                                <td align="center"> 
                                                                    <div class="switch2">
                                                                        <c:if test="${Firmas.isEstado() eq 'true'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle" checked onclick="estFirmasEdit('${Firmas.getIdtblfirmamed()}', '${Firmas.isEstado()}');">
                                                                        </c:if> 
                                                                        <c:if test="${Firmas.isEstado() eq 'false'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle" onclick="estFirmasEdit('${Firmas.getIdtblfirmamed()}', '${Firmas.isEstado()}');" style="cursor:pointer;">
                                                                        </c:if>
                                                                        <label for="toggle"><i></i></label>
                                                                        <span></span>
                                                                    </div>
                                                                </td>

                                                                <!-- <c:if test="${Firmas.isEstado()}">
                                                                <td align="center"><img src="Resources/image/desactivar.png" alt="" width="40" onclick="estFirmasEdit('${Firmas.getIdtblfirmamed()}', '${Firmas.isEstado()}');" style="cursor:pointer;"/></td>
                                                                </c:if>
                                                                <c:if test="${!Firmas.isEstado()}">
                                                                <td align="center"><img src="Resources/image/activar.png" alt="" width="40" onclick="estFirmasEdit('${Firmas.getIdtblfirmamed()}', '${Firmas.isEstado()}');" style="cursor:pointer;"/></td>
                                                                </c:if>-->
                                                                <td align="center"><img src="Resources/image/Ver.png" style="cursor:pointer;" onclick="cargaInfoFirma(${Firmas.getIdtblfirmamed()})" alt="" height="30" width="30"/></td>                      
                                                            </tr>   
                                                        </c:forEach>    
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <input type="hidden" id="tempId">
                                        </div>
                                    </div>                
                                </div> 
                            </fieldset>
                            </div>
                            <div class="panel-footer">
                                <div class="col-md-8"></div>
                                <!--<button  id="btn-salir" type="button" class="btn btn-default" data-dismiss="modal" onclick="cargarContenido('vacio.htm', 'contenido');">Salir</button>-->
                                <br>
                                <br>
                                <br>
                            </div> 
                            </div>
                            <div class="col-md-1"></div>
                            </div>  
                            </div>
                            <div class="modal fade" id="editafirma" role="dialog"  data-backdrop="static" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" style="font-weight:bold;">Actualizar Firma</h4>
                                        </div>
                                        <div class="modal-body" style="overflow-y: auto;">
                                            <div id="cargaPreviaFirma"></div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" onclick="updateFirma();">Actualizar Firma</button>
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



