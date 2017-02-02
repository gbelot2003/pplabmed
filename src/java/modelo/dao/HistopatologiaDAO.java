/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;
import java.util.Date;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.pojo.Firmasmedicos;
import modelo.pojo.Histopatologia;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author SIST001
 */
public class HistopatologiaDAO {
    
    
    public void AgregarHistopatologia(int Nofact,String diagnosticoclinico_ ,String muestra_ ,String mor1_,String mor2_ ,String fechainforme_ ,String fechabiopsia_ ,int idtblfirma1_ ,int idtblfirma2_ ,String topog_ ,String fechamuestra_ ,String descmacro_ ,String descmicro_ ,String diagnostico_  ,String codigohisto_ ){
        Session session = HibernateUtil.getSessionFactory().openSession();
        System.out.println("-------------------------------------------------------------123");
        Transaction tx;
        String sql = "select fn_insert_histo('"+Nofact+"','"+diagnosticoclinico_+"','"+muestra_+"','"+mor1_+"','"+mor2_+"','"+fechainforme_+"','"+fechabiopsia_+"','"+idtblfirma1_+"','"+idtblfirma2_+"','"+topog_+"','"+fechamuestra_+"','"+descmacro_+"','"+descmicro_+"','"+diagnostico_+"','"+codigohisto_+"');";
        System.out.println(sql);
        List<String> resultado = new ArrayList<String>();
        try {
            tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            resultado=q.list();
            
            tx.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();  
         }
    
    
    
    
     public List codigofotohistopatologia(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from vista_codefotohistopatologia";
        System.out.println(sql);
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }
        return listaget;
    }
    
    
}

//
//public String codigofotohistopatologia(){
//        
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        String sql = "select * from vista_codefotohistopatologia";
//        
//        List<String> filmList = new ArrayList<String>();
//        try {
//            org.hibernate.Transaction tx = session.beginTransaction();
//            Query q = session.createSQLQuery(sql);
//            //int result = q.executeUpdate();
//            filmList = q.list();
//            tx.commit();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        session.close();
//        return filmList.get(0).toString();
//    }