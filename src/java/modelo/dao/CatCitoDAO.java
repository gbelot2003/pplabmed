/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelo.pojo.Catalogocitologias;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SIST001
 */
public class CatCitoDAO {

        public ArrayList<Catalogocitologias> ObtenerCatCito(){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listacatcit();";
        Catalogocitologias cat;
        ArrayList<Catalogocitologias> Listado= new ArrayList<Catalogocitologias>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Catalogocitologias();
                cat.setIdtblcatcitologias((int) registro[0]);
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
        System.out.println("------------------------------------------------------1");
        return Listado;
    }
        
        public ArrayList<Catalogocitologias> ObtenerCatCitoEstado(boolean Estado){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listacatcitoest("+Estado+");";
        Catalogocitologias cat;
        ArrayList<Catalogocitologias> Listado= new ArrayList<Catalogocitologias>();
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Catalogocitologias();
                cat.setIdtblcatcitologias((int) registro[0]);
                cat.setNombre((String) registro[1]);
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return Listado;
    }
    
    
    public void AgregarCatCito(String nombre, boolean estado, int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select fn_insert_catcitologia('"+nombre+"', '"+estado+"');";
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
        
      
      
     public ArrayList<Catalogocitologias> ObtenerTodosCatCitologias(){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listacatcit();";
        Catalogocitologias cat;
        ArrayList<Catalogocitologias> Listado= new ArrayList<Catalogocitologias>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Catalogocitologias();
                cat.setIdtblcatcitologias((int) registro[0]);
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
        
    public String updCatCitologiaestado(String bool,int idp){      
        System.out.println("sadasdass----------------sssssss");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select updestcatcitologia('"+bool+"','"+idp+"');";
        System.out.println(sql);
        List<String> filmList = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList.get(0).toString();
    }



    public ArrayList<Catalogocitologias> cargaInfoCatCitologia(int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "Select * from listacatcitologiaespecifica('"+idp+"')";
        Catalogocitologias cat;
        ArrayList<Catalogocitologias> Listado= new ArrayList<Catalogocitologias>();
        System.out.println(sql);
        try {
              Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Catalogocitologias();
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

    
    
    public String EditarCatCitologia(int id,String nombre,boolean estado, int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select upd_catcitologia('"+id+"','"+nombre+"','"+estado+"');";
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
