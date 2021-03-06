package modelo.pojo;
// Generated 1/02/2017 08:05:29 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Firmasmedicos generated by hbm2java
 */
public class Firmasmedicos  implements java.io.Serializable {


     private int idtblfirmamed;
     private String nombre;
     private String codigo;
     private boolean estado;
     private Set citologias = new HashSet(0);
     private Set histopatologias = new HashSet(0);

    public Firmasmedicos() {
    }

	
    public Firmasmedicos(int idtblfirmamed, String nombre, String codigo, boolean estado) {
        this.idtblfirmamed = idtblfirmamed;
        this.nombre = nombre;
        this.codigo = codigo;
        this.estado = estado;
    }
    public Firmasmedicos(int idtblfirmamed, String nombre, String codigo, boolean estado, Set citologias, Set histopatologias) {
       this.idtblfirmamed = idtblfirmamed;
       this.nombre = nombre;
       this.codigo = codigo;
       this.estado = estado;
       this.citologias = citologias;
       this.histopatologias = histopatologias;
    }
   
    public int getIdtblfirmamed() {
        return this.idtblfirmamed;
    }
    
    public void setIdtblfirmamed(int idtblfirmamed) {
        this.idtblfirmamed = idtblfirmamed;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set getCitologias() {
        return this.citologias;
    }
    
    public void setCitologias(Set citologias) {
        this.citologias = citologias;
    }
    public Set getHistopatologias() {
        return this.histopatologias;
    }
    
    public void setHistopatologias(Set histopatologias) {
        this.histopatologias = histopatologias;
    }




}


