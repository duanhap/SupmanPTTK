/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Customer;

/**
 *
 * @author ADMIN
 */
public class RegisterDAO {
    private MemberDAO memberDAO;
    private CustomerDAO customerDAO;

    public RegisterDAO() {
        this.memberDAO = new MemberDAO();
        this.customerDAO = new CustomerDAO();
    }

    public boolean registerCustomer(Customer customer) {
        try {
            // 1️⃣ Kiểm tra email hoặc phone đã tồn tại chưa
            boolean exists = memberDAO.checkEmailOrPhoneExists(customer.getEmail(), customer.getPhone());
            if (exists) {
                System.out.println("❌ Email hoặc số điện thoại đã tồn tại!");
                return false;
            }

            // 2️⃣ Nếu chưa tồn tại → tiến hành đăng ký
            boolean registered = customerDAO.registerAsMember(customer);
            if (registered) {
                System.out.println("✅ Đăng ký thành công!");
                return true;
            } else {
                System.out.println("❌ Lỗi khi thêm khách hàng mới!");
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
