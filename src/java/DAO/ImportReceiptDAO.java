/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import model.ImportReceipt;
import model.ImportedProduct;

/**
 *
 * @author ADMIN
 */
public class ImportReceiptDAO extends DAO {
    public ImportReceiptDAO(){
        super();
    }
  

    public ImportReceipt createImportReceipt(ImportReceipt importReceipt) {
        String sqlInsertReceipt = "INSERT INTO tblImportReceipt ( tblWarehouseStaffId, tblSupplierId) VALUES (?, ?)";
        String sqlInsertProduct = "INSERT INTO tblImportedProduct (importedQuantity, importedPrice, tblImportReceiptId, tblProductId) VALUES (?, ?, ?, ?)";

        PreparedStatement stmtReceipt = null;
        PreparedStatement stmtProduct = null;

        try {
            connection.setAutoCommit(false); 

            // 1️⃣ Thêm phiếu nhập
            stmtReceipt = connection.prepareStatement(sqlInsertReceipt, Statement.RETURN_GENERATED_KEYS);
            stmtReceipt.setInt(1, Integer.parseInt(importReceipt.getWarehouseStaff().getId()));
            stmtReceipt.setInt(2, importReceipt.getSupplier().getId());
            stmtReceipt.executeUpdate();

            // Lấy id phiếu nhập vừa tạo
            ResultSet rsReceipt = stmtReceipt.getGeneratedKeys();
            int importReceiptId = 0;
            if (rsReceipt.next()) {
                importReceiptId = rsReceipt.getInt(1);
                importReceipt.setId(importReceiptId); // set ID mới cho đối tượng
            }
            System.out.println("List size = " + importReceipt.getListImportedProduct());
            stmtProduct = connection.prepareStatement(sqlInsertProduct);
            for (ImportedProduct ip : importReceipt.getListImportedProduct()) {
                System.out.println("Adding product: " + ip.getId());
                stmtProduct.setInt(1, ip.getImportQuantity());
                stmtProduct.setDouble(2, ip.getImportPrice());
                stmtProduct.setInt(3, importReceiptId);
                stmtProduct.setInt(4, ip.getId()); 
                stmtProduct.addBatch();
            }
            //stmtProduct.executeBatch();   // 2️⃣ Thêm từng sản phẩm chi tiết bằng batch
            int[] results = stmtProduct.executeBatch();
            System.out.println("Inserted rows: " + Arrays.toString(results));
         

            connection.commit(); // xác nhận transaction

    
            List<ImportedProduct> list = new ArrayList<>();
            String sqlSelectProducts = "SELECT * FROM tblImportedProduct WHERE tblImportReceiptId = ?";
            try (PreparedStatement stmtSelect = connection.prepareStatement(sqlSelectProducts)) {
                stmtSelect.setInt(1, importReceiptId);
                ResultSet rsSelect = stmtSelect.executeQuery();
                while (rsSelect.next()) {
                    ImportedProduct ip = new ImportedProduct();
                    for(ImportedProduct x :  importReceipt.getListImportedProduct()){
                        if(x.getId() == rsSelect.getInt("tblProductId")){
                            ip.setName(x.getName());
                            ip.setUnit(x.getUnit());
                        }
                    }
                    ip.setImportedProductID(rsSelect.getInt("id"));
                    ip.setImportQuantity(rsSelect.getInt("importedQuantity"));
                    ip.setImportPrice(rsSelect.getDouble("importedPrice"));
                    ip.setId(rsSelect.getInt("tblProductId"));
                    list.add(ip);
                }
            }
            importReceipt.setListImportedProduct(list);

            return importReceipt; 
        } catch (SQLException e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback(); 
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return null;
        } finally {
            try {
                if (stmtProduct != null) stmtProduct.close();
                if (stmtReceipt != null) stmtReceipt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
}

