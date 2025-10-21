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
        String sqlInsertReceipt = "INSERT INTO tblImportReceipt (totalPrice, tblWarehouseStaffId, tblSupplierId) VALUES (?, ?, ?)";
        String sqlInsertProduct = "INSERT INTO tblImportedProduct (importedQuantity, importedPrice, tblImportReceiptId, tblProductId) VALUES (?, ?, ?, ?)";

        PreparedStatement stmtReceipt = null;
        PreparedStatement stmtProduct = null;

        try {
            connection.setAutoCommit(false); // bắt đầu transaction

            // 1️⃣ Thêm phiếu nhập
            stmtReceipt = connection.prepareStatement(sqlInsertReceipt, Statement.RETURN_GENERATED_KEYS);
            stmtReceipt.setDouble(1, importReceipt.getTotalPrice());
            stmtReceipt.setInt(2, Integer.parseInt(importReceipt.getWarehouseStaff().getId()));
            stmtReceipt.setInt(3, importReceipt.getSupplier().getId());
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
                stmtProduct.setInt(4, ip.getId()); // đây là ID sản phẩm từ bảng Product
                stmtProduct.addBatch();
            }
            //stmtProduct.executeBatch();   // 2️⃣ Thêm từng sản phẩm chi tiết bằng batch
            int[] results = stmtProduct.executeBatch();
            System.out.println("Inserted rows: " + Arrays.toString(results));
         

            connection.commit(); // xác nhận transaction

            // 3️⃣ Select lại tất cả sản phẩm vừa insert để trả về full object
            List<ImportedProduct> list = new ArrayList<>();
            String sqlSelectProducts = "SELECT * FROM tblImportedProduct WHERE tblImportReceiptId = ?";
            try (PreparedStatement stmtSelect = connection.prepareStatement(sqlSelectProducts)) {
                stmtSelect.setInt(1, importReceiptId);
                ResultSet rsSelect = stmtSelect.executeQuery();
                while (rsSelect.next()) {
                    ImportedProduct ip = new ImportedProduct();
                    ip.setImportQuantity(rsSelect.getInt("importedQuantity"));
                    ip.setImportPrice(rsSelect.getDouble("importedPrice"));
                    ip.setId(rsSelect.getInt("tblProductId"));
                    list.add(ip);
                }
            }
            importReceipt.setListImportedProduct(list);

            return importReceipt; // trả về đối tượng đầy đủ

        } catch (SQLException e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback(); // rollback nếu lỗi
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

//        String sqlInsertReceipt = "INSERT INTO tblImportReceipt (totalPrice, date, tblWarehouseStaffId, tblSupplierId) VALUES (?, ?, ?, ?)";
//        String sqlInsertProduct = "INSERT INTO tblImportedProduct (importedQuantity, importedPrice, tblImportReceiptId, tblProductId) VALUES (?, ?, ?, ?)";
//
//        
//        PreparedStatement stmtReceipt = null;
//        PreparedStatement stmtProduct = null;
//
//        try {
//            connection.setAutoCommit(false); // bắt đầu transaction
//
//            // 1️⃣ Thêm phiếu nhập
//            stmtReceipt = connection.prepareStatement(sqlInsertReceipt, Statement.RETURN_GENERATED_KEYS);
//            stmtReceipt.setDouble(1, importReceipt.getTotalPrice());
//            stmtReceipt.setDate(2, new Date(importReceipt.getDate().getTime()));
//            stmtReceipt.setInt(3, Integer.parseInt(importReceipt.getWarehouseStaff().getId()));
//            stmtReceipt.setInt(4, importReceipt.getSupplier().getId());
//            stmtReceipt.executeUpdate();
//
//            // Lấy id phiếu nhập vừa tạo
//            ResultSet rs = stmtReceipt.getGeneratedKeys();
//            int importReceiptId = 0;
//            if (rs.next()) {
//                importReceiptId = rs.getInt(1);
//            }
//
//            // 2️⃣ Thêm từng sản phẩm chi tiết
//            stmtProduct = connection.prepareStatement(sqlInsertProduct);
//            for (ImportedProduct ip : importReceipt.getListImportedProduct()) {
//                stmtProduct.setInt(1, ip.getImportQuantity());
//                stmtProduct.setDouble(2, ip.getImportPrice());
//                stmtProduct.setInt(3, importReceiptId);
//                stmtProduct.setInt(4, ip.getId());
//                stmtProduct.addBatch();
//            }
//            stmtProduct.executeBatch();
//
//            connection.commit(); // xác nhận transaction
//            return true;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            if (connection != null) {
//                try {
//                    connection.rollback(); // rollback nếu lỗi
//                } catch (SQLException ex) {
//                    ex.printStackTrace();
//                }
//            }
//            return false;
//        } finally {
//            try {
//                if (stmtProduct != null) stmtProduct.close();
//                if (stmtReceipt != null) stmtReceipt.close();
//                if (connection != null) connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }