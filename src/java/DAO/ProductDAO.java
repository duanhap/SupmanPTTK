/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DAO{
    public  ProductDAO(){
        super();
    }
    public boolean updateProduct(Product product) {
        String sql = "UPDATE tblProduct SET name = ?, description = ?, unit = ?, inventoryQuantity = ?, type = ?, standardPrice = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setString(3, product.getUnit());
            stmt.setInt(4, product.getInventoryQuantity());
            stmt.setString(5, product.getType());
            stmt.setDouble(6, product.getStandardPrice());
            stmt.setInt(7, product.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Product> getProductByName(String name){
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM tblProduct WHERE name LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setUnit(rs.getString("unit"));
                p.setInventoryQuantity(rs.getInt("inventoryQuantity"));
                p.setType(rs.getString("type"));
                p.setStandardPrice(rs.getDouble("standardPrice"));
                products.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;

    }
    
}
