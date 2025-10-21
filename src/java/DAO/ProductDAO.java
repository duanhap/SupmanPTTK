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
import model.ImportedProduct;

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
        public boolean updateProduct(List<ImportedProduct> importedProducts) {
        String selectSql = "SELECT inventoryQuantity FROM tblProduct WHERE id = ?";
        String updateSql = "UPDATE tblProduct SET inventoryQuantity = ? WHERE id = ?";

        try (
            PreparedStatement selectStmt = connection.prepareStatement(selectSql);
            PreparedStatement updateStmt = connection.prepareStatement(updateSql)
        ) {
            for (ImportedProduct importedProduct : importedProducts) {
                int productId = importedProduct.getId();
                int importQuantity = importedProduct.getImportQuantity();

                // Lấy số lượng hiện tại trong kho
                selectStmt.setInt(1, productId);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        int currentQuantity = rs.getInt("inventoryQuantity");
                        int newQuantity = currentQuantity + importQuantity;

                        // Cập nhật số lượng mới
                        updateStmt.setInt(1, newQuantity);
                        updateStmt.setInt(2, productId);
                        updateStmt.executeUpdate();
                    } else {
                        System.out.println("Không tìm thấy sản phẩm có id = " + productId);
                    }
                }
            }

            return true;
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
