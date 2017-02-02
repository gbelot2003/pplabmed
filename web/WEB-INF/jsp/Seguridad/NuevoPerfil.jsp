<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-3"></div>
<div class="col-md-6" id="pagina" style="/* background-color: black; */">
       <div class="bs-component">
        <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
            <button type="button" class="btn btn-primary close" onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </button>
            <div class="panel-heading"><h4>Agregar Perfil</h4></div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <fieldset>
                        <br>
                        <div class="form-group">
                            <label for="Pefil" class="col-md-2 control-label">Nombre:</label>
                            <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                <input type="text" class="form-control" id="Pefil" name="Pefil" placeholder="Nombre" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Desc" class="col-md-2 control-label">Descripción:</label>
                            <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                <textarea class="form-control" id="Desc" name="Desc" rows="3"></textarea>
                            </div>
                        </div>                 
                        <div class="form-group">
                            <label for="Estado" class="col-md-2 control-label">Estado:</label>
                            <div class="col-md-3">
                                <div class="switch">
                                    <input type="checkbox"  id="Estado" name="toggle" checked>
                                    <label for="toggle"><i></i></label>
                                    <span></span>
                                </div>
                            </div>
                        </div>
                        <br>
                        
                        <aside id="info-block">
                            <section class="file-marker">
                                <div>
                                    <div class="box-title">
                                        Agregar Permisos
                                    </div>
                                    <br>
                                    <br>
                                    <div class="box-contents">
                                        <div id="audit-trail">
                                            <div class="row">  
                                                <c:if test="${!empty listaPermisosArray}">
                                                    <table  id="TablapermisosUsuarios" class="table table-striped" style="width:70%; margin-left: 15%; background-color:#253746">
                                                        <thead style="border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px;">
                                                            <tr style="text-align:center">
                                                                <th>#</th>
                                                                <th>Nombre</th>
                                                                <th style="text-align:center">Asignar</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:set var="contador" value="${0}" />
                                                            <c:forEach items="${listaPermisosArray}" var="Permiso">
                                                                <c:set var="contador" value="${contador+1}" />
                                                                <tr scope="row">
                                                                    <td>${contador}</td>
                                                                    <td><c:out value="${Permiso.getNombre()}" /></td>
                                                                    <td style="text-align:center"><input type="checkbox" value="${Permiso.getIdtblpermisos()}" id="${Permiso.getIdtblpermisos()}" name="${Permiso.getIdtblpermisos()}"/></td>                          
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>     
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </aside>
                        
                        
                        <br>
                    </fieldset>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <div id="permisosAsignados"></div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </form>  
            </div>
            <div class="panel-footer">
                <div  class="col-md-8"></div>
                <button  id="btn-salir" type="button" class="btn btn-default" data-dismiss="modal" onclick="cargarContenido('vacio.htm', 'contenido');">Salir</button>
                <button id="btn-guardar" type="button" class="btn btn-primary" onclick="guardarPerfil();">Guardar</button>
                <br>    
            </div> 
        </div>
    </div>
    <div id="creaNuevo" class="col-md-1"></div>  
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