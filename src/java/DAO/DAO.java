package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import utils.ConfigLoader;

public class DAO {
    protected Connection connection;

    public DAO() {
        try {
            Class.forName(ConfigLoader.getDriver());
            this.connection = DriverManager.getConnection(
                    ConfigLoader.getUrl(),
                    ConfigLoader.getUsername(),
                    ConfigLoader.getPassword()
            );
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
}
