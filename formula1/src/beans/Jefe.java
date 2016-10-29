package beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utiles.BD;

public class Jefe implements Serializable {
	private static final long serialVersionUID = 3328220426961921943L;
	
	String dniJefe;
    String nombreJefe;
    String password;
    String foto;
    boolean correcto = false;
    String error="";

    public Jefe() {
    }

    public Jefe(String dniJefe, String nombreJefe, String password, String foto) {
        this.dniJefe = dniJefe;
        this.nombreJefe = nombreJefe;
        this.password = password;
        this.foto = foto;
    }

    public String getDniJefe() {
        return dniJefe;
    }

    public void setDniJefe(String dniJefe) {
        this.dniJefe = dniJefe;
    }

    public String getNombreJefe() {
        return nombreJefe;
    }

    public void setNombreJefe(String nombreJefe) {
        this.nombreJefe = nombreJefe;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public boolean isCorrecto() {
        return correcto;
    }

    public void setCorrecto(boolean correcto) {
        this.correcto = correcto;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    @Override
    public String toString() {
        return "Jefe{" + "dniJefe=" + dniJefe + ", nombreJefe=" + nombreJefe + ", password=" + password + ", foto=" + foto + ", correcto=" + correcto + ", error=" + error + '}';
    }
    
    /**
     * Consulta para comprobar el login y la password
     * 
     * @param login
     * @param password
     * @return boolean
     */
    public boolean identificar(String login, String password) {
      error="Usuario o Password erroneos";
        try {
            Connection con = BD.conectar();
            PreparedStatement consulta = con.prepareStatement("select * from jefe where dniJefe = '"+login+"';");
            
            ResultSet resultado = consulta.executeQuery();
            if (resultado.next()) {
                // Si la password introducida coincide con la que esta en la BD
                if (resultado.getString("password").equals(password)) {  
                    correcto=true;
                   
                     setDniJefe(login);
                     setNombreJefe(resultado.getString("nombreJefe"));
                     setPassword(resultado.getString("password"));
                     setFoto(resultado.getString("foto"));
                     error="";
                }
            }
            BD.desconectar(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return correcto;
    }
    
    /**
     * 
     * Consulta cambiar la foto de un medico
     *
     * 
     * @param dniJefe
    */
    
    public void cambiarFoto(String dniJefe) {
        String actualizacion;
        
        try {  
           actualizacion = "update jefe set foto='" + foto + "' where dniJefe=?";
            Connection conexion = BD.conectar();
            PreparedStatement actualizar = conexion.prepareStatement(actualizacion);
           
            actualizar.setString(1, foto);
            actualizar.setString(2, dniJefe);

            System.out.println(actualizacion);
            actualizar.execute();
            BD.desconectar(conexion);
        } catch (Exception e) {
            error = "No se ha podido actualizar";
            System.out.println(e.getMessage());
        }

    }
}
