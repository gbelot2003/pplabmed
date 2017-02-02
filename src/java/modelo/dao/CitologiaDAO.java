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
import modelo.pojo.Citologia;
import modelo.pojo.Firmasmedicos;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SIST001
 */
public class CitologiaDAO {  

    
    
   
    public void AgregarCitologia(boolean detcancer, boolean indmadura,String otros,String diag,String fur,String fup,String gravidad,String para,int aborto,int catalogocito, int firmas1,int firmas2,String otros2,String fi,String fm,String info){             
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql = "select fn_insert_cito('"+detcancer+"','"+indmadura+"','"+otros+"','"+diag+"','"+fur+"','"+fup+"','"+gravidad+"','"+para+"','"+aborto+"','"+catalogocito+"','"+firmas1+"','"+firmas2+"','"+otros2+"','"+fi+"','"+fm+"','"+info+"');";
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
        
}
