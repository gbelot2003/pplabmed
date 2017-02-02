package modelo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelo.pojo.Area;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class AreaDAO {
    
    public ArrayList<Area> ObtenerArea(int idp){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listaareasespecifica("+idp+");";
        Area cat;
        ArrayList<Area> Listado= new ArrayList<Area>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Area();
                cat.setNombre((String) registro[0]);                              
                if(((String) registro[1]).equals("true")){
                    cat.setEstado(true);
                }else{
                    cat.setEstado(false);
                }
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return Listado;
    }
    
    
    public ArrayList<Area> ObtenerAreasEstado(boolean Estado){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM ListarAreas("+Estado+");";
        Area cat;
        ArrayList<Area> Listado= new ArrayList<Area>();
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Area();
                cat.setIdtblarea((int) registro[0]);
                cat.setNombre((String) registro[1]);
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return Listado;
    }
    
    public void AgregarArea(String nombre, boolean estado, int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select creararea('"+nombre+"', "+estado+");";
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
    
    public ArrayList<Area> ObtenerTodasAreas(){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM ListarTodasAreas();";
        Area cat;
        ArrayList<Area> Listado= new ArrayList<Area>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Area();
                cat.setIdtblarea((int) registro[0]);
                cat.setNombre((String) registro[1]);
                if(((String) registro[2]).equals("true")){
                    cat.setEstado(true);
                }else{
                    cat.setEstado(false);
                }
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return Listado;
    }
    
    public String updAreaestado(String bool,int idp){      
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select updarea('"+bool+"','"+idp+"');";
        System.out.println(sql);
        List<String> filmList = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList.get(0).toString();
    }
       
     public String EditarArea(int idarea ,String nombre, boolean estado, int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select upd_Areas('"+idarea+"','"+nombre+"','"+estado+"');";
        System.out.println(sql);
        List<String> filmList = new ArrayList<String>();
        try {
            tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            filmList = q.list();
            
            tx.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();    
        return filmList.get(0).toString();
    }
}
