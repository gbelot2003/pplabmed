/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pplabmed.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.AreaDAO;
import modelo.dao.PerfilesDAO;
import modelo.dao.UsuarioDAO;
import modelo.dao.UsuarioPorPerfilDAO;
import modelo.pojo.Area;
import modelo.pojo.Perfiles;
import modelo.pojo.Usuarios;
import modelo.util.EnviarCorreo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class userController {
       
    @RequestMapping("/NuevoUsuario.htm")
    public String NuevoUsuario(Model m, HttpServletRequest request){
        AreaDAO areas = new AreaDAO();
        ArrayList<Area> listaAreas = areas.ObtenerAreasEstado(true);
        m.addAttribute("listaAreas", listaAreas);
        PerfilesDAO perfiles = new PerfilesDAO();
        ArrayList<Perfiles> listaPerfiles = perfiles.ObtenerPerfilesEstado(true);
        m.addAttribute("listaPerfiles", listaPerfiles);        
        return "Seguridad/NuevoUsuario";
    }
    
    @RequestMapping("/ListaUsuarios.htm")
    public String ListaUsuarios(Model m, HttpServletRequest request){
        UsuarioDAO usuario = new UsuarioDAO();
        ArrayList<Usuarios> listaUsuario = usuario.ObtenerTodosUsuarios();
        m.addAttribute("listaUsuario", listaUsuario);
        return "Seguridad/ListaUsuarios";
    }
       
    @RequestMapping(value = "cargaVistaUser.htm", method = RequestMethod.POST) 
    public ModelAndView guarda(@RequestParam("idp") int idp) throws Exception {
      ModelAndView mv = new ModelAndView("Seguridad/pgCargaVistaUser");
        UsuarioDAO opc = new UsuarioDAO();
        
        ArrayList<Usuarios> lista = opc.ObtenerUsuario(idp);
        String nombre = "";
        String correo = "";
        //int area = 0;
        boolean estado = true;
        boolean web  = true; 
        boolean mobile = true;
        int area = 0;
        for (Usuarios datos : lista) {
            nombre = datos.getNombre();
            correo = datos.getCorreo();
            estado = datos.isEstado();
            web  = datos.isAccesoweb();
            mobile = datos.isAccesomovil();
            area = datos.getArea().getIdtblarea();
        }
        mv.addObject("nombre",nombre);
        mv.addObject("correo",correo);
        mv.addObject("estado",estado);
        mv.addObject("web",web);
        mv.addObject("mobile",mobile);
        mv.addObject("area", area);
        
        PerfilesDAO perfil = new PerfilesDAO();
        ArrayList<Perfiles> listaperfiles = perfil.ObtenerPerfilesEstado(true);        
        mv.addObject("listaPerfiles",listaperfiles);
        
        
        UsuarioPorPerfilDAO uxp = new UsuarioPorPerfilDAO();
        ArrayList<String> listaasignada = uxp.ObtenerPerfilesUsuario(idp);        
        mv.addObject("listaasignada",listaasignada);
        
        String perfilesAsig = "";
        
            System.out.println("-------------------------------------------------------------");
        for(int i=0; i<listaasignada.size(); i++){
            System.out.println(listaasignada.get(i));
            if(perfilesAsig.equals("")){
                perfilesAsig = listaasignada.get(i);
            }else{
                perfilesAsig = perfilesAsig+"_xk12x_"+listaasignada.get(i);
            }
        }
        
        mv.addObject("perfilesAsig", perfilesAsig);
        
        AreaDAO areas = new AreaDAO();
        ArrayList<Area> listaAreas = areas.ObtenerAreasEstado(true);
        mv.addObject("listaAreas", listaAreas);
        
        
        mv.addObject("resp","No");
      return mv;
    }
    
    @RequestMapping(value="/NuevoUsuario.htm", method = RequestMethod.POST)
    public String InsertNuevoUsuario(Model m, HttpServletRequest request, @RequestParam("Nombre") String nombre, 
            @RequestParam("Correo") String correo, @RequestParam("Area") int area, @RequestParam("Estado") String estado, 
            @RequestParam("WebApp") boolean web, @RequestParam("MobileApp") boolean mobile, @RequestParam("asignados") String asignados){
        
        
        SecureRandom random = new SecureRandom();
        String passw = new BigInteger(130, random).toString(32).substring(0, 6).toUpperCase();
        UsuarioDAO usuario = new UsuarioDAO();
        boolean estadoU=true;
        
        if(estado.equals("Inactivo"))
            estadoU=false;
                    
        String num = usuario.AgregarUsuario(nombre, correo, area, estadoU, web, mobile, 0, "", passw);
        
        UsuarioPorPerfilDAO usxp = new UsuarioPorPerfilDAO();
        usxp.AgregarUsuarioPorPerfil(asignados, Integer.valueOf(num), 0, "");
        
        EnviarCorreo enviocorreo = new EnviarCorreo();
        String mensajeCorreo = "<p style='font-family: Verdana, sans-serif;text-align: center;font-size:25px; '>Bienvenido al sistema PIF Patología</p>" 
                                +"<div style='font-family: Arial, Helvetica, sans-serif;font-size:16px;text-align: justify;'><br/>"
                                +"Hola "+nombre+", te damos la bienvenida a tu nuevo asistente de laboratorio, acontinuación te adjuntamos tus credenciales nuevas: <br/>"
                                +"<ul style='list-style-type:disc'>" 
                                +"  <li>Usuario: "+correo+"</li>" 
                                +"  <li>Contraseña: "+passw+"</li>"  
                                +"</ul><br/>"
                                + "Esperamos que le saque el mejor provecho a esta nueva plataforma.<br/></div>";
        
        
        enviocorreo.send_mail(correo,"","Bienvenido a PIF Patología",mensajeCorreo);
        
        return "principal";
    }   
    
    @RequestMapping(value = "updUsrEstado.htm", method = RequestMethod.POST) 
    public ModelAndView upUser(@RequestParam("bol") String bol,@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        UsuarioDAO opc = new UsuarioDAO();

        String idper = opc.updUsrestado(bol,idp);       

        mv.addObject("resp","No");
        return mv;
    } 
    
    @RequestMapping(value = "updUsuarioC.htm", method = RequestMethod.POST) 
    public ModelAndView updateUser(@RequestParam("Nombre") String nombre, @RequestParam("Area") int area, @RequestParam("Estado") String estado, 
            @RequestParam("WebApp") boolean web, @RequestParam("MobileApp") boolean mobile, @RequestParam("asignados") String asignados, 
            @RequestParam("originales") String originales, @RequestParam("id") int id) throws Exception {
         
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        UsuarioDAO usuario = new UsuarioDAO();
        boolean estadoU=true;
        
        if(estado.equals("Inactivo"))
            estadoU=false;
                    
        String num = usuario.EditarUsuario(nombre, area, estadoU, web, mobile,id, 0, "");
        ArrayList<Integer> IdAsignados = new ArrayList<Integer>();
        ArrayList<Integer> IdOriginales = new ArrayList<Integer>();
        
        String nuevos = "";
        String quitar = "";
        
        String[] separacion;
        //Crear ArrayList con alumnos seleccionados (Nuevos y viejos)
        if(!asignados.equals("")){
            separacion = asignados.split("_xk12x_");
            for(int i=0; i<separacion.length; i++){
                IdAsignados.add(Integer.parseInt(separacion[i]));
            }
        }
        
        if(!originales.equals("")){
            separacion = originales.split("_xk12x_");        
            for(int i=0; i<separacion.length; i++){        
                IdOriginales.add(Integer.parseInt(separacion[i]));
            }
        }        
        
        
        for(int i=0; i<IdOriginales.size(); i++){           
            if(!IdAsignados.contains(IdOriginales.get(i))){                
                if(quitar.equals("")){            
                    quitar=IdOriginales.get(i).toString();
                }else{           
                    quitar=quitar+"_xk12x_"+IdOriginales.get(i).toString();
                }
            }
        }
        for(int i=0; i<IdAsignados.size(); i++){
            if(!IdOriginales.contains(IdAsignados.get(i))){
                if(nuevos.equals("")){
                    nuevos=IdAsignados.get(i).toString();
                }else{
                    nuevos=nuevos+"_xk12x_"+IdAsignados.get(i).toString();
                }
            }
        }
        
        UsuarioPorPerfilDAO usxp = new UsuarioPorPerfilDAO();
        usxp.UpdUsuarioPorPerfil(nuevos, quitar, Integer.valueOf(num), 0, "");
        
        mv.addObject("resp","No");
      return mv;
    }
}
