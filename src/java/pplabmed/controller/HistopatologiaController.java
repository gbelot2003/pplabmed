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
import modelo.dao.HistopatologiaDAO;
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
public class HistopatologiaController {
    
    
    @RequestMapping("/histopatologia.htm")
    public String Firmas(Model m, HttpServletRequest request){
        FirmasDAO Firmasm = new FirmasDAO();
        ArrayList<Firmasmedicos> ListaFirmas = Firmasm.ObtenerFirmasEstado(true);
        m.addAttribute("ListaFirmas", ListaFirmas);  
        System.out.println("------------------------------------------------------------------------controller");
        HistopatologiaDAO Histo = new HistopatologiaDAO();
        List listaP1 =  Histo.codigofotohistopatologia();
        String codigo = "";
        List<Object[]> listDatosp = listaP1;
        for (Object[] datos : listDatosp) {
            codigo = (String) datos[0].toString();
        }
        System.out.println(codigo);
         m.addAttribute("codigo", codigo);
        return "Resultados/Histopatologia";
    }
    
      @RequestMapping(value="histopatologia.htm", method = RequestMethod.POST)
      public String InsertNuevaHistopatologia(Model m, HttpServletRequest request,@RequestParam("Nofactura") String idtblhansa_,@RequestParam("DiagnosticoClinico") String diagnosticoclinico_,@RequestParam("Muestra") String muestra_,@RequestParam("Mor1") String mor1_,@RequestParam("Mor2") String mor2_,@RequestParam("Finforme") String fechainforme_,@RequestParam("FBiopsia") String fechabiopsia_,@RequestParam("Firma1") int firmas1,@RequestParam("Firma2") int firmas2,@RequestParam("TOPOG") String topog_,@RequestParam("FMuestra") String fechamuestra_,@RequestParam("DescMacro") String descmacro_,@RequestParam("DescMicro") String descmicro_,@RequestParam("Diagnostico") String diagnostico_,@RequestParam("code")String codigohisto_){    
        HistopatologiaDAO histo = new HistopatologiaDAO();
        histo.AgregarHistopatologia(firmas2, diagnosticoclinico_, muestra_, mor1_, mor2_, fechainforme_, fechabiopsia_, firmas2, firmas2, topog_, fechamuestra_, descmacro_, descmicro_, diagnostico_, codigohisto_);
        System.out.println("-----------------------------------------------------------------------------------------jj");
        return "principal";
    }                                                  

    
}

