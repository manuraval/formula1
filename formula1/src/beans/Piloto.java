package beans;

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
        return "Piloto{" + "numPiloto=" + numPiloto + ", nombrePiloto=" + nombrePiloto + ", sueldo=" + sueldo + ", debut=" + debut + ", mundiales=" + mundiales + ", escuderia=" + escuderia + ", coche=" + coche + ", temporada=" + temporada + '}';
    }
}
