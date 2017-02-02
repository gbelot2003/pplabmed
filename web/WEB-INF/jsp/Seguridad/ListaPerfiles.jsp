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
<div class="row">
    <link href="Resources/css/radiotablestyle.css" rel="stylesheet" type="text/css"/>
    <div class="col-md-1"></div>
    <div class="col-md-10" id="pagina">  
        <div class="bs-component">           
            <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
                <a class="close"  onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </a>       
                <div class="panel-heading"><h4>Lista Perfiles</h4></div>
                <div class="panel-body">    
                    <fieldset>
                        <br>
                              <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10">
                                    <input type="hidden" id="tempIdPerfil">                  
                                    <div id="creaNuevo" class="table-responsive">
                                        <div class="form-group">
                                            <c:set var="valida" value="${fn:length(idp)}" />
                                            <c:if test="${valida > 0}"> 
                                                <table id="tablaperfiles" class="table table-striped table-bordered " cellspacing="0" width="100%">
                                                    <thead style="text-align:center;" >
                                                        <tr style="text-align:center; background: #253746; border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px;">
                                                            <th style="text-align:center;">No.</th>
                                                            <th style="text-align:center;">Perfil</th>
                                                            <th style="text-align:center;">Descripción</th>
                                                            <th style="text-align:center;">Estado</th>
                                                            <th style="text-align:center;">Editar</th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="i" begin="0" end="${fn:length(idp)-1}">
                                                            <c:set var="contador" value="${i+1}" />
                                                            <tr>
                                                                <td>${contador}</td>
                                                                <td>${nomperf[i]}</td>
                                                                <td>${desL[i]}</td>
                                                                 <td align="center" style="vertical-align: middle;"> 
                                                                    <div class="switch2">
                                                                       <c:if test="${estL[i] eq 'true'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle" checked onclick="estPerfilEdita('${idp[i]}', '${estL[i]}');">
                                                                        </c:if> 
                                                                        <c:if test="${estL[i] eq 'false'}">
                                                                            <input type="checkbox"  id="Estado" name="toggle" onclick="estPerfilEdita('${idp[i]}', '${estL[i]}');">
                                                                        </c:if>
                                                                        <label for="toggle"><i></i></label>
                                                                        <span></span>
                                                                    </div>
                                                                </td>                                                                                                             
                                                                <td align="center"><a style="cursor:pointer;" onclick="cargaPerfilEdita('${idp[i]}');"><img src="Resources/image/Ver.png" alt="" height="30" width="30"/></a></td>   
                                                            </tr>
                                                        </c:forEach>	
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                </div>                                
                            </div>
                            <div class="col-md-3">
                            </div>     
                            <br/>
                </div>  
                </fieldset>
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
    </div>
</div>
</div>                          
<div class="modal fade" id="editaper" role="dialog"  data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="font-weight:bold;">Actualizar perfil</h4>
            </div>
            <div class="modal-body">
                <div id="cargaPreviaPerfil"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updateperfil();">Actualizar perfil</button>  
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>                                 
<div class="modal fade" id="desacper" role="dialog"  data-backdrop="static" aria-hidden="true" data-toggle="modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="height:650px; overflow-y: auto; resize:vertical;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="font-weight:bold;">Actualizar Perfil</h4>
            </div>
            <div class="modal-body" style="overflow-y: auto;">
                <div id="cargaPreviaPerfil"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="updateperfil();">Actualizar perfil</button>  
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
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
