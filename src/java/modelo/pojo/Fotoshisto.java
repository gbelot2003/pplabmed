package modelo.pojo;
// Generated 1/02/2017 08:05:29 AM by Hibernate Tools 4.3.1



/**
 * Fotoshisto generated by hbm2java
 */
public class Fotoshisto  implements java.io.Serializable {


     private int idtblfotoshisto;
     private String codigohisto;
     private String dirfoto;

    public Fotoshisto() {
    }

    public Fotoshisto(int idtblfotoshisto, String codigohisto, String dirfoto) {
       this.idtblfotoshisto = idtblfotoshisto;
       this.codigohisto = codigohisto;
       this.dirfoto = dirfoto;
    }
   
    public int getIdtblfotoshisto() {
        return this.idtblfotoshisto;
    }
    
    public void setIdtblfotoshisto(int idtblfotoshisto) {
        this.idtblfotoshisto = idtblfotoshisto;
    }
    public String getCodigohisto() {
        return this.codigohisto;
    }
    
    public void setCodigohisto(String codigohisto) {
        this.codigohisto = codigohisto;
    }
    public String getDirfoto() {
        return this.dirfoto;
    }
    
    public void setDirfoto(String dirfoto) {
        this.dirfoto = dirfoto;
    }




}


