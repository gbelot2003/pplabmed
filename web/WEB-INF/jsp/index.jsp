<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PIF Patologia</title>
       
        <link href="Resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <link href="Resources/bootstrap/css/bootstrap_superhero.min.css" rel="stylesheet" type="text/css"/>
        <link href="Resources/bootstrap/css/bootstraplogin.min.css" rel="stylesheet" type="text/css"/>
        <link href="Resources/bootstrap/css/bootstrap_superhero.min.css" rel="stylesheet" type="text/css"/>
        <link href="Resources/css/LoginStyle.css" rel="stylesheet" type="text/css"/>
        </head>
    <body alt="full screen background image" background="Resources/image/loginbackground.jpg" style ="background-size: 100% 100%; background-repeat: no-repeat;" class="login2">
       <div class = "pull-right">
            <div class="login-wrapper">
                <br>
                <br>                
                 <h1 style="margin-top:5%">
                        <img src ="<c:url value='Resources/image/Logo.jpg'/>" alt="Logo" class="img-responsive center-block"  width="400" style="-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);">
                  </h1>
                <div style="margin-top: 3em; margin-bottom: 5em; margin-left: 8em; margin-right: 8em;">
                  <div class="panel" style = "border-color: #222222; background-color:#222222; -webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);" >
                    <div class="panel-heading" style = "background-color:#222222; border-color: #222222; color: white; font-weight: bold; text-align: center; margin-top:5%">
                        <h1>PIF Patología</h1>
                    </div>   
                   
                        <div class="panel-body">
                            <form id="loginform" class="form-horizontal" role="form" action="inicio.htm" method="POST">
                            <div style="margin-bottom: 5px" class="input-group loginaling">
                                <span class="input-group-addon"><i id="iconouser" class="glyphicon glyphicon-user" style="color: #DF691A;"></i></span>
                                <input id="login-username" type="text" class="form-control schooltooltip" name="usernamelog" placeholder="Nombre de usuario" data-toggle="tooltip" title="Usuario">                                        
                            </div>
                            <div style="margin-bottom: 25px" class="input-group loginaling">
                                <span class="input-group-addon"><i id="iconopassw" class="glyphicon glyphicon-lock" style="color: #DF691A;"></i></span>
                                <input id="login-password" type="password" class="form-control schooltooltip" name="passwordlog" placeholder="Contraseña" data-toggle="tooltip" title="Ingresar contraseña">
                            </div>
                            <div style="margin-top:15px" class="form-group">
                                <div class="col-sm-12 controls">
                                    <a id="btn-login" href="principal.htm" class="btn btn-lg btn-block mybtn-primary" style="color:white;">Ingresar</a>     
                                 </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 1px solid#888; padding-top:15px;" >
                                        <a href="#" onClick="$('#loginbox').hide(); $('#requestPassword').show()" class="pull-right" style="color:white; text-decoration:none;">
                                        ¿Olvido su contraseña?
                                        </a>                                    
                                    </div>
                                </div>
                           </div>
                         </form> 
                        </div>  
                     </div>
                </div>
              </div>  
            </div> 
        <script src="Resources/js/jquery-1.12.4.min.js" type="text/javascript"></script>
        <script src="Resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>     
    </body>
</html>