/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author ADMIN
 */
public class CustomerDAO extends DAO{
    public CustomerDAO(){
        super();
    }
    public boolean registerAsMember(Customer customer) {
        String insertMemberSQL = "INSERT INTO tblMember (userName, password, name, dateOfBirth, email, phone, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String insertCustomerSQL = "INSERT INTO tblCustomer (tblMemberId, type) VALUES (?, ?)";

        PreparedStatement memberStmt = null;
        PreparedStatement customerStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // 1️⃣ Thêm vào bảng tblMember
            memberStmt = connection.prepareStatement(insertMemberSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            memberStmt.setString(1, customer.getUserName());
            memberStmt.setString(2, customer.getPassWord());
            memberStmt.setString(3, customer.getName());
            memberStmt.setDate(4, (Date) customer.getBirthOfDay());
            memberStmt.setString(5, customer.getEmail());
            memberStmt.setString(6, customer.getPhone());
            memberStmt.setString(7, customer.getAddress());
            int rowsInserted = memberStmt.executeUpdate();

            if (rowsInserted == 0) {
                connection.rollback();
                return false;
            }

            // Lấy id vừa tạo trong tblMember
            generatedKeys = memberStmt.getGeneratedKeys();
            int memberId = 0;
            if (generatedKeys.next()) {
                memberId = generatedKeys.getInt(1);
            } else {
                connection.rollback();
                return false;
            }

            // 2️⃣ Thêm vào bảng tblCustomer
            customerStmt = connection.prepareStatement(insertCustomerSQL);
            customerStmt.setInt(1, memberId);
            customerStmt.setString(2, customer.getType());
            customerStmt.executeUpdate();

            // 3️⃣ Commit transaction
            connection.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (memberStmt != null) memberStmt.close();
                if (customerStmt != null) customerStmt.close();
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
    
}
