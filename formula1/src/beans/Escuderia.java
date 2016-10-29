package beans;

import java.io.Serializable;

public class Escuderia implements Serializable {
	private static final long serialVersionUID = 3044971465512147802L;
	
	String nombreEscuderia;
    int añoFundacion;
    String pais;
    Jefe jefe;

    public Escuderia() {
    }

    public Escuderia(String nombreEscuderia, int añoFundacion, String pais, Jefe jefe) {
        this.nombreEscuderia = nombreEscuderia;
        this.añoFundacion = añoFundacion;
        this.pais = pais;
        this.jefe = jefe;
    }

    public String getNombreEscuderia() {
        return nombreEscuderia;
    }

    public void setNombreEscuderia(String nombreEscuderia) {
        this.nombreEscuderia = nombreEscuderia;
    }

    public int getAñoFundacion() {
        return añoFundacion;
    }

    public void setAñoFundacion(int añoFundacion) {
        this.añoFundacion = añoFundacion;
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
        return "Escuderia{" + "nombreEscuderia=" + nombreEscuderia + ", aÃ±oFundacion=" + añoFundacion + ", pais=" + pais + ", jefe=" + jefe + '}';
    }
}
