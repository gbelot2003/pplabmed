package modelo.dao;
import java.util.Date;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.pojo.Firmasmedicos;
import modelo.pojo.Camposhansa;
import modelo.pojo.Citologia;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class HansaDAO {
//    
//    public void agregarcamposHansa(int nofactura, int cedula, String nombre, String fecha_nac, String email,String sede,String medico, String estado, boolean sexo ){
//      Session session = HibernateUtil.getSessionFactory().openSession();
//        Transaction tx;
//        String sql = "select fn_insert_hansa_campos('"+nofactura+"','"+nombre+"','"+fecha_nac+"','"+email+"','"+sede+"','"+medico+"','"+diag+"','"+diag+"');";
//     System.out.println(sql);
//        List<String> resultado = new ArrayList<String>();
//        try {
//            tx = session.beginTransaction();
//            Query q = session.createSQLQuery(sql);
//            resultado=q.list();
//            
//            tx.commit();
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        session.close();  
//         }
       
//     public void agregarcamposhansa(boolean detcancer, boolean indmadura,String otros,String diag,String fur,String fup,String gravidad,String para,int aborto,int catalogocito, int firmas1,int firmas2,String otros2,String fi,String fm,String info){             
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        Transaction tx;
//        String sql = "select fn_insert_hansa_campos('"+detcancer+"','"+indmadura+"','"+otros+"','"+diag+"','"+fur+"','"+fup+"','"+gravidad+"','"+para+"','"+aborto+"','"+catalogocito+"','"+firmas1+"','"+firmas2+"','"+otros2+"','"+fi+"','"+fm+"','"+info+"');";
//        System.out.println(sql);
//        List<String> resultado = new ArrayList<String>();
//        try {
//            tx = session.beginTransaction();
//            Query q = session.createSQLQuery(sql);
//            resultado=q.list();
//            
//            tx.commit();
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        session.close();  
//         }

}
