package beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import utiles.BD;

public class Mecanico implements Serializable {
	private static final long serialVersionUID = 267421397797196573L;
	
	String dniMecanico;
    String cargo;
    String nombreMecanico;
    double sueldo;
    Date contrato;
    Coche coche;
    Escuderia escuderia;
    String temporada;

    public Mecanico() {
    }

    public Mecanico(String dniMecanico, String cargo, String nombreMecanico, double sueldo, Coche coche, Escuderia escuderia, String temporada) {
        this.dniMecanico = dniMecanico;
        this.cargo = cargo;
        this.nombreMecanico = nombreMecanico;
        this.sueldo = sueldo;
        this.coche = coche;
        this.escuderia = escuderia;
        this.temporada = temporada;
    }

    public String getDniMecanico() {
        return dniMecanico;
    }

    public void setDniMecanico(String dniMecanico) {
        this.dniMecanico = dniMecanico;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getNombreMecanico() {
        return nombreMecanico;
    }

    public void setNombreMecanico(String nombreMecanico) {
        this.nombreMecanico = nombreMecanico;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public Date getContrato() {
        return contrato;
    }

    public void setContrato(Date contrato) {
        this.contrato = contrato;
    }

    public Coche getCoche() {
        return coche;
    }

    public void setCoche(Coche coche) {
        this.coche = coche;
    }

    public Escuderia getEscuderia() {
        return escuderia;
    }

    public void setEscuderia(Escuderia escuderia) {
        this.escuderia = escuderia;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }

    @Override
    public String toString() {
        return "Mecanico{" + "dniMecanico=" + dniMecanico + ", cargo=" + cargo + ", nombreMecanico=" + nombreMecanico + ", sueldo=" + sueldo + ", contrato=" + contrato + ", coche=" + coche + ", escuderia=" + escuderia + ", temporada=" + temporada + '}';
    }
    
    /**
	 * 
	 * Consulta lista de Piloto
	 *
	 * @return Una lista de Piloto.
	 */
	public List<Mecanico> getMecEsc(String nombreEscuderia) {
		List<Mecanico> mecanicos = new LinkedList();
		Connection conexion = null;
		try {
			conexion = BD.conectar();
			Statement consulta = conexion.createStatement();
			ResultSet resultado = consulta.executeQuery(
					"SELECT dniMecanico, cargo, nombreMecanico, sueldo, contrato, coche, temporada FROM mecanico JOIN escuderia ON mecanico.escuderia = escuderia.nombreEscuderia WHERE nombreEscuderia = '" + nombreEscuderia + "';");
			while (resultado.next()) {
				Mecanico mec = new Mecanico();
				mec.dniMecanico = resultado.getString("dniMecanico");
				mec.cargo = resultado.getString("cargo");
				mec.sueldo = resultado.getDouble("sueldo");
				mec.nombreMecanico = resultado.getString("nombreMecanico");
				mec.contrato = resultado.getDate("contrato");
				// mec.coche.nombreCoche = resultado.getString("coche.nombreCoche");
				mec.temporada = resultado.getString("temporada");
				mecanicos.add(mec);
			}
			BD.desconectar(conexion);
		} catch (SQLException e) {
		}
		return mecanicos;
	}
}
