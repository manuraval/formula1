package utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BD {
	/**
     * Establece una conexion con la base de datos de la aplicación
     * @return la conexion
     */
    public static Connection conectar() {
        Connection conexion = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/formula1", "root", "root");
        } catch (SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        }
        return conexion;
    }
    
    /**
     * Cierra la conexión con la base de datos
     * @param conexion la conexión a cerrar
     */
    public static void desconectar(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
            }
            catch (Exception e) {}
        }
    }
}
