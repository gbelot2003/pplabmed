/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelo.pojo.Permisos;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sinergia14
 */
public class perfilDAO {
    
    public List listaPermisos(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from vista_permisos";
        
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
    
    public String guardaPerfil(String nombre,String desc,String bool){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertPerfil('"+nombre+"','"+desc+"',"+bool+");";
        
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
    
    public String guardaPerfilp(int idp,int idpp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertPerfilPermiso('"+idp+"','"+idpp+"');";
        
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
    
    
    public List listaPerfiles(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from vista_perfiles";
        
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
    
    public List cargaInfoPerfil(int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "Select * from fn_infoperfil('"+idp+"')";
        
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
    
    public List cargapermisosPerfil(int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT * FROM fn_cargaPermisosPerfil('"+idp+"');";
        
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
    
     public String updPerfil(String nombre,String desc,String bool,int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_updPerfil('"+nombre+"','"+desc+"','"+bool+"','"+idp+"');";
        
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
     
      public String updPerfilestado(String bool,int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_updPerfilest('"+bool+"','"+idp+"');";
       
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
     
    public String limpiaperPerfil(int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_limpiaPermisos('"+idp+"');";
        
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
        return "1";
    } 
    
    public ArrayList<Permisos> listaPermisosArray(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from vista_permisos";
        Permisos cat;
        ArrayList<Permisos> Listado= new ArrayList<Permisos>();
        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Permisos();
                cat.setIdtblpermisos((int) registro[0]);
                cat.setNombre((String) registro[1]);
                cat.setUrl((String) registro[2]);
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }       
        return Listado;
    }
       
}
