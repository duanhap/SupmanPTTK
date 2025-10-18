package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

import utils.ConfigLoader;

public class DAO {
    protected Connection connection;

    public DAO() {
        try {
            Class.forName(ConfigLoader.getDriver());
            connection = DriverManager.getConnection(
                    ConfigLoader.getUrl(),
                    ConfigLoader.getUsername(),
                    ConfigLoader.getPassword()
            );
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connection to database failed");
        }
    }
    
}
