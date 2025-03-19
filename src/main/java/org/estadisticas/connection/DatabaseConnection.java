package org.estadisticas.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:sqlserver://DESKTOP-JN75E27:1433;databaseName=ESTADISTICAS;integratedSecurity=true;encrypt=false;trustServerCertificate=true";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }

    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            System.out.println("Conexión exitosa a SQL Server.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
