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
import modelo.dao.CatCitoDAO;
import modelo.pojo.Catalogocitologias;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.stereotype.Controller;

/**
 *
 * @author SIST001
 */
@Controller
public class CatCitologiaController {
    
      
    @RequestMapping("/idCito.htm")
    public String AgregarIdCitologia(){
        return "Parametria/NuevoIdCito";
    }
    
      
     @RequestMapping(value="idCito.htm", method = RequestMethod.POST)
    public String InsertNuevaCatCitologia(Model m, HttpServletRequest request, @RequestParam("NombreCatCitologia") String nomp, @RequestParam("Estado") String estado){
        CatCitoDAO catcitologia = new CatCitoDAO();
        boolean estadoU=true;
        if(estado.equals("Inactivo"))
            estadoU=false;
        catcitologia.AgregarCatCito(nomp, estadoU, 0, "");
        return "principal";
    }
    
    
    
     @RequestMapping("/ListaIDCitologia.htm")
    public String ListaCatCito(Model m, HttpServletRequest request){
        CatCitoDAO  catcitologia= new CatCitoDAO();
        ArrayList<Catalogocitologias> listacatcitologia = catcitologia.ObtenerTodosCatCitologias();
        m.addAttribute("listacatcitologia", listacatcitologia);
        return "Parametria/ListaIDCitologia";
        
    }
       
      @RequestMapping(value = "upCatcitologiaEstado.htm", method = RequestMethod.POST) 
        public ModelAndView upFirmaEst(@RequestParam("bol") String bol,@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        CatCitoDAO opc = new CatCitoDAO();    
        String idper = opc.updCatCitologiaestado(bol, idp);
        mv.addObject("resp","No");
        return mv;
    } 
    
        
        
       @RequestMapping(value = "cargaVistaCatCitologia.htm", method = RequestMethod.POST) 
        public ModelAndView guarda(@RequestParam("idp") int idp) throws Exception {
        ModelAndView mv = new ModelAndView("Parametria/pgcargaVistaCatCitologia");
        CatCitoDAO opc = new CatCitoDAO();
        ArrayList<Catalogocitologias> listaP1 = opc.cargaInfoCatCitologia(idp);
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
        
        
     @RequestMapping(value = "upd_CatCitologia.htm", method = RequestMethod.POST) 
        public ModelAndView updateUser(@RequestParam("id") int idcatcitologia,@RequestParam("Nombre") String nombre,@RequestParam("Estado") String estado) throws Exception {
        ModelAndView mv = new ModelAndView("cargatempPermisos");
        CatCitoDAO opc = new CatCitoDAO();
        boolean estadoU=true;
        if(estado.equals("Inactivo"))
            estadoU=false; 
        String num = opc.EditarCatCitologia(idcatcitologia, nombre, estadoU, 0, "");
        mv.addObject("resp","No");
      return mv;
    }   
}
