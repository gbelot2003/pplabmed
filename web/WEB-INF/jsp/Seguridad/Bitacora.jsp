<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-3"></div>
<div class="col-md-6" id="pagina" style="/* background-color: black; */">
    <link href="Resources/css/radiostyle.css" rel="stylesheet" type="text/css"/>
    <div class="well bs-component">
        <form class="form-horizontal">
            <fieldset>
                <legend>Bitácora<div class="row" style="border-top: 1px dotted #c5daea;display: block;margin: 10px 0;"></div></legend>
                <div class="form-group">
                        <div>
                        <label for="FechainicRepo" class="col-md-2 form-control-label" style="padding-top: 7px; padding-right: 2px;" >Fecha Inicial:</label>
                        <div class="col-md-4" style="padding-left: 2px; padding-right: 2px;">
                            <input type="date" class="form-control" id="FechaInicRepo" name="FechainicRepo" placeholder="" >
                        </div>
                        </div>
                        <div>
                            <label for="Orden2" style="padding-top: 7px;padding-center: 2px; padding-right: 2px;" class="col-md-2">Fecha Final:</label>                            
                             <div class="col-md-4" style="padding-left: 2px; padding-right: 2px;">
                                 <input type="date" class="form-control" id="FechaFinRepo" name="FechaFinRepo" placeholder="" >
                            </div>
                        </div>
                    </div>
                     <div class="form-group">
                        <table  id="TablaBitacora" style="width:70%;">
                            <tr>
                                <th>No.</th>
                                <th>Evento</th> 
                                <th>&nbsp;Descripción&nbsp;&nbsp;</th>
                                <th>Usuario</th>
                                <th>Fecha</th>
                                <th width="60"></th>
                                <th width="60"></th>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="1" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Evento" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Descripción" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Usuario" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Fecha" ></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="2" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Evento" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Descripción" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Usuario" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Fecha" ></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="3" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Evento" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Descripción" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Usuario" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Fecha" ></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="4" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Evento" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Descripción" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Usuario" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Fecha" ></td>
                            </tr>
                            <tr>
                               <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="5" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Evento" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Descripción" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Usuario" ></td>
                                <td><input type="text" class="form-control" id="Otros" name="Otros" placeholder="Fecha" ></td>
                            </tr>
                        </table>
                    </div> 
                 <br>
              
            </fieldset>
        </form>  
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