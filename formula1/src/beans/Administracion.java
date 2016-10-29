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
     * Consulta para insertar un Medico
     *
     * @return Boolean
     */

    /*
    public boolean medicoNuevo(String numColegiado, String nombre, String apellidos, String especialidad, String sexo, String foto, String supervisor, String password) {
        int superv;
        boolean exito = false;

        if (supervisor == "") {
            superv = 0;
        } else {
            superv = 1;
        }
        try {

            if (buscarMedico(numColegiado)) {
                exito = false;
            } else {

                String inser = "insert into medicos value (?,?,?,?,?,?,?,?);";

                Connection conexion = BD.conectar();
                PreparedStatement nuevo = conexion.prepareStatement(inser);
                nuevo.setString(1, numColegiado);
                nuevo.setString(2, nombre);
                nuevo.setString(3, apellidos);
                nuevo.setString(4, especialidad);
                nuevo.setString(5, sexo);
                nuevo.setString(6, foto);
                nuevo.setInt(7, superv);
                nuevo.setString(8, password);

                nuevo.execute();

                BD.desconectar(conexion);
                exito = true;
            }

        } catch (Exception e) {

            System.out.println(e.getMessage());
        }
        return exito;
    }
    */

     /**
     * 
     * Consulta para modificar un Medico
     *
     * @param numColegiado
     * @param nombre
     * @param apellidos
     * @param especialidad
     * @param sexo
     * @param password
     */
/*
    public void modificarMedico(String numColegiado, String nombre, String apellidos, String especialidad, String sexo, String password) {

        
        try {

            String upda = "update medicos set nombre='" + nombre + "', apellidos='" + apellidos + "',especialidad='" + especialidad + "',sexo='" + sexo + "',password='" + password + "' where nColegiado='" + numColegiado + "';";

            Connection conexion = BD.conectar();
            PreparedStatement nuevo = conexion.prepareStatement(upda);

            nuevo.execute();

            BD.desconectar(conexion);
        } catch (Exception e) {

            System.out.println(e.getMessage());
        }
        
    }
    */
     /**
     * 
     * Consulta para Modificar un Medico si eres supervisor
     *
     * @param numColegiado
     * @param nombre
     * @param apellidos
     * @param especialidad
     * @param sexo
     * @param supervisor
     * @param password
     * 
     */
    /*
    public void modificarMedicoS(String numColegiado, String nombre, String apellidos, String especialidad, String sexo, String supervisor, String password) {
        int superv;

        if (supervisor == "") {
            superv = 0;
        } else {
            superv = 1;
        }
        try {

            String upda = "update medicos set nombre='" + nombre + "', apellidos='" + apellidos + "',especialidad='" + especialidad + "',sexo='" + sexo + "',supervisor=" + superv + ",password='" + password + "' where nColegiado='" + numColegiado + "';";

            Connection conexion = BD.conectar();
            PreparedStatement nuevo = conexion.prepareStatement(upda);

            nuevo.execute();

            BD.desconectar(conexion);
        } catch (Exception e) {

            System.out.println(e.getMessage());
        }

    }
    */
     /**
     * 
     * Consulta para borrar un Medico
     *
     * 
     * @param numColegiado
     */
    
    /*
    public void borrarMedico(String numColegiado) {

        try {

            String upda = "delete from medicos where nColegiado='" + numColegiado + "';";

            Connection conexion = BD.conectar();
            PreparedStatement nuevo = conexion.prepareStatement(upda);

            nuevo.execute();

            BD.desconectar(conexion);
        } catch (Exception e) {

            System.out.println(e.getMessage());
        }

    }
    */
    
     /**
     * 
     * Metodo para Enviar un Email cuando cogemos una cita
     *
     * 
     * @param CorreoTo
     * @param NombreP
     * @param ApellidosP
     * @param FechaC
     * @param HoraC
     * @param nombreMedico
     * @param apellidosMedico
     */
