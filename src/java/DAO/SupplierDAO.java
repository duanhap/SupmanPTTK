/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Supplier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class SupplierDAO extends DAO{
    
    public SupplierDAO(){
        super();
    }
    public List<Supplier> getSuplierByname(String name){
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "SELECT * FROM tblSupplier WHERE name LIKE ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setDescription(rs.getString("description"));
                suppliers.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
        }
}
