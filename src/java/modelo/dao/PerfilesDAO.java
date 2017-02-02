/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.ArrayList;
import java.util.Iterator;
import modelo.pojo.Perfiles;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Administrador
 */
public class PerfilesDAO {
    public ArrayList<Perfiles> ObtenerPerfilesEstado(boolean Estado){        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql =  "SELECT * FROM ListarPerfiles("+Estado+"); ";
        Perfiles cat;
        ArrayList<Perfiles> Listado= new ArrayList<Perfiles>();
        System.out.println(sql);
        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            Iterator listasecciones =  q.list().iterator();

            while(listasecciones.hasNext()){
                Object[] registro= (Object[]) listasecciones.next();
                cat= new Perfiles();
                cat.setIdtblperfiles((int) registro[0]);
                cat.setNombreperfil((String) registro[1]);
                cat.setDescripcion((String) registro[2]);
                Listado.add(cat);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close(); 
        
        return Listado;
    }
}
