/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelo.pojo.Area;
import modelo.pojo.Firmasmedicos;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SIST001
 */
public class FirmasDAO {
    
            
        public ArrayList<Firmasmedicos> ObtenerFirmas(){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listafirmas();";
        Firmasmedicos cat;
        ArrayList<Firmasmedicos> Listado= new ArrayList<Firmasmedicos>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Firmasmedicos();
                cat.setIdtblfirmamed((int) registro[0]);
                cat.setNombre((String) registro[1]);
                cat.setCodigo((String) registro[2]);
                if(((String) registro[3]).equals("true")){
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
        
        public ArrayList<Firmasmedicos> ObtenerFirmasEstado(boolean estado){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM listafirmasestado("+estado+");";
        Firmasmedicos cat;
        ArrayList<Firmasmedicos> ListadoFirmas= new ArrayList<Firmasmedicos>();
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();
            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Firmasmedicos();
                cat.setIdtblfirmamed((int) registro[0]);
                cat.setNombre((String) registro[1]);
                cat.setCodigo((String) registro[2]);
                ListadoFirmas.add(cat);
            }    
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return ListadoFirmas;
    }
        
        
        public void AgregarFirma(String nombre,String code,boolean estado, int usuario, String modulo){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select fn_insert_firma('"+nombre+"','"+code+"','"+estado+"');";
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
        
        
         
    public ArrayList<Firmasmedicos> cargaInfoFirma(int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "Select * from listafirmasespecifica('"+idp+"')";
        Firmasmedicos cat;
        ArrayList<Firmasmedicos> Listado= new ArrayList<Firmasmedicos>();
        System.out.println(sql);
        try {
              Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Firmasmedicos();
                
                cat.setNombre((String) registro[0]); 
                cat.setCodigo((String) registro[1]);
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
    
    
    
public String updFirmaestado(String bool,int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select upd_firmas('"+bool+"','"+idp+"');";
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

 public String EditarFirma(int idfirm ,String nombre, String codigo,boolean estado, int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select upd_Firma('"+idfirm+"','"+nombre+"','"+codigo+"','"+estado+"');";
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
    

