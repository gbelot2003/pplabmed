
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
//import modelo.util.EnviarCorreo;
import modelo.util.HibernateUtil;
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
public class areaController {
       
    @RequestMapping("/NuevaArea.htm")
    public String NuevaArea(){        
        return "Parametria/NuevaArea";
    }
    
    @RequestMapping(value="/NuevaArea.htm", method = RequestMethod.POST)
    public String InsertNuevaArea(Model m, HttpServletRequest request, @RequestParam("NombreArea") String nombre, @RequestParam("Estado") boolean estado){
        AreaDAO area = new AreaDAO();
        boolean estadoU=true;
        System.out.println("------------------------------------1");
//        if(estado.equals("Inactivo"))
//            estadoU=false;
        
        area.AgregarArea(nombre, estado, 0, "");
        return "principal";
    }
    
    @RequestMapping("/ListadoDeAreas.htm")
    public String ListaAreas(Model m, HttpServletRequest request){
        System.out.println("------------------------------------1");
        AreaDAO area = new AreaDAO();        
        ArrayList<Area> listaArea = area.ObtenerTodasAreas();
        m.addAttribute("listaArea", listaArea);
        return "Parametria/ListaAreas";
        
    }
       
@RequestMapping(value = "upAreaEstado.htm", method = RequestMethod.POST) 
    public ModelAndView upAreaEst(@RequestParam("bol") String bol,@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        AreaDAO opc = new AreaDAO(); 
        String idper = opc.updAreaestado(bol,idp);       
        mv.addObject("resp","No");
        return mv;
    } 
    
   
      
     
    @RequestMapping(value = "CargaVistaArea.htm", method = RequestMethod.POST) 
     public ModelAndView guarda(@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("Parametria/pgCargaVistaArea");
        AreaDAO opc = new AreaDAO();
        ArrayList<Area> listaP1 = opc.ObtenerArea(idp);
        System.out.println(idp);
        String nombre = "";
        boolean estado = false;
        for (int i = 0; i< listaP1.size(); i++) {
            nombre = listaP1.get(i).getNombre();
            estado = listaP1.get(i).isEstado();
         }
        mv.addObject("Nombre",nombre);
        mv.addObject("estado",true);
        mv.addObject("resp","No");
      return mv;
    }
     
     
     
     
 @RequestMapping(value = "upd_area.htm", method = RequestMethod.POST) 
        public ModelAndView updateUser(@RequestParam("id") int idarea,@RequestParam("Nombre") String nombre,@RequestParam("Estado") String estado) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        AreaDAO Area = new AreaDAO();
        boolean estadoU=true;
        if(estado.equals("Inactivo"))
            estadoU=false;          
        String num = Area.EditarArea(idarea,nombre, estadoU, 0, "");
        mv.addObject("resp","No");
      return mv;
    }       
        
     
}