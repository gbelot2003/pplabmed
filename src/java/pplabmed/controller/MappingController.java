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
import modelo.dao.FirmasDAO;
import modelo.dao.CitologiaDAO;
import modelo.dao.PerfilesDAO;
import modelo.dao.UsuarioDAO;
import modelo.dao.UsuarioPorPerfilDAO;
import modelo.dao.perfilDAO;
import modelo.pojo.Area;
import modelo.pojo.Firmasmedicos;
import modelo.pojo.Perfiles;
import modelo.pojo.Permisos;
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
 * @author Administrador
 */@Controller
    
public class MappingController {
    @RequestMapping("/inicio.htm")
    public String index(){
        return "index";
    }
    
    @RequestMapping("/principal.htm")
    public String principal(){
        return "principal";
    }
    
    @RequestMapping("/menu.htm")
    public String menuSuperior(){
        return "MenuPrincipal";
    }
    
    
    @RequestMapping("/logo.htm")
    public String logo(){
        return "logo";
    }
    
//    @RequestMapping("/histopatologia.htm")
//    public String ResultadoHispatologia(){
//        return "Resultados/Histopatologia";
//    }
        
//    @RequestMapping("/citologia.htm")
//    public String Citologia(Model m){
//         CitologiaDAO opc = new CitologiaDAO();
//        return "Resultados/Citologia";
//    }

             
    @RequestMapping("/NuevaFirma.htm")
    public String NuevaFirma(){        
    return "Parametria/NuevaFirma";
    }
    
//    
//    @RequestMapping("/idCito.htm")
//    public String AgregarIdCitologia(){
//        return "Parametria/NuevoIdCito";
//    }
//    
    @RequestMapping("/vacio.htm")
    public String PagSinContenido(){
        return "Vacio";
    }
    
    @RequestMapping("/Pefiles.htm")
    public String NuevoPerfil(Model m){
        System.out.println("llega aqui-------------------------");
        perfilDAO opc = new perfilDAO();
        ArrayList<Permisos> listaPermisosArray = opc.listaPermisosArray();        
        m.addAttribute("listaPermisosArray",listaPermisosArray);
        return "Seguridad/NuevoPerfil";
    }       
    
   
     @RequestMapping("/ListaPerfiles.htm")
    public String ListaPerfiles(Model m){
        perfilDAO opc = new perfilDAO();
        List listaP = opc.listaPerfiles();
        ArrayList<String> idp = new ArrayList<String>();
        ArrayList<String> nombre = new ArrayList<String>();
        ArrayList<String> descripcion = new ArrayList<String>();
        ArrayList<String> estado = new ArrayList<String>();
        List<Object[]> listDatosp = listaP;
        for (Object[] datos : listDatosp) {
            idp.add((String) datos[0].toString());
            nombre.add((String) datos[1].toString());
            descripcion.add((String) datos[2].toString());
            estado.add((String) datos[3].toString());
        }
        m.addAttribute("idp",idp);
        m.addAttribute("nomperf",nombre);
        m.addAttribute("desL",descripcion);
        m.addAttribute("estL",estado);
        return "Seguridad/ListaPerfiles";
    }
    
    @RequestMapping("/Bitacora.htm")
    public String Bitacora(){
        return "Seguridad/Bitacora";
    }
     
    @RequestMapping("/BuscarReportes.htm")
    public String BuscarReportes(){
        return "HojasdeTrabajo/BuscarReportes";
    }
    
    @RequestMapping("/Patologia.htm")
    public String Patologia(){
        return "EstadisticaPatologia/Patologia";
    }
    
//    @RequestMapping("/listaFirmas.htm")
//    public String listaFirmas(){
//        return "Parametria/listaFirmas";
//    }
   
//    @RequestMapping("/ListaIDCitologia.htm")
//    public String ListaIDCitologia(){
//        return "Parametria/ListaIDCitologia";
//    }
    
}
