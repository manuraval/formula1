package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import utiles.BD;

public class Administracion {
	
	/**
	 * 
	 * Consulta lista de Jefe
	 *
	 * @return Una lista de Jefe.
	 */
	public List<Jefe> getJefeEsc(String nombreEscuderia) {
		List<Jefe> jefes = new LinkedList();
		Connection conexion = null;
		try {
			conexion = BD.conectar();
			Statement consulta = conexion.createStatement();
			ResultSet resultado = consulta.executeQuery(
					"SELECT nombreJefe, apellidosJefe, dniJefe, sexo FROM jefe JOIN escuderia ON jefe.dniJefe = escuderia.jefe WHERE nombreEscuderia = '" + nombreEscuderia + "';");
			while (resultado.next()) {
				Jefe jefe = new Jefe();
				jefe.nombreJefe = resultado.getString("nombreJefe");
				jefe.apellidos = resultado.getString("apellidosJefe");
				jefe.dniJefe = resultado.getString("dniJefe");
				jefe.sexo = resultado.getString("sexo");
				jefes.add(jefe);
			}
			BD.desconectar(conexion);
		} catch (SQLException e) {
		}
		return jefes;
	}
	
    /**
     * 
     * Consulta de busqueda de un medico
     *
     * @return boolean
     */

    public boolean buscarPiloto(String numPiloto) {

        boolean encontrado = false;

        System.out.println("Buscando piloto " + numPiloto);
        Connection con = BD.conectar();
        try {
            PreparedStatement ps = con.prepareStatement("select * from piloto where numPiloto=?");
            ps.setString(1, numPiloto);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                
                encontrado = true;

            }
            res.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            BD.desconectar(con);
        }
        return encontrado;
    }
    
	public boolean nuevoPiloto(String numPiloto, String nombre, int sueldo, int debut, int mundiales, String nombreEscuderia, String temporada) {
        boolean exito = false;
        try {

            if (buscarPiloto(numPiloto)) {
                exito = false;
            } else {

                String inser = "insert into piloto value (?,?,?,?,?,?,?);";

                Connection conexion = BD.conectar();
                PreparedStatement nuevo = conexion.prepareStatement(inser);
                nuevo.setString(1, numPiloto);
                nuevo.setString(2, nombre);
                nuevo.setInt(3, sueldo);
                nuevo.setInt(4, debut);
                nuevo.setInt(5, mundiales);
                nuevo.setString(6, nombreEscuderia);
                nuevo.setString(7, temporada);

                nuevo.execute();

                BD.desconectar(conexion);
                exito = true;
            }

        } catch (Exception e) {

            System.out.println(e.getMessage());
        }
        return exito;
    }
}
