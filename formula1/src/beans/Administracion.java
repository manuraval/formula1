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
}
