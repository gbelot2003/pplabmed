<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-3"></div>
<div class="col-md-6" id="pagina" style="/* background-color: black; */">
    <div class="bs-component">
        <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
            <button type="button" class="btn btn-primary close" onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </button>
            <div class="panel-heading"><h4>Agregar Usuario</h4></div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label for="Nombre" class="col-md-2 control-label">Nombre:</label>
                            <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="Nombre" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Correo" class="col-md-2 control-label">Correo Electrónico:</label>
                            <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                <input type="text" class="form-control" id="Correo" name="Correo" placeholder="E-mail" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Area" class="col-md-2 control-label">Área:</label>
                            <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                <select id="Area" name="Area" class="form-control"><option value="0">Seleccionar Área</option>
                                    <c:forEach items="${listaAreas}" var="Area">
                                        <option value="${Area.getIdtblarea()}">${Area.getNombre()}</option>
                                    </c:forEach>
                                </select>
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
                        <div class="form-group">
                            <label for="Webapp" class="col-md-2 control-label">Acesos:</label>
                            <div>
                                <input  type="checkbox" id="WebApp" name="WebApp" ><label class="control-label" style="font-weight: normal;" for="WebApp">&nbsp;Web App&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</label>
                                <input  type="checkbox" id="MobileApp" name="MobileApp" class="control-label" ><label class="control-label" style="font-weight: normal;" for="MobileApp">&nbsp;App Mobile</label>
                            </div>
                        </div>
                        <br>
                        <aside id="info-block">
                            <section class="file-marker">
                                <div>
                                    <div class="box-title">
                                        Agregar Perfil
                                    </div>
                                    <div class="box-contents">
                                        <div id="audit-trail">
                                            <div class="row"> 
                                                <br>
                                                <c:if test="${!empty listaPerfiles}">
                                                    <table  id="TablaUsuarios" class="table-bordered table-striped table" style="width:70%; margin-left: 15%;background-color:#253746">
                                                        <thead style="border-bottom: 3px solid #ccc;margin: 0 15px; font-weight:14px">
                                                            <tr>
                                                                <th style="text-align:left">No.</th>
                                                                <th style="text-align:left">Tipo</th>
                                                                <th style="text-align:left">Descripción</th>
                                                                <th style="text-align:left">Asignar</th>  
                                                            </tr>
                                                        </thead>
                                                        <tbody >
                                                            <c:set var="contador" value="${0}" />
                                                            <c:forEach items="${listaPerfiles}" var="Perfil">
                                                                <c:set var="contador" value="${contador+1}" />
                                                                <tr scope="row">
                                                                    <td>${contador}</td>
                                                                    <td><c:out value="${Perfil.getNombreperfil()}" /></td>
                                                                    <td><c:out value="${Perfil.getDescripcion()}" /></td>
                                                                    <td style="text-align:center"><input type="checkbox" value="${Perfil.getIdtblperfiles()}" onclick="agregaralista(this.value, '#asignados');"/></td>                          
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                                <br>
                                                <input type="hidden" name="asignados" value="${originales}" id="asignados"/>
                                                <input type="hidden" name="originales" value="${originales}" id="originales"/> 
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
                <button id="btn-guardar" type="button" class="btn btn-primary" onclick="guardarUsuario();">Guardar</button>
                <br>    
            </div> 
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