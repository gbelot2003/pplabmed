<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
               
            </button>
             <a class="navbar-brand" href="#"  onclick="cargarContenido('vacio.htm', 'contenido');">PIFPatología</a>
            </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Resultados<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('citologia.htm', 'contenido');$('#processing-modal').modal('hide');">Citología</a></li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('histopatologia.htm', 'contenido');$('#processing-modal').modal('hide');">Histopatología</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" onclick="$('#processing-modal').modal('show');cargarContenido('Patologia.htm', 'contenido');$('#processing-modal').modal('hide');">Estadística Patología</a>               

                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" onclick="$('#processing-modal').modal('show');cargarContenido('BuscarReportes.htm', 'contenido');$('#processing-modal').modal('hide');">Hojas de Trabajo</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Seguridad y Usuarios <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Perfiles</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('Pefiles.htm', 'contenido');$('#processing-modal').modal('hide');">Crear Perfiles</a></li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('ListaPerfiles.htm', 'contenido');$('#processing-modal').modal('hide');">Lista Perfiles</a></li>            
                        <li class="divider"></li>
                        <li class="dropdown-header">Usuarios</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('NuevoUsuario.htm', 'contenido');$('#processing-modal').modal('hide');">Crear Usuario</a></li>            
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('ListaUsuarios.htm', 'contenido');$('#processing-modal').modal('hide');">Lista Usuario</a></li>                 
                        <li class="divider"></li>
                        <li class="dropdown-header">Bitacora</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('Bitacora.htm', 'contenido');$('#processing-modal').modal('hide');">Reporte de Actividad</a></li>            
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Parametrizaciones<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Áreas</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('NuevaArea.htm', 'contenido');$('#processing-modal').modal('hide');">Agregar Nueva Área</a></li>          
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('ListadoDeAreas.htm', 'contenido');$('#processing-modal').modal('hide');">Lista de Áreas</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Firmas</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('NuevaFirma.htm', 'contenido');$('#processing-modal').modal('hide');">Agregar Firma</a></li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('listaFirmas.htm', 'contenido');$('#processing-modal').modal('hide');">Listar Firmas</a></li>    
                        <li class="divider"></li>
                        <li class="dropdown-header">ID Citología</li>
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('idCito.htm', 'contenido');$('#processing-modal').modal('hide');">Agregar ID Citología</a></li>             
                        <li><a href="#" onclick="$('#processing-modal').modal('show');cargarContenido('ListaIDCitologia.htm', 'contenido');$('#processing-modal').modal('hide');">Lista ID Citología</a></li>
                    </ul>
                </li>              
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Usuario <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="CambiarPassw.htm">Cambiar contraseña</a></li>
                        <li class="divider"></li>
                        <li><a href="Logout.htm">Cerrar Session</a></li>
                    </ul>
                </li>
            </ul>
      </div>
  </div>
</nav>

