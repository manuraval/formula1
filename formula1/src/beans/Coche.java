package beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utiles.BD;

public class Coche implements Serializable {
	private static final long serialVersionUID = -5591065870798813375L;
	
	String nombreCoche;
    String escuderia;
    String motor;
    String descripcion;

    public Coche() {
    }

    public Coche(String nombreCoche, String escuderia, String motor, String descripcion) {
        this.nombreCoche = nombreCoche;
        this.escuderia = escuderia;
        this.motor = motor;
        this.descripcion = descripcion;
    }

    public String getNombreCoche() {
        return nombreCoche;
    }

    public void setNombreCoche(String nombreCoche) {
        this.nombreCoche = nombreCoche;
    }

    public String getEscuderia() {
        return escuderia;
    }

    public void setEscuderia(String escuderia) {
        this.escuderia = escuderia;
    }

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Coche{" + "nombreCoche=" + nombreCoche + ", escuderia=" + escuderia + ", motor=" + motor + ", descripcion=" + descripcion + '}';
    }
    
    /**
     * 
     * Consulta para buscar un coche segun su escuderia
     *
     * 
     * @param escuderia
     * @return 
     */
   public Coche getCoche(String escuderia){
       Coche coche=new Coche();
        Connection conexion = null;
        try {
            conexion = BD.conectar();
            Statement consulta = conexion.createStatement();
            ResultSet resultado = consulta.executeQuery("select * from coche where escuderia='"+escuderia+"';");
            while (resultado.next()) {
                
                coche.nombreCoche = resultado.getString("nombrecoche");
                coche.escuderia = resultado.getString("escuderia");
                coche.motor = resultado.getString("motor");
                coche.descripcion = resultado.getString("descripcion ");
               
            }
        } catch (SQLException e) {
        } finally {
            BD.desconectar(conexion);
        }
        return coche;
      }
}
