package beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import utiles.BD;

public class Administracion {
// private String emailError = "";
    
    /**
     * 
     * Consulta de busqueda de un piloto
     *
     * @return boolean
     */
    public List<Piloto> getPiloto(String jefe) {
        List<Piloto> pilotos = new LinkedList<Piloto>();
        Connection conexion = null;
        try {
            conexion = BD.conectar();
            Statement consulta = conexion.createStatement();
            ResultSet resultado = consulta.executeQuery("SELECT * FROM piloto JOIN escuderia\n"
                    + "ON piloto.escuderia = escuderia.nombreEscuderia\n"
                    + "JOIN jefe\n"
                    + "ON escuderia.jefe = jefe.dniJefe\n"
                    + "WHERE jefe = ?");
            while (resultado.next()) {
                Piloto piloto = new Piloto();
                piloto.numPiloto = resultado.getString("numPiloto");
                piloto.nombrePiloto = resultado.getString("nombrePiloto");
                piloto.sueldo = resultado.getDouble("sueldo");
                piloto.debut = resultado.getInt("debut");
                piloto.mundiales = resultado.getInt("mundiales");
                piloto.temporada = resultado.getString("temporada");
                pilotos.add(piloto);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            BD.desconectar(conexion);
        }
        return pilotos;
    }
    
    /**
     * 
     * Consulta lista de Medicos
     *
     * @return Una lista de Medicos.
     */
    public List<Jefe> getJefe() {
        List<Jefe> jefes = new LinkedList();
        Connection conexion = null;
        try {
            conexion = BD.conectar();
            Statement consulta = conexion.createStatement();
            ResultSet resultado = consulta.executeQuery("select * from jefe");
            while (resultado.next()) {
                Jefe jefe = new Jefe();
                jefe.dniJefe = resultado.getString("dniJefe");
                jefe.nombreJefe = resultado.getString("nombreJefe");
                jefe.apellidos = resultado.getString("apellidosJefe");
                jefe.sexo = resultado.getString("sexo");
                jefe.foto = resultado.getString("foto");
                jefe.password = resultado.getString("password");
                jefes.add(jefe);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            BD.desconectar(conexion);
        }
        return jefes;
    }
}
