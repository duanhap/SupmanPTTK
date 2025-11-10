<%-- 
    Document   : ImportReceiptFrm
    Created on : Sep 30, 2025, 11:45:04 PM
    Author     : ADMIN
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.ImportReceipt"%>
<%@page import="model.ImportedProduct"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ImportReceipt importReceipt = (ImportReceipt) session.getAttribute("createdReceipt");
    if (importReceipt == null) {
        response.sendRedirect("ImportFrm.jsp");
        return;
    }
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    Date now = new Date();
    
    // Helper method to format currency
    NumberFormat currencyFormatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Receipt - Warehouse Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary: #3498db;
            --primary-dark: #2980b9;
            --primary-light: #5dade2;
            --secondary: #2c3e50;
            --accent: #e74c3c;
            --success: #27ae60;
            --warning: #f39c12;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --gray: #7f8c8d;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles - GIỮ NGUYÊN */
        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-header h1 {
            font-size: 20px;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar-header h1 i {
            margin-right: 10px;
        }

        .sidebar-header p {
            font-size: 14px;
            opacity: 0.8;
        }

        .user-info {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: var(--primary);
            font-weight: bold;
        }

        .nav-menu {
            padding: 20px 0;
        }

        .nav-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            cursor: pointer;
            border-left: 3px solid transparent;
        }

        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 3px solid white;
        }

        .nav-item.active {
            background-color: rgba(255, 255, 255, 0.15);
            border-left: 3px solid white;
        }

        .nav-item i {
            margin-right: 10px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .top-bar {
            background-color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .search-bar {
            display: flex;
            align-items: center;
            background-color: var(--light);
            border-radius: 20px;
            padding: 8px 15px;
            width: 300px;
        }

        .search-bar input {
            border: none;
            background: transparent;
            margin-left: 10px;
            width: 100%;
            outline: none;
        }

        .top-bar-actions {
            display: flex;
            align-items: center;
        }

        .notification-icon, .logout-btn {
            margin-left: 20px;
            cursor: pointer;
            position: relative;
        }

        .notification-icon i {
            font-size: 20px;
            color: var(--gray);
        }

        .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--accent);
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: background-color 0.3s;
        }

        .logout-btn:hover {
            background-color: var(--primary-dark);
        }

        .logout-btn i {
            margin-right: 5px;
        }

        .content-area {
            padding: 30px;
            flex: 1;
        }

        /* PHIẾU NHẬP HÀNG MỚI - THIẾT KẾ ĐƠN GIẢN */
        .receipt-container {
            max-width: 100%;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        .receipt-header {
            padding: 20px;
            text-align: center;
            border-bottom: 2px solid #000;
        }

        .receipt-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .receipt-subtitle {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .receipt-number {
            font-size: 16px;
            font-weight: bold;
        }

        .receipt-body {
            padding: 0;
        }

        .receipt-section {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
        }

        .section-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
            border-bottom: 1px solid #000;
            padding-bottom: 5px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .info-item {
            display: flex;
            margin-bottom: 8px;
        }

        .info-label {
            font-weight: bold;
            min-width: 150px;
        }

        .info-value {
            flex: 1;
        }

        .products-table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
            font-size: 14px;
        }

        .products-table th {
            background: #f0f0f0;
            padding: 8px;
            text-align: center;
            font-weight: bold;
            border: 1px solid #000;
        }

        .products-table td {
            padding: 8px;
            border: 1px solid #000;
            text-align: center;
        }

        .text-left {
            text-align: left;
        }

        .text-right {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        .totals-section {
            margin-top: 15px;
            border: 1px solid #000;
            padding: 10px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
        }

        .total-final {
            font-weight: bold;
            border-top: 1px solid #000;
            margin-top: 5px;
            padding-top: 8px;
        }

        .signatures {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 30px;
        }

        .signature-box {
            text-align: center;
        }

        .signature-line {
            border-bottom: 1px solid #000;
            padding: 30px 0 15px 0;
            margin-bottom: 5px;
        }

        .signature-label {
            font-weight: bold;
            font-size: 14px;
        }

        .signature-name {
            margin-top: 5px;
            font-weight: bold;
        }

        .receipt-footer {
            padding: 10px 20px;
            text-align: center;
            border-top: 1px solid #ddd;
            font-size: 12px;
            color: #666;
        }

        .action-buttons {
            text-align: center;
            padding: 15px;
            background: #f9f9f9;
            border-top: 1px solid #ddd;
        }

        .btn {
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            margin: 0 5px;
            font-size: 14px;
            background: white;
            color: #000;
        }

        .btn i {
            margin-right: 5px;
        }

        .btn:hover {
            background: #f0f0f0;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            border: 1px solid var(--primary);
        }

        .btn-primary:hover {
            background: var(--primary-dark);
        }

        /* Print Styles */
        @media print {
            body * {
                visibility: hidden;
            }
            .main-content, .main-content * {
                visibility: visible;
            }
            .main-content {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                padding: 0;
            }
            .receipt-container {
                box-shadow: none;
                border: none;
                margin: 0;
            }
            .action-buttons, .top-bar, .sidebar {
                display: none !important;
            }
        }

        @media (max-width: 992px) {
            body {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
            }
        }

        @media (max-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .signatures {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                display: flex;
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                margin: 5px 0;
            }
            
            .products-table {
                font-size: 12px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Sidebar - GIỮ NGUYÊN -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1><i class="fas fa-store"></i> E-SuperMan Warehouse</h1>
            <p>Management System</p>
        </div>
        
        <div class="user-info">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="user-details">
                <h3>Warehouse Staff</h3>
                <p>Last login: Today</p>
            </div>
        </div>
        
        <div class="nav-menu">
            <div class="nav-item">
                <i class="fas fa-home"></i>
                <span>Dashboard</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-boxes"></i>
                <span>Product Management</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-truck-loading"></i>
                <span>Supplier Management</span>
            </div>
            <div class="nav-item active">
                <i class="fas fa-arrow-down"></i>
                <span>Import Products</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-clipboard-check"></i>
                <span>Approve Orders</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-shipping-fast"></i>
                <span>Dispatch Orders</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-chart-bar"></i>
                <span>Reports & Analytics</span>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="top-bar">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search receipts, products...">
            </div>
            
            <div class="top-bar-actions">
                <div class="notification-icon">
                    <i class="fas fa-bell"></i>
                    <span class="notification-count">3</span>
                </div>
                <button class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </button>
            </div>
        </div>
        
        <div class="content-area">
            <!-- PHIẾU NHẬP HÀNG MỚI -->
            <div class="receipt-container">
                <!-- Receipt Header -->
                <div class="receipt-header">
                    <div class="receipt-number">Mã phiếu: R<%= String.format("%04d", importReceipt.getId()) %></div>
                    <div class="receipt-title">PHIẾU NHẬP HÀNG</div>
                    <div class="receipt-subtitle">IMPORT RECEIPT</div>
                </div>

                <!-- Receipt Body -->
                <div class="receipt-body">
                    <!-- Basic Information -->
                    <div class="receipt-section">
                        <div class="section-title">THÔNG TIN PHIẾU NHẬP</div>
                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Ngày lập:</span>
                                <span class="info-value"><%= importReceipt.getDate() != null ? dateFormat.format(importReceipt.getDate()) : dateFormat.format(now) %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Giờ lập:</span>
                                <span class="info-value"><%= timeFormat.format(now) %></span>
                            </div>
<!--                            <div class="info-item">
                                <span class="info-label">Mã nhà cung cấp:</span>
                                <span class="info-value">S<%= String.format("%04d", importReceipt.getSupplier().getId()) %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Mã nhân viên:</span>
                                <span class="info-value"><%= importReceipt.getWarehouseStaff().getId() %></span>
                            </div>-->
                        </div>
                    </div>

                    <!-- Supplier Information -->
                    <div class="receipt-section">
                        <div class="section-title">THÔNG TIN NHÀ CUNG CẤP</div>
                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Tên NCC:</span>
                                <span class="info-value"><%= importReceipt.getSupplier().getName() %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Điện thoại:</span>
                                <span class="info-value"><%= importReceipt.getSupplier().getPhone() != null ? importReceipt.getSupplier().getPhone() : "N/A" %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Email:</span>
                                <span class="info-value"><%= importReceipt.getSupplier().getEmail() != null ? importReceipt.getSupplier().getEmail() : "N/A" %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Địa chỉ:</span>
                                <span class="info-value"><%= importReceipt.getSupplier().getAddress() != null ? importReceipt.getSupplier().getAddress() : "N/A" %></span>
                            </div>
                        </div>
                    </div>

                    <!-- Imported Products -->
                    <div class="receipt-section">
                        <div class="section-title">DANH SÁCH SẢN PHẨM NHẬP</div>
                        <% 
                            if (importReceipt.getListImportedProduct() != null && !importReceipt.getListImportedProduct().isEmpty()) { 
                                int stt = 1;
                                double totalAmount = 0;
                        %>
                            <table class="products-table">
                                <thead>
                                    <tr>
                                        <th width="5%">STT</th>
                                        <th width="15%">Mã SP</th>
                                        <th class="text-left">Tên sản phẩm</th>
                                        <th width="10%">ĐVT</th>
                                        <th width="10%">Số lượng</th>
                                        <th width="15%">Đơn giá</th>
                                        <th width="15%">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        for (ImportedProduct product : importReceipt.getListImportedProduct()) { 
                                            double itemTotal = product.getImportPrice() * product.getImportQuantity();
                                            totalAmount += itemTotal;
                                    %>
                                        <tr>
                                            <td><%= stt++ %></td>
                                            <td>IP<%= String.format("%04d", product.getImportedProductID()) %></td>
                                            <td class="text-left"><%= product.getName() %></td>
                                            <td><%= product.getUnit() != null ? product.getUnit() : "Cái" %></td>
                                            <td><%= product.getImportQuantity() %></td>
                                            <td class="text-right"><%= currencyFormatter.format(product.getImportPrice()) %> ₫</td>
                                            <td class="text-right"><%= currencyFormatter.format(itemTotal) %> ₫</td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            
                            <!-- Totals -->
                            <div class="totals-section">
                                <div class="total-row">
                                    <span>Tổng tiền hàng:</span>
                                    <span><%= currencyFormatter.format(totalAmount) %> ₫</span>
                                </div>
                                <div class="total-row">
                                    <span>Thuế VAT (0%):</span>
                                    <span><%= currencyFormatter.format(0) %> ₫</span>
                                </div>
                                <div class="total-row total-final">
                                    <span>TỔNG CỘNG:</span>
                                    <span><%= currencyFormatter.format(totalAmount) %> ₫</span>
                                </div>
                            </div>
                        <% } else { %>
                            <p style="text-align: center; padding: 20px;">Không có sản phẩm nào được nhập</p>
                        <% } %>
                    </div>

                    <!-- Staff Information -->
                    <div class="receipt-section">
                        <div class="section-title">THÔNG TIN NHÂN VIÊN</div>
                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Tên nhân viên:</span>
                                <span class="info-value"><%= importReceipt.getWarehouseStaff().getName() %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Điện thoại:</span>
                                <span class="info-value"><%= importReceipt.getWarehouseStaff().getPhone() != null ? importReceipt.getWarehouseStaff().getPhone() : "N/A" %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Email:</span>
                                <span class="info-value"><%= importReceipt.getWarehouseStaff().getEmail() != null ? importReceipt.getWarehouseStaff().getEmail() : "N/A" %></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Phòng ban:</span>
                                <span class="info-value">Quản lý kho</span>
                            </div>
                        </div>
                    </div>

                    <!-- Signatures -->
                    <div class="receipt-section">
                        <div class="signatures">
                            <div class="signature-box">
                                <div class="signature-line"></div>
                                <div class="signature-label">NGƯỜI LẬP PHIẾU</div>
                                <div class="signature-name"><%= importReceipt.getWarehouseStaff().getName() %></div>
                                <div class="signature-label">(Ký, ghi rõ họ tên)</div>
                            </div>
                            <div class="signature-box">
                                <div class="signature-line"></div>
                                <div class="signature-label">NHÀ CUNG CẤP</div>
                                <div class="signature-name"><%= importReceipt.getSupplier().getName() %></div>
                                <div class="signature-label">(Ký, ghi rõ họ tên)</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="receipt-footer">
                    <p>Hệ thống quản lý siêu thị điện tử E-SuperMan | Email: support@esuperman.com | Hotline: 1900 1234</p>
                    <p>Phiếu này có giá trị như một chứng từ nhập kho hợp lệ</p>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons">
                    <a href="ImportServlet" class="btn">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                    <button type="button" class="btn btn-primary" onclick="printReceipt()">
                        <i class="fas fa-print"></i> In phiếu
                    </button>
                    <button type="button" class="btn" onclick="saveAsPDF()">
                        <i class="fas fa-file-pdf"></i> Lưu PDF
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Print function
        function printReceipt() {
            window.print();
        }

        // PDF save function
        function saveAsPDF() {
            alert('Tính năng lưu PDF sẽ được triển khai sau');
        }

        // Navigation functionality
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.nav-item').forEach(nav => {
                    nav.classList.remove('active');
                });
                this.classList.add('active');
                
                // In a real application, this would navigate to the selected page
                const pageName = this.querySelector('span').textContent;
                alert(`Navigating to ${pageName}...`);
            });
        });

        // Logout functionality
        document.querySelector('.logout-btn').addEventListener('click', function() {
            if (confirm('Are you sure you want to logout?')) {
                alert('Logging out...');
                // In a real application, this would redirect to logout endpoint
            }
        });
    </script>
</body>
</html>