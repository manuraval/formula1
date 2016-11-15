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
    String apellidos;
    String sexo;
    boolean correcto = false;
    String error="";

    public Jefe() {
    }

	public Jefe(String dniJefe, String nombreJefe, String apellidos, String sexo) {
		super();
		this.dniJefe = dniJefe;
		this.nombreJefe = nombreJefe;
		this.apellidos = apellidos;
		this.sexo = sexo;
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

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	@Override
	public String toString() {
		return "Jefe [dniJefe=" + dniJefe + ", nombreJefe=" + nombreJefe + ", apellidos=" + apellidos + ", sexo=" + sexo
				+ "]";
	}
}
