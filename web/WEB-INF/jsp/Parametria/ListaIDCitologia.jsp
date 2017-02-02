<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="pagina">
        <div class="bs-component">  
            <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">   
                <a class="close"  onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </a>       
                <div class="panel-heading"><h4>Lista ID-Citologias</h4></div>
                <div class="panel-body"> 
                          <fieldset>
                                <br/>
                                <div class="col-md-1"></div>
                                <div class="row" style="font-family:Helvetica">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <c:if test="${!empty listacatcitologia}">
                                                <table  id="TablaCatCitologia"  style="font-family:Georgia;" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr style="text-align:center; background: #253746; border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px;">
                                                            <th style="text-align:center">No.</th>
                                                            <th style="text-align:center">Nombre</th>
                                                            <th style="text-align:center">Estado</th>                                  
                                                            <th style="text-align:center">Editar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="previous pager">
                                                        <c:set var="contador" value="${0}" />
                                                        <c:forEach items="${listacatcitologia}" var="Catcitologia">
                                                            <c:set var="contador" value="${contador+1}" />
                                                            <tr  scope="row">
                                                                <td>${contador}</td>
                                                                <td><c:out value="${Catcitologia.getNombre()}" /></td>
                                                                <td align="center"> 
                                                                    <div class="switch2">
                                                                        <c:if test="${Catcitologia.isEstado() eq 'true'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle" checked onclick="estadoCatCitologiaEdit('${Catcitologia.getIdtblcatcitologias()}', '${Catcitologia.isEstado()}');" style="cursor:pointer;">
                                                                        </c:if> 
                                                                        <c:if test="${Catcitologia.isEstado() eq 'false'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle"  onclick="estadoCatCitologiaEdit('${Catcitologia.getIdtblcatcitologias()}', '${Catcitologia.isEstado()}');">
                                                                        </c:if>
                                                                        <label for="toggle"><i></i></label>
                                                                        <span></span>
                                                                    </div>
                                                                </td>
                                                                <!--<c:if test="${Catcitologia.isEstado()}">
                                                                    <td align="center"><img src="Resources/image/desactivar.png" alt="" width="40" onclick="estadoCatCitologiaEdit('${Catcitologia.getIdtblcatcitologias()}', '${Catcitologia.isEstado()}');" style="cursor:pointer;"/></td>
                                                                </c:if>
                                                                <c:if test="${!Catcitologia.isEstado()}">
                                                                <td align="center"><img src="Resources/image/activar.png" alt="" width="40" onclick="estadoCatCitologiaEdit('${Catcitologia.getIdtblcatcitologias()}', '${Catcitologia.isEstado()}');" style="cursor:pointer;"/></td>
                                                                </c:if>-->
                                                                <td align="center"><img src="Resources/image/Ver.png" style="cursor:pointer;" onclick="cargaInfoCatCitologia(${Catcitologia.getIdtblcatcitologias()})" alt="" height="30" width="30"/></td>                       
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
                        </section>
                    </aside>
                </div>
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
<div class="modal fade" id="editcatcitologia" role="dialog"  data-backdrop="static" aria-hidden="true" data-toggle="modal">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="font-weight:bold;" >Actualizar Area</h4>
            </div>
            <div class="modal-body" style="height:200px; overflow-y: auto;" >
                <div id="cargaPreviaCatCitologia"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updateCatCitologia();">Actualizar Area</button>  
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



