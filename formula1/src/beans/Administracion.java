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
	 * Consulta lista de Piloto
	 *
	 * @return Una lista de Piloto.
	 */
	public List<Piloto> getPilEsc(String nombreEscuderia) {
		List<Piloto> pilotos = new LinkedList();
		Connection conexion = null;
		try {
			conexion = BD.conectar();
			Statement consulta = conexion.createStatement();
			ResultSet resultado = consulta.executeQuery(
					"SELECT nombrePiloto, numPiloto, sueldo, debut, mundiales, coche, temporada FROM piloto JOIN escuderia ON piloto.escuderia = escuderia.nombreEscuderia WHERE nombreEscuderia = '" + nombreEscuderia + "';");
			if (resultado.next()) {
				Piloto pil = new Piloto();
				pil.numPiloto = resultado.getString("numPiloto");
				pil.nombrePiloto = resultado.getString("nombrePiloto");
				pil.sueldo = resultado.getDouble("sueldo");
				pil.debut = resultado.getInt("debut");
				pil.mundiales = resultado.getInt("mundiales");
				pil.coche.nombreCoche = resultado.getString("coche");
				pil.temporada = resultado.getString("temporada");
				pilotos.add(pil);
			}
			BD.desconectar(conexion);
		} catch (SQLException e) {
		}
		return pilotos;
	}
}
