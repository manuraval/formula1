package beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import utiles.BD;

public class Piloto {
	String numPiloto;
    String nombrePiloto;
    double sueldo;
    int debut;
    int mundiales;
    Escuderia escuderia;
    Coche coche;
    String temporada;

    public Piloto() {
    }

    public Piloto(String numPiloto, String nombrePiloto, double sueldo, int debut, int mundiales, Escuderia escuderia, Coche coche, String temporada) {
        this.numPiloto = numPiloto;
        this.nombrePiloto = nombrePiloto;
        this.sueldo = sueldo;
        this.debut = debut;
        this.mundiales = mundiales;
        this.escuderia = escuderia;
        this.coche = coche;
        this.temporada = temporada;
    }

    public String getNumPiloto() {
        return numPiloto;
    }

    public void setNumPiloto(String numPiloto) {
        this.numPiloto = numPiloto;
    }

    public String getNombrePiloto() {
        return nombrePiloto;
    }

    public void setNombrePiloto(String nombrePiloto) {
        this.nombrePiloto = nombrePiloto;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getDebut() {
        return debut;
    }

    public void setDebut(int debut) {
        this.debut = debut;
    }

    public int getMundiales() {
        return mundiales;
    }

    public void setMundiales(int mundiales) {
        this.mundiales = mundiales;
    }

    public Escuderia getEscuderia() {
        return escuderia;
    }

    public void setEscuderia(Escuderia escuderia) {
        this.escuderia = escuderia;
    }

    public Coche getCoche() {
        return coche;
    }

    public void setCoche(Coche coche) {
        this.coche = coche;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }

    @Override
    public String toString() {
        return "Piloto{" + "numPiloto=" + numPiloto + ", nombrePiloto=" + nombrePiloto + ", sueldo=" + sueldo + ", debut=" + debut + ", mundiales=" + mundiales + ", escuderia=" + escuderia.nombreEscuderia + ", coche=" + coche.nombreCoche + ", temporada=" + temporada + '}';
    }
    
    /**
	 * 
	 * Consulta lista de Piloto
	 *
	 * @return Una lista de Piloto.
	 */
	public List<Piloto> getPilEsc(Escuderia nombreEscuderia) {
		List<Piloto> pilotos = new LinkedList();
		Connection conexion = null;
		try {
			conexion = BD.conectar();
			Statement consulta = conexion.createStatement();
			ResultSet resultado = consulta.executeQuery(
					"SELECT nombrePiloto, numPiloto, sueldo, debut, mundiales, coche, temporada FROM piloto JOIN escuderia ON piloto.escuderia = escuderia.nombreEscuderia WHERE escuderia = '" + nombreEscuderia + "';");
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
