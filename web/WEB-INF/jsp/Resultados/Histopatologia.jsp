<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div id="pagina">
    <div class="bs-component">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default" style="box-shadow:0 5px 15px rgba(0, 0, 0, 0.5);">
                    <button type="button" class="btn btn-primary close" onclick="cargarContenido('vacio.htm', 'contenido');" >&times; </button>
                    <div class="panel-heading">
                        <h4>Agregar Histopatología</h4>
                    </div>
                    <div class="panel-body">
                      <div class="col-md-12">
                        <form id="HistopatologiaForm" class="form-horizontal" method="POST" role="form">
                          <fieldset class="col-md-12">
                              <input type="hidden" id="code" value="${codigo}">

                              <div class="row">
                                  <div class="col-md-2">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Nofactura" class="control-label">No.Factura</label>
                                              <input type="text" class="form-control" id="Nofactura" name="Nofactura" placeholder="No Factura" >
                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-8">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Paciente" class="control-label">Paciente:</label>
                                              <input type="text" class="form-control" id="Paciente" name="Paciente" placeholder="Paciente" disabled>
                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-2">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Edad" class=" control-label">Edad:</label>
                                              <input type="text" class="form-control" id="Edad" name="Edad" placeholder="Edad" disabled>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-2">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                          <label for="Corr" class="control-label">Corr:</label>
                                              <input type="text" class="form-control" id="Corr" name="Orden1" placeholder="Correo" disabled>
                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-8">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Direccion" class=" control-label">Dirección:</label>
                                              <input type="text" class="form-control" id="Direccion" name="Direccion" placeholder="Dirección" disabled>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-2">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Sexo" class=" control-label">Sexo:</label>
                                              <input type="text" class="form-control" id="Sexo" name="Sexo" placeholder="sexo" disabled >
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-7">
                                      <!-- placeholdar -->
                                  </div>

                                  <div class="col-md-5">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Medico" class="control-label">Médico:</label>
                                              <input type="text" class="form-control" id="Medico" name="Medico" placeholder="Medico" disabled>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-3">
                                  </div>
                              </div>
                              <!-------------Campos HANSA --------------->

                              <div class="row">
                                  <hr class="white-hr">

                                  <div class="col-md-10">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="DiagnosticoClinico" class="control-label">Diagnóstico Clínico:</label>
                                              <input type="text" class="form-control" id="DiagnosticoClinico" name="DiagnosticoClinico" placeholder="Diagnóstico Clínico" >
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-2">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Mor1" class="control-label">MOR1:</label>
                                              <input type="text" class="form-control" id="Mor1" name="Mor1" placeholder="MOR1" >
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-10">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Muestra" class="control-label">Muestra:</label>
                                              <input type="text" class="form-control" id="Muestra" name="Muestra" placeholder="Muestra" >
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-2">
                                      <div class="form-group">

                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Mor2" class=" control-label">MOR2:</label>
                                              <input type="text" class="form-control" id="Mor2" name="Mor2" placeholder="MOR2" >
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                      <div class="col-md-4">
                                           <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Finforme" class="control-label">Fecha Informe:</label>
                                              <input type="date" class="form-control" id="Finforme" name="Finforme">
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                           <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Firma1" class="control-label">Firma 1:</label>
                                              <!-- <input type="search" class="form-control" id="Firma1" name="Firma1" placeholder="" > -->
                                              <select id="Firma1" name="Firma1" class="form-control"><option value="0">Seleccionar</option>
                                                  <c:forEach items="${ListaFirmas}" var="Firmasmedicos">
                                                      <option value="${Firmasmedicos.getIdtblfirmamed()}">${Firmasmedicos.getNombre()}</option>
                                                  </c:forEach>
                                              </select>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                               <label for="TOPOG" class="control-label">TOPOG :</label>
                                              <input type="text" class="form-control" id="TOPOG" name="TOPOG" placeholder="TOPOG">
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-4">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="FBiopsia" class="control-label">Fecha Biopsia:</label>
                                              <input type="date" class="form-control" id="FBiopsia" name="FBiopsia" placeholder="" >
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Firma2" class="control-label">Firma 2:</label>
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
                                          <div class="col-md-11" style="padding-left: 2px; padding-right: 2px;">
                                               <label for="FMuestra" class="control-label">Fecha Muestra:</label>
                                              <input type="date" class="form-control" id="FMuestra" name="FMuestra" placeholder="" >
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="DescMacro" class="control-label">Descripción Macroscopica:</label>
                                              <textarea class="form-control" id="DescMacro" name="DescMacro" rows="5"></textarea>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="DescMicro" class=" control-label">Descripción Microscopica:</label>
                                              <textarea class="form-control" id="DescMicro" name="DescMicro" rows="5"></textarea>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="form-group">
                                          <div class="col-md-12" style="padding-left: 2px; padding-right: 2px;">
                                              <label for="Diagnostico:" class=" control-label">Diagnóstico:</label>
                                              <textarea class="form-control" id="Diagnostico" name="Diagnostico:" rows="5"></textarea>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <hr class="white-hr">
                              <div class="col-md-12">
                                <div style="position:relative">
                                  <img width="100%" src="Resources/image/Logo.jpg" alt=""/>
                                </div>
                              </div>
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

                    </div>
                    <div class="panel-footer">
                        <div  class="col-md-10"></div>
                        <button  id="btn-salir" type="button" class="btn btn-default" data-dismiss="modal" onclick="cargarContenido('vacio.htm', 'contenido');">Salir</button>
                        <button id="btn-guardar" type="button" class="btn btn-primary" onclick="guardarHistopatologia();">Guardar</button>
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
