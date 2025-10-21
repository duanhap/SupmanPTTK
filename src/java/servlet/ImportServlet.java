/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import DAO.ImportReceiptDAO;
import DAO.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.ImportReceipt;
import model.ImportedProduct;
import model.Member;
import model.Product;
import model.Staff;
import model.Supplier;
import model.WarehouseStaff;



/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ImportServlet", urlPatterns = {"/ImportServlet"})
public class ImportServlet extends HttpServlet {
    private Gson gson = new Gson();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Chạy vào rồi");
        RequestDispatcher rd = request.getRequestDispatcher("view/ImportFrm.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // Đọc JSON body (nếu có)
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            jsonBuilder.append(line);
        }
        String json = jsonBuilder.toString();

        switch (action) {

            case "selectSupplier": {
                Supplier supplier = gson.fromJson(json, Supplier.class);
                session.setAttribute("selectedSupplier", supplier);
                response.getWriter().write("{\"success\": true, \"message\": \"Supplier selected\"}");
                break;
            }

            case "selectProduct": {
                Product product = gson.fromJson(json, Product.class);
                List<Product> productList = (List<Product>) session.getAttribute("selectedProducts");
                if (productList == null) {
                    productList = new ArrayList<>();
                }
              boolean exists = productList.stream().anyMatch(p -> p.getId() == product.getId());

                if (!exists) {
                    productList.add(product);
                }
                session.setAttribute("selectedProducts", productList);
                response.getWriter().write("{\"success\": true, \"message\": \"Product added\"}");
                break;
            }

            case "removeSupplier": {
                session.removeAttribute("selectedSupplier");
                response.getWriter().write("{\"success\": true, \"message\": \"Supplier removed\"}");
                break;
            }

            case "removeProduct": {
                    Product product = gson.fromJson(json, Product.class);
               List<Product> productList = (List<Product>) session.getAttribute("selectedProducts");
               if (productList != null) {
                   productList.removeIf(p -> p.getId() == product.getId());
                   session.setAttribute("selectedProducts", productList);
               }
               response.getWriter().write("{\"success\": true, \"message\": \"Product removed\"}");
               break;
            }
            case "createImportReceipt": {
                Supplier supplier = (Supplier) session.getAttribute("selectedSupplier");
                List<Product> productList = (List<Product>) session.getAttribute("selectedProducts");

                if (supplier == null || productList == null || productList.isEmpty()) {
                    response.getWriter().write("{\"success\": false, \"message\": \"Missing supplier or products\"}");
                    return;
                }

              

                // TODO: thay bằng user đăng nhập hiện tại
                Member member = (Member) session.getAttribute("member");
                if (member == null) {
                    response.getWriter().write("{\"success\": false, \"message\": \"User not logged in\"}");
                    return;
                }

                // Nếu member chính là WarehouseStaff (hoặc có thể ép kiểu)
                WarehouseStaff staff =  new WarehouseStaff(new Staff(member)) ;
                System.out.println(staff.toString());
  
                double totalPrice = 0;
                List<ImportedProduct> importedList = new ArrayList<>();

                for (Product p : productList) {
                    ImportedProduct ip = new ImportedProduct(p,p.getInventoryQuantity(),p.getStandardPrice());
                    totalPrice += p.getStandardPrice() * p.getInventoryQuantity();
                    importedList.add(ip);
                }
                 // ✅ Tạo đối tượng ImportReceipt
                ImportReceipt receipt = new ImportReceipt();
                receipt.setSupplier(supplier);
                receipt.setWarehouseStaff(staff);
                receipt.setListImportedProduct(importedList);
                receipt.setTotalPrice(totalPrice);

                // ✅ Gọi DAO để lưu
                ImportReceiptDAO dao = new ImportReceiptDAO();
                ImportReceipt savedReceipt = dao.createImportReceipt(receipt);

                if (savedReceipt != null) {
                    // ✅ Cập nhật lại số lượng sản phẩm trong kho
                    ProductDAO productDAO = new ProductDAO();
                    boolean updated = productDAO.updateProduct(importedList);

                    if (!updated) {
                        System.out.println("⚠️ Lỗi khi cập nhật số lượng kho!");
                    }
                    // Xóa session tạm sau khi tạo xong
                    session.removeAttribute("selectedSupplier");
                    session.removeAttribute("selectedProducts");

                    // Lưu receipt mới tạo vào session (để sang trang hiển thị)
                    session.setAttribute("createdReceipt", savedReceipt);

                    response.getWriter().write("{\"success\": true, \"redirect\": \"HomeServlet\"}");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"Failed to create receipt\"}");
                }
                break;
        
            }

            default:
                response.getWriter().write("{\"success\": false, \"message\": \"Unknown action\"}");
        }
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
