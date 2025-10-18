/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Member;
/**
 *
 * @author ADMIN
 */
public class MemberDAO extends DAO{
    public MemberDAO(){
        super();
    }
    public boolean checkEmailOrPhoneExists(String email, String phone) {
        String sql = "SELECT COUNT(*) FROM tblMember WHERE email = ? OR phone = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, phone);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // true nếu tồn tại ít nhất 1 bản ghi
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // mặc định nếu có lỗi
    }
    public Member checkLogin(String email, String password) {
        Member member = null;
        String sql = "SELECT * FROM tblMember WHERE email = ? AND password = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    member = new Member();
                    member.setId(rs.getString("id"));
                    member.setUserName(rs.getString("userName"));
                    member.setPassWord(rs.getString("password"));
                    member.setName(rs.getString("name"));
                    member.setBirthOfDay(rs.getDate("dateOfBirth"));
                    member.setEmail(rs.getString("email"));
                    member.setPhone(rs.getString("phone"));
                    member.setAddress(rs.getString("address"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return member; // null nếu sai tài khoản hoặc mật khẩu
    }

    
}
