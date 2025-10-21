<%-- 
    Document   : SearchSupplierFrm.jsp
    Created on : Sep 30, 2025, 6:48:32 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Supplier - Warehouse Management</title>
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

        /* Sidebar Styles */
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

        .user-details h3 {
            font-size: 16px;
            margin-bottom: 2px;
        }

        .user-details p {
            font-size: 12px;
            opacity: 0.8;
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

        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 25px 30px;
        }

        .page-header h2 {
            font-size: 24px;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
        }

        .page-header h2 i {
            margin-right: 12px;
        }

        .page-header p {
            opacity: 0.9;
            font-size: 14px;
        }

        .form-content {
            padding: 30px;
        }

        .search-section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            border: 1px solid #e9ecef;
        }

        .search-form {
            display: flex;
            gap: 15px;
            align-items: flex-end;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e5ee;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s;
            background: white;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }

        .btn i {
            margin-right: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, var(--success) 0%, #219653 100%);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
        }

        .btn-secondary {
            background: linear-gradient(135deg, var(--gray) 0%, #5d6d7e 100%);
            color: white;
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.3);
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }

        th {
            background: linear-gradient(135deg, var(--primary-light) 0%, var(--primary) 100%);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .action-cell {
            text-align: center;
        }

        .btn-sm {
            padding: 8px 15px;
            font-size: 12px;
        }

        .supplier-info {
            display: flex;
            align-items: center;
        }

        .supplier-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            color: white;
            font-weight: bold;
        }

        .supplier-details h4 {
            margin-bottom: 2px;
            color: var(--dark);
        }

        .supplier-details p {
            font-size: 12px;
            color: var(--gray);
        }

        .contact-info {
            display: flex;
            flex-direction: column;
        }

        .contact-info span {
            margin-bottom: 2px;
        }

        .phone-number {
            color: var(--primary);
            font-weight: 500;
        }

        .email-address {
            font-size: 12px;
            color: var(--gray);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--gray);
        }

        .empty-state i {
            font-size: 64px;
            margin-bottom: 20px;
            color: #bdc3c7;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: var(--dark);
        }

        .description-text {
            font-size: 13px;
            color: var(--gray);
            font-style: italic;
            margin-top: 5px;
        }

        @media (max-width: 992px) {
            body {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
            }
            
            .search-form {
                flex-direction: column;
            }
        }

        @media (max-width: 768px) {
            .action-buttons {
                flex-direction: column;
                width: 100%;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1><i class="fas fa-store"></i> E-Store Warehouse</h1>
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
            <div class="nav-item active">
                <i class="fas fa-truck-loading"></i>
                <span>Supplier Management</span>
            </div>
            <div class="nav-item">
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
                <input type="text" placeholder="Search suppliers, products...">
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
            <div class="container">
                <div class="page-header">
                    <h2><i class="fas fa-search"></i> Search Suppliers</h2>
                    <p>Find and select suppliers for your import operations</p>
                </div>
                
                <div class="form-content">
                    <!-- Search Section -->
                    <div class="search-section">
                            <form id="searchForm" class="search-form" action="SearchSupplierServlet" method="get">
                                <div class="form-group">
                                    <label for="searchTerm">Search Suppliers</label>
                                    <input type="text" id="searchTerm" name="keyword" class="form-control"
                                           placeholder="Enter supplier name or ID..."
                                           value="${keyword != null ? keyword : ''}">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-search"></i> Search
                                </button>
                            </form>

                        
                        <div class="action-buttons">
                            <a href="AddSupplierFrm.jsp" class="btn btn-success">
                                <i class="fas fa-plus"></i> Add New Supplier
                            </a>
                            <a href="ImportServlet" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Import
                            </a>
                        </div>
                    </div>
                    
                    <!-- Results Section -->
                    <div id="resultsSection">
                        <div class="results-count" id="resultsCount">Showing all suppliers</div>
                                              
                        <table id="suppliersTable">
                            <thead>
                                <tr>
                                    <th>Supplier ID</th>
                                    <th>Supplier Information</th>
                                    <th>Contact Details</th>
                                    <th>Address</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="suppliersTableBody">
                                <!-- Supplier data will be populated here -->
                      
                            </tbody>
                        </table>
                        
                        <!-- Empty State -->
                        <div id="emptyState" class="empty-state" style="display: none;">
                            <i class="fas fa-truck"></i>
                            <h3>No Suppliers Found</h3>
                            <p>Try adjusting your search terms or add a new supplier</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        // Khai báo suppliers với xử lý lỗi
     let suppliers = [];
     let filteredSuppliers = [];

     try {
         <c:if test="${not empty suppliers}">
         suppliers = [
             <c:forEach var="s" items="${suppliers}" varStatus="status">
             {
                 id: ${s.id},
                 name: "${fn:escapeXml(s.name)}",
                 address: "${fn:escapeXml(s.address)}",
                 phone: "${fn:escapeXml(s.phone)}",
                 email: "${fn:escapeXml(s.email)}",
                 description: "${fn:escapeXml(s.description)}"
             }<c:if test="${!status.last}">,</c:if>
             </c:forEach>
         ];
         </c:if>
         <c:if test="${empty suppliers}">
         suppliers = [];
         </c:if>

         console.log('Suppliers loaded:', suppliers);
         filteredSuppliers = [...suppliers];
     } catch (error) {
         console.error('Error initializing suppliers:', error);
         suppliers = [];
         filteredSuppliers = [];
     }

     document.addEventListener('DOMContentLoaded', function() {
         console.log('DOM ready - Suppliers:', suppliers);
         console.log('DOM ready - Filtered:', filteredSuppliers);

         // Hiển thị dữ liệu ngay lập tức
         displaySuppliers();


     });

 

     function displaySuppliers() {
         const tableBody = document.getElementById('suppliersTableBody');
         const emptyState = document.getElementById('emptyState');
         const resultsCount = document.getElementById('resultsCount');
         const table = document.getElementById('suppliersTable');

         console.log('Displaying suppliers count:', filteredSuppliers.length);

         resultsCount.textContent = `Showing \${filteredSuppliers.length} supplier\${filteredSuppliers.length !== 1 ? 's' : ''}`;

         if (filteredSuppliers.length === 0) {
             tableBody.innerHTML = '';
             table.style.display = 'none';
             emptyState.style.display = 'block';
             return;
         }

         table.style.display = 'table';
         emptyState.style.display = 'none';

         tableBody.innerHTML = '';

         filteredSuppliers.forEach(supplier => {
             console.log('Rendering supplier:', supplier);
             const id = "S"+ supplier.id.toString().padStart(4, '0')
             const row = document.createElement('tr');
             const initials = supplier.name ? supplier.name.split(' ').map(w => w[0]).join('').toUpperCase() : 'NA';

             row.innerHTML = `
                    <td>
                        <strong>ID: S\${supplier.id.toString().padStart(4, '0')}</strong>
                    </td>
                    <td>
                        <div class="supplier-info">
                            <div class="supplier-avatar">\${initials.substring(0, 2)}</div>
                            <div class="supplier-details">
                                <h4>\${supplier.name}</h4>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="contact-info">
                            <span class="phone-number">\${supplier.phone}</span>
                            <span class="email-address">\${supplier.email}</span>
                        </div>
                    </td>
                    <td>\${supplier.address}</td>
                    <td>
                        <div class="description-text">
                            \${supplier.description || 'No description available'}
                        </div>
                    </td>
                    <td class="action-cell">
                        <button class="btn btn-primary btn-sm" onclick="selectSupplier(\${supplier.id})">
                            <i class="fas fa-check"></i> Choose
                        </button>
                    </td>
                `;
             
             tableBody.appendChild(row);
         });
     }

        function selectSupplier(supplierId) {
            console.log('Selected supplier ID:', supplierId);
            const supplier = suppliers.find(s => s.id === supplierId);
            if (supplier && confirm(`Select \${supplier.name} as your supplier?`)) {
                fetch('ImportServlet?action=selectSupplier', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(supplier)
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        window.location.href = 'ImportServlet';
                    } else {
                        alert(data.message);
                    }
                })
                .catch(err => console.error('Error sending supplier:', err));
            }
        }

         // Navigation functionality
         document.querySelectorAll('.nav-item').forEach(item => {
             item.addEventListener('click', function() {
                 document.querySelectorAll('.nav-item').forEach(nav => {
                     nav.classList.remove('active');
                 });
                 this.classList.add('active');
             });
         });

         // Logout functionality
         document.querySelector('.logout-btn').addEventListener('click', function() {
             if (confirm('Are you sure you want to logout?')) {
                 alert('Logging out...');
             }
         });
    </script>
</body>
</html>