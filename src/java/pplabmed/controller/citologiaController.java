/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pplabmed.controller;


import java.security.SecureRandom;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.CitologiaDAO;
import modelo.dao.FirmasDAO;
import modelo.dao.CatCitoDAO;
import modelo.pojo.Firmasmedicos;
import modelo.pojo.Citologia;
import modelo.pojo.Catalogocitologias;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author SIST001
 */
@Controller
public class citologiaController {
    
    
    @RequestMapping("/citologia.htm")
    public String Firmas(Model m, HttpServletRequest request){
        FirmasDAO Firmasm = new FirmasDAO();
        ArrayList<Firmasmedicos> ListaFirmas = Firmasm.ObtenerFirmasEstado(true);
        m.addAttribute("ListaFirmas", ListaFirmas);  
        CatCitoDAO catcito = new CatCitoDAO();
        System.out.println("------------------------------------------------------------------------controller");
        ArrayList<Catalogocitologias> ListaCatCito = catcito.ObtenerCatCitoEstado(true);
        m.addAttribute("ListaCatCito", ListaCatCito);  
        return "Resultados/Citologia";
    }

    @RequestMapping(value="citologias.htm", method = RequestMethod.POST)
    public String InsertNuevaCitologia(Model m, HttpServletRequest request,@RequestParam("DetCancer") boolean detcancer,@RequestParam("IndMaduracion") boolean indmadura,@RequestParam("Otros") String otros,@RequestParam("Diagnostico") String diag,@RequestParam("FUR") String fur,@RequestParam("FUP") String fup,@RequestParam("TOPOG") String gravidad,@RequestParam("Para") String para,@RequestParam("Abortos")int abortos,@RequestParam("idcatcito") int catalogocito,@RequestParam("Firma1") int firmas1,@RequestParam("Firma2") int firmas2,@RequestParam("Otros2") String otro2, @RequestParam("FechaInforme") String fi,@RequestParam("Fmuestra") String fm1,@RequestParam("DescMacro") String info){    
        CitologiaDAO cito = new CitologiaDAO();      
        cito.AgregarCitologia(detcancer, indmadura, otros, diag, fur, fup, gravidad, para, abortos, catalogocito, firmas1, firmas2, otro2, fi, fm1, info);
        return "principal";
    }   
  
//    @RequestMapping(value = "cargacamphansa.htm", method = RequestMethod.POST) 
//     public ModelAndView guarda(@RequestParam("idh") int idh) throws Exception {
//      ModelAndView mv = new ModelAndView("cargacamphansa");
//        CitologiaDAO opc = new CitologiaDAO();
//        
//        List listaP1 = opc.cargacamposhansa(idh);
//        String idhansa = "";
//        String orden = "";
//        String correo = "";
//        String paciente = "";
//        String direccion = "";
//        String medico = "";
//        String edad = "";
//        String sexo = "";
//        String sede = "";
//        
//        List<Object[]> listDatosp = listaP1;
//        for (Object[] datos : listDatosp) {
//            idhansa = (String) datos[0].toString();
//            orden = (String) datos[1].toString();
//            correo = (String) datos[2].toString();
//            paciente = (String) datos[3].toString( );
//            direccion = (String) datos[4].toString();
//            medico = (String) datos[5].toString();
//            edad = (String) datos[6].toString();
//            sexo = (String) datos[7].toString();
//            sede = (String) datos[8].toString();
//        }
//        mv.addObject("idhansa",idh);
//        mv.addObject("orden",orden);
//        mv.addObject("correo",correo);
//        mv.addObject("paciente",paciente);
//        mv.addObject("direccion",direccion);
//        mv.addObject("medico",medico);
//        mv.addObject("edad",edad);
//        mv.addObject("sexo",edad);
//        mv.addObject("sede",sede);
//        
//      return mv;
//    }
     

}