/*
    public void setEnviarEmail(String CorreoTo, String NombreP, String ApellidosP, String FechaC, String HoraC, String nombreMedico,String apellidosMedico) {
         
        String CorreoFrom="clinicaCastilleja@hotmail.com";
         
        Properties p = new Properties();
         
        //Servidor smtp de correo
        p.setProperty("mail.smtp.host", "smtp-mail.outlook.com");
        // Usar TLS
        p.setProperty("mail.smtp.starttls.enable", "true");
        // puerto del servidor smtp
        p.setProperty("mail.smtp.port", "587");
        // Usuario smtp
        p.setProperty("mail.smtp.user", CorreoFrom);
        // Autenticación requerida
        p.setProperty("mail.smtp.auth", "true");
        // Obtenemos la sesión
        Session sesion = Session.getDefaultInstance(p);
        sesion.setDebug(false);
        // Creamos el mensaje
        MimeMessage mensaje = new MimeMessage(sesion);
        // Y establecemos sus propiedades
        System.out.println(p);
        try {
            mensaje.setFrom(new InternetAddress(CorreoFrom));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(CorreoTo));
            mensaje.setSubject("Cita Medico");
            mensaje.setText("Hola Sr/a "+NombreP+" "+ApellidosP+" tiene una cita con el Doctor/a "+nombreMedico+" "+apellidosMedico+", el dia "+FechaC+" a las "+HoraC);
            // Enviamos el mensaje
            Transport t = sesion.getTransport("smtp");
            // Para conectarnos usamos usuario y password
            t.connect(CorreoFrom, "qwerty_1");
            t.sendMessage(mensaje, mensaje.getAllRecipients());
        } catch (MessagingException e) {
         System.out.println("try");
        }
    }
    */
    
    /**
     * 
     * Metodo para Enviar un Email cuando candelamos una cita
     *
     * 
     * @param CorreoTo
     * @param NombreP
     * @param ApellidosP
     * @param FechaC
     * @param HoraC
     * @param nombreMedico
     * @param apellidosMedico
     */
    
    /*
    public void CitaCancelada(String CorreoTo, String NombreP, String ApellidosP, String FechaC, String HoraC, String nombreMedico,String apellidosMedico){
      
      String CorreoFrom="clinicaCastilleja@hotmail.com";

      Properties p = new Properties();
      // Servidor smtp de correo
      p.setProperty("mail.smtp.host", "smtp-mail.outlook.com");
      // Usar TLS
      p.setProperty("mail.smtp.starttls.enable", "true");
      // puerto del servidor smtp
      p.setProperty("mail.smtp.port", "587");
      // Usuario smtp
      p.setProperty("mail.smtp.user", CorreoFrom);
      // Autenticación requerida
      p.setProperty("mail.smtp.auth", "true");
      // Obtenemos la sesión
      Session sesion = Session.getDefaultInstance(p);
      sesion.setDebug(false);
      // Creamos el mensaje
      MimeMessage mensaje = new MimeMessage(sesion);
      // Y establecemos sus propiedades
      try {
          
          mensaje.setFrom(new InternetAddress(CorreoFrom));
          mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(CorreoTo));
          mensaje.setSubject("Cita Medico");
          mensaje.setText("Lo sentimos Sr/a "+NombreP+" pero su cita del dia "+FechaC+" a las "+HoraC+" con el Doctor "+nombreMedico+" "+apellidosMedico+" ha sido cancelada");
          // Enviamos el mensaje
          Transport t = sesion.getTransport("smtp");
          // Para conectarnos usamos usuario y password
          t.connect(CorreoFrom, "qwerty_1");
          t.sendMessage(mensaje, mensaje.getAllRecipients());
      } catch (MessagingException e) {
          
          
          
      }
  }
    */

    /**
     * Consulta para recoger las citas reservadas de un medico
     * @param nColegiado
     * @return
     */
    /*
    public List<Citas> getCitas(String nColegiado) {
        List<Citas> citas = new LinkedList();
        Connection conexion = null;
        try {
            conexion = BD.conectar();
            Statement consulta = conexion.createStatement();
            ResultSet resultado = consulta.executeQuery("select * from citas where medico='" + nColegiado + "' and reservada=1;");

            while (resultado.next()) {

                Citas cita = new Citas();
                cita.hora = resultado.getTime("hora");
                cita.fecha = resultado.getDate("fecha");
                cita.reservada = resultado.getInt("reservada");
                citas.add(cita);
                
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            BD.desconectar(conexion);
        }
        return citas;
    }
    /*
    
   /**
     * 
     * Consulta para saber los medicos con citas libres
     *
     * 
     * @return lista de medicos con citas libres
     */
    
    /*
    public List<Medico> getMedicosLibres() {
        List<Medico> medicos = new LinkedList();
        try {
            Connection conexion = BD.conectar();
            Statement consulta = conexion.createStatement();
            ResultSet resultado = consulta.executeQuery("select medicos.nColegiado,nombre,apellidos,especialidad from medicos join citas on medicos.nColegiado=citas.medico where citas.reservada=0 group by medicos.nColegiado;");
            while (resultado.next()) {
                Medico medico = new Medico();
                medico.numColegiado = resultado.getString("medicos.nColegiado");
                medico.nombre = resultado.getString("nombre");
                medico.apellidos = resultado.getString("apellidos");
                medico.especialidad = resultado.getString("especialidad");
                medicos.add(medico);
            }
            BD.desconectar(conexion);
        } catch (SQLException e) {
        }
        return medicos;
    }
    */
    /**
     * 
     * Consulta para sacar un medico en concreto
     *
     * 
     * @param nColegiado
     * @return medico
     */
    /*
    public Medico sacarNombreMedico(String nColegiado) {
      Medico medico = new Medico();
      

      
        Connection con = BD.conectar();
        try {
            PreparedStatement ps = con.prepareStatement("select * from medicos where nColegiado=?");
            ps.setString(1, nColegiado);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                
                medico.numColegiado = res.getString("nColegiado");
                medico.nombre = res.getString("nombre");
                medico.apellidos = res.getString("apellidos");
                medico.especialidad = res.getString("especialidad");
                medico.sexo = res.getString("sexo");
                medico.foto = res.getString("foto");
                medico.supervisor = res.getInt("supervisor");
                medico.password = res.getString("password");
            }
            res.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            BD.desconectar(con);
        }
        return medico;
    }
    */
    /**
     * 
     * Consulta para borrar una cita
     *
     * 
     * @param fecha
     * @param hora
     * @param nColegiado
     */
    /*
    public void borrarCita(Date fecha, Time hora, String nColegiado) {

        try {

            String upda = "delete from citas where medico='" + nColegiado + "' and hora='"+hora+"' and fecha='"+fecha+"';";

            Connection conexion = BD.conectar();
            PreparedStatement del = conexion.prepareStatement(upda);

            del.execute();

            BD.desconectar(conexion);
        } catch (Exception e) {

            System.out.println(e.getMessage());
        }

    }
    */
}
