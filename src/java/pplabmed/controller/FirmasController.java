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
import modelo.pojo.Area;
import modelo.pojo.Firmasmedicos;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FirmasController {
    
 

    
    @RequestMapping("/listaFirmas.htm")
    public String ListaFirmas(Model m, HttpServletRequest request){
        FirmasDAO Firmasm = new FirmasDAO();
        ArrayList<Firmasmedicos> ListaFirmas = Firmasm.ObtenerFirmas();
        m.addAttribute("ListaFirmas", ListaFirmas); 
        return "Parametria/listaFirmas";
    }
              
       @RequestMapping(value="NuevaFirma2.htm", method = RequestMethod.POST)
        public String InsertNuevaFirma(Model m, HttpServletRequest request,@RequestParam("NombreDoc") String nombre, @RequestParam("CodDoc") String codigo,@RequestParam("Estado") boolean estado){
        FirmasDAO firmas = new FirmasDAO();
      //boolean estadoU=true;
      //if(estado.equals("Inactivo"))
      //estadoU=false;
        firmas.AgregarFirma(nombre, codigo, estado, 0,"");
        return "principal";
    }
        
        
        @RequestMapping(value = "cargaVistaFirma.htm", method = RequestMethod.POST) 
        public ModelAndView guarda(@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("Parametria/pgCargaVistaFirma");
        FirmasDAO opc = new FirmasDAO();
        ArrayList<Firmasmedicos> listaP1 = opc.cargaInfoFirma(idp);
        System.out.println(idp);
        String nombre = ""; 
        String codigo = "";
        boolean estado = false;
        for (int i = 0; i< listaP1.size(); i++) {
            nombre = listaP1.get(i).getNombre();
            codigo = listaP1.get(i).getCodigo();
            estado = listaP1.get(i).isEstado();
         }
        System.out.println(codigo);
        mv.addObject("Nombre",nombre);
        mv.addObject("Codigo",codigo);
        mv.addObject("estado",true);
        mv.addObject("resp","No");
      return mv;
    }
        
        
        @RequestMapping(value = "upFirmaEstado.htm", method = RequestMethod.POST) 
        public ModelAndView upFirmaEst(@RequestParam("bol") String bol,@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        FirmasDAO opc = new FirmasDAO();      
        String idper = opc.updFirmaestado(bol, idp);
        mv.addObject("resp","No");
        return mv;
    } 
    
        @RequestMapping(value = "upd_firma.htm", method = RequestMethod.POST) 
        public ModelAndView updateUser(@RequestParam("id") int idfirma,@RequestParam("Nombre") String nombre,@RequestParam("Codigo") String codigo,@RequestParam("Estado") String estado) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        FirmasDAO firma = new FirmasDAO();
        boolean estadoU=true;
        if(estado.equals("Inactivo"))
            estadoU=false;          
        String num = firma.EditarFirma(idfirma, nombre, codigo, estadoU, 0, "");
        mv.addObject("resp","No");
      return mv;
    }   
       
}
