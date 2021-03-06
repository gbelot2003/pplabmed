package modelo.pojo;
// Generated 1/02/2017 08:05:29 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Area generated by hbm2java
 */
public class Area  implements java.io.Serializable {


     private int idtblarea;
     private String nombre;
     private boolean estado;
     private Set usuarioses = new HashSet(0);

    public Area() {
    }

	
    public Area(int idtblarea, String nombre, boolean estado) {
        this.idtblarea = idtblarea;
        this.nombre = nombre;
        this.estado = estado;
    }
    public Area(int idtblarea, String nombre, boolean estado, Set usuarioses) {
       this.idtblarea = idtblarea;
       this.nombre = nombre;
       this.estado = estado;
       this.usuarioses = usuarioses;
    }
   
    public int getIdtblarea() {
        return this.idtblarea;
    }
    
    public void setIdtblarea(int idtblarea) {
        this.idtblarea = idtblarea;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set getUsuarioses() {
        return this.usuarioses;
    }
    
    public void setUsuarioses(Set usuarioses) {
        this.usuarioses = usuarioses;
    }




}


