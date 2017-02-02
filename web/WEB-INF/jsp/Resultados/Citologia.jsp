<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-2"></div>
<div id="pagina" style="/* background-color: black; */">
    <div class="bs-component">
        <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
            <button type="button" class="close" onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </button>
            <div class="panel-heading"><h4>Agregar Citología</h4></div>
            <div class="row">
                <div class="col-md-10 col-md-offset-2">
                                <div class="panel-body">
                <form id="CitologiaForm" class="form-horizontal" method="POST" role="form">
                    <fieldset>
                        <div class="row">
                            <br/>
                            <!-- campos hansa -->
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="IdFactura" class="col-md-4 control-label">No.Factura:</label>
                                    <div class="col-md-3" style="padding-left: 2px; padding-right: 2px;">

                                        <input type="text" class="form-control" id="IdFactura" name="IdFactura" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="Paciente" class="col-md-2 control-label">Paciente:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Paciente" name="Paciente" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="Edad" class="col-md-3 control-label">Edad:</label>
                                    <div class="col-md-2" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Edad" name="Edad" placeholder="" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="Corr" class="col-md-3 control-label">Corr:</label>
                                    <div class="col-md-8" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="email" class="form-control" id="Corr" name="Orden1"  placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="Direccion" class="col-md-2 control-label">Dirección:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Direccion" name="Direccion" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="Sexo" class="col-md-3 control-label">Sexo:</label>
                                    <div class="col-md-2" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Sexo" name="Sexo" placeholder="" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="Medico" class="col-md-2 control-label">Médico:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Medico" name="Medico" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                            </div>
                        </div>
                        <!-- campos hansa -->

                        <div class="row">
                            <hr style="border: 1px solid #C6C8CA;"/>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <div style="padding-left: 15px; padding-right: 2px;">
                                        <input type="checkbox" id="DetCancer"  name="DetCancer" style="margin-left: 5px;" class="control-label"> <label class="control-label" for="DetCancer">Detección del Cancer</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <div style="padding-left: 2px; padding-right: 2px;">
                                        <input type="checkbox" id="IndMaduracion" name="IndMaduracion" class="control-label"> <label class="control-label" for="IndMaduracion" >Indice de Maduración</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Otros" class="col-md-3 control-label">Otros:</label>
                                    <div class="col-md-6" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Otros" name="Otros" placeholder="" >
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">  
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="Diagnostico" class="col-md-1 control-label">Diagnóstico Clínico:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Diagnostico" name="Diagnostico" placeholder="" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="FUR" class="col-md-3 control-label">F.U.R.:</label>
                                    <div class="col-md-7" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="FUR" name="FUR" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="FUP" class="col-md-3 control-label">F.U.P:</label>
                                    <div class="col-md-7" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="texto" class="form-control" id="FUP" name="FUP" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TOPOG" class="col-md-4 control-label">Gravidad :</label>
                                    <div class="col-md-5" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="TOPOG" name="TOPOG" placeholder="" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Para" class="col-md-3 control-label">Para:</label>
                                    <div class="col-md-7" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Para" name="Para" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Abortos" class="col-md-3 control-label">Abortos:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="number" class="form-control" id="Abortos" name="Abortos" placeholder="" value ="0" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="idcito" class="col-md-3 control-label">ID Cito:</label>
                                    <div class="col-md-7" style="padding-left: 2px; padding-right: 2px;">
                                        <select id="idcatcito" name="idcatcito" class="form-control"><option value="0">Seleccionar</option>
                                            <c:forEach items="${ListaCatCito}" var="CatCitologia">
                                                <option value="${CatCitologia.getIdtblcatcitologias()}">${CatCitologia.getNombre()}</option>
                                            </c:forEach>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Firma1" class="col-md-3 control-label">Firma 1:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <select id="Firma1" name="Firma1" class="form-control"><option value="0">Seleccionar</option>
                                            <c:forEach items="${ListaFirmas}" var="Firmasmedicos">
                                                <option value="${Firmasmedicos.getIdtblfirmamed()}">${Firmasmedicos.getNombre()}</option>
                                            </c:forEach>                            
                                        </select>
                                        <!--<input type="search" class="form-control" id="Firma1" name="Firma1" placeholder="" >-->
                                    </div>
                                </div>                    
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="FechaInforme" class="col-md-3 control-label">Fecha Informe:</label>
                                    <div class="col-md-5" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="date" class="form-control" id="FechaInforme" name="FechaInforme" placeholder=""  >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Otros2" class="col-md-3 control-label">Otros:</label>
                                    <div class="col-md-7" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="text" class="form-control" id="Otros2" name="Otros2" placeholder="" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Firma2" class="col-md-3 control-label">Firma 2:</label>
                                    <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                        <!-- <input type="search" class="form-control" id="Firma2" name="Firma2" placeholder="" >-->
                                        <select id="Firma2" name="Firma2" class="form-control"><option value="0">Seleccionar</option>
                                            <c:forEach items="${ListaFirmas}" var="Firmasmedicos">
                                                <option value="${Firmasmedicos.getIdtblfirmamed()}">${Firmasmedicos.getNombre()}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Fmuestra" class="col-md-3 control-label">Fecha Muestra:</label>
                                    <div class="col-md-5" style="padding-left: 2px; padding-right: 2px;">
                                        <input type="date" class="form-control" id="Fmuestra" name="Fmuestra" placeholder="" value >
                                    </div>
                                </div>
                            </div>
                        </div>  

                        <div class="col-md-10">
                            <div class="form-group">
                                <label for="DescMacro" class="col-md-1 control-label">Informe:</label>
                                <div class="col-md-9" style="padding-left: 2px; padding-right: 2px;">
                                    <textarea class="form-control" id="DescMacro" name="DescMacro" rows="5"></textarea>
                                </div>
                            </div>
                        </div>                
                        <br>
                        <br>
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
                <div  class="col-md-10"></div>
                <button  id="btn-salir" type="button" class="btn btn-default" data-dismiss="modal" onclick="cargarContenido('vacio.htm', 'contenido');">Salir</button>
                <button id="btn-guardar" type="button" class="btn btn-primary" onclick="guardarCitologia();">Guardar</button>
                <br>    
            </div>  
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