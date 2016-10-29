package beans;

import java.io.Serializable;

public class Escuderia implements Serializable {
	private static final long serialVersionUID = 3044971465512147802L;
	
	String nombreEscuderia;
    int a�oFundacion;
    String pais;
    Jefe jefe;

    public Escuderia() {
    }

    public Escuderia(String nombreEscuderia, int a�oFundacion, String pais, Jefe jefe) {
        this.nombreEscuderia = nombreEscuderia;
        this.a�oFundacion = a�oFundacion;
        this.pais = pais;
        this.jefe = jefe;
    }

    public String getNombreEscuderia() {
        return nombreEscuderia;
    }

    public void setNombreEscuderia(String nombreEscuderia) {
        this.nombreEscuderia = nombreEscuderia;
    }

    public int getA�oFundacion() {
        return a�oFundacion;
    }

    public void setA�oFundacion(int a�oFundacion) {
        this.a�oFundacion = a�oFundacion;
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

    @Override
    public String toString() {
        return "Escuderia{" + "nombreEscuderia=" + nombreEscuderia + ", añoFundacion=" + a�oFundacion + ", pais=" + pais + ", jefe=" + jefe + '}';
    }
}
