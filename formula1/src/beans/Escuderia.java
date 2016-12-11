package beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utiles.BD;

public class Escuderia implements Serializable {
	private static final long serialVersionUID = 3044971465512147802L;
	
	String nombreEscuderia;
    int anoFundacion;
    String pais;
    Jefe jefe;
    String password;
    String foto;
    boolean correcto = false;
    String error="";

    public Escuderia() {
    }

    public Escuderia(String nombreEscuderia, int anoFundacion, String pais, Jefe jefe, String password, String foto) {
		super();
		this.nombreEscuderia = nombreEscuderia;
		this.anoFundacion = anoFundacion;
		this.pais = pais;
		this.jefe = jefe;
		this.password = password;
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

	public String getNombreEscuderia() {
		return nombreEscuderia;
	}

	public void setNombreEscuderia(String nombreEscuderia) {
		this.nombreEscuderia = nombreEscuderia;
	}

	public int getAnoFundacion() {
		return anoFundacion;
	}

	public void setAnoFundacion(int anoFundacion) {
		this.anoFundacion = anoFundacion;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public Jefe getJefe() {
		return jefe;
	}

	public void setJefe(Jefe jefe) {
		this.jefe = jefe;
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

	@Override
    public String toString() {
        return "Escuderia{" + "nombreEscuderia=" + nombreEscuderia + ", aÃ±oFundacion=" + anoFundacion + ", pais=" + pais + ", jefe=" + jefe + '}';
    }
    
    public boolean identificar(String login, String password) {
        error="Usuario o Password erroneos";
          try {
              Connection con = BD.conectar();
              PreparedStatement consulta = con.prepareStatement("select * from escuderia where nombreEscuderia = '"+login+"';");
              
              ResultSet resultado = consulta.executeQuery();
              if (resultado.next()) {
                  // Si la password introducida coincide con la que esta en la BD
                  if (resultado.getString("password").equals(password)) {  
                      correcto=true;
                     
                       setNombreEscuderia(login);
                       setAnoFundacion(resultado.getInt("añoFundacion"));
                       setPassword(resultado.getString("password"));
                       setPais(resultado.getString("pais"));
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
     * Consulta cambiar la foto de una escuderia
     *
     * 
     * @param nombreEscuderia
    */
     public void cambiarFoto(String nombreEscuderia) {
        String actualizacion;
        
        try {  
           actualizacion = "update escuderia set foto=? where nombreEscuderia=?";
            Connection conexion = BD.conectar();
            PreparedStatement actualizar = conexion.prepareStatement(actualizacion);
           
            actualizar.setString(1, foto);
            actualizar.setString(2, nombreEscuderia);

            System.out.println(actualizacion);
            actualizar.execute();
            BD.desconectar(conexion);
        } catch (Exception e) {
            error = "No se ha podido actualizar";
            System.out.println(e.getMessage());
        }

    }
}
