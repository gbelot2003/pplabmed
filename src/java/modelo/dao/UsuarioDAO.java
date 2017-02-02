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
import modelo.pojo.Usuarios;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Administrador
 */
public class UsuarioDAO {
    public ArrayList<Usuarios> ObtenerTodosUsuarios(){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM Listarusuarios();";
        Usuarios cat;
        ArrayList<Usuarios> Listado= new ArrayList<Usuarios>();
        
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Usuarios();
                cat.setIdtblusuarios((int) registro[0]);
                cat.setNombre((String) registro[1]);
                cat.setCorreo((String) registro[2]);
                if(((String) registro[4]).equals("true")){
                    cat.setAccesomovil(true);
                }else{
                    cat.setAccesomovil(false);
                }
                 if(((String) registro[3]).equals("true")){
                    cat.setAccesoweb(true);
                }else{
                    cat.setAccesoweb(false);
                }
                if(((String) registro[6]).equals("true")){
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
    
    public String AgregarUsuario(String nombre, String correo, int area, boolean estado, boolean web, boolean mobile, int usuario, String modulo, String passw){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select crearusuario('"+nombre+"','"+correo+"','"+passw+"',"+mobile+","+web+","+area+","+estado+");";
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
    
    public ArrayList<Usuarios> ObtenerUsuario(int id){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM Listarusuariosespecifico("+id+");";
        Usuarios cat;
        ArrayList<Usuarios> Listado= new ArrayList<Usuarios>();
        System.out.println(sql);
        try {
            Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Usuarios();
                cat.setNombre((String) registro[0]);
                cat.setCorreo((String) registro[1]);
                if(((String) registro[2]).equals("true")){
                    cat.setAccesomovil(true);
                }else{
                    cat.setAccesomovil(false);
                }
                if(((String) registro[3]).equals("true")){
                    cat.setAccesoweb(true);
                }else{
                    cat.setAccesoweb(false);
                }
                if(((String) registro[6]).equals("true")){
                    cat.setArea(new Area(((int) registro[4]), ((String) registro[5]), true));
                }else{
                    cat.setArea(new Area(((int) registro[4]), ((String) registro[5]), false));
                }
                
                if(((String) registro[7]).equals("true")){
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
    
    public String updUsrestado(String bool,int idp){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select updusuario('"+bool+"','"+idp+"');";
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
    
    public String EditarUsuario(String nombre, int area, boolean estado, boolean web, boolean mobile, int idusrmod,int usuario, String modulo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        String sql =  "select updtodousuario('"+nombre+"',"+mobile+","+web+","+area+","+estado+","+idusrmod+");";
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
