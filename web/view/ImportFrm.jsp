<%-- 
    Document   : ImportFrm.jsp
    Created on : Sep 30, 2025, 6:30:49 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Supplier"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.google.gson.Gson" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import from Supplier - Warehouse Management</title>
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
            text-decoration: none;   /* bỏ gạch chân */
            color: inherit;  
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

        .section {
            margin-bottom: 35px;
            padding: 25px;
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #fafbfc;
        }

        .section-title {
            font-size: 18px;
            margin-bottom: 20px;
            color: var(--secondary);
            display: flex;
            align-items: center;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-light);
        }

        .section-title i {
            margin-right: 10px;
            color: var(--primary);
        }

        .search-form {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            align-items: flex-end;
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

        .btn-danger {
            background: linear-gradient(135deg, var(--accent) 0%, #c0392b 100%);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: white;
            border-radius: 8px;
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

        .quantity-input, .price-input {
            width: 100px;
            padding: 8px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }

        .price-input {
            text-align: right;
        }

        .total-amount {
            font-weight: bold;
            color: var(--success);
        }

        .action-cell {
            text-align: center;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: var(--gray);
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 15px;
            color: #bdc3c7;
        }

        .summary-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 8px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .summary-total {
            font-size: 18px;
            font-weight: bold;
            color: var(--primary-dark);
            border-bottom: none;
            margin-top: 10px;
            padding-top: 15px;
            border-top: 2px solid var(--primary);
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
<!--            <div class="nav-item">
                <i class="fas fa-home"></i>
                <span>Dashboard</span>
            </div>-->
            <a href="HomeServlet" class="nav-item">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
             </a>
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
                <input type="text" placeholder="Search products, orders, suppliers...">
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
                    <h2><i class="fas fa-arrow-down"></i> Import Products from Supplier</h2>
                    <p>Add new products to your inventory from suppliers</p>
                </div>
                
                <div class="form-content">
                    <!-- Supplier Selection Section -->
                    <div class="section">
                        <h3 class="section-title">
                            <i class="fas fa-truck-loading"></i> Select Supplier
                        </h3>
                       
                        <form action="SearchSupplierServlet" method="get" class="search-form">
                            <div class="form-group">
                                <label for="supplierSearch">Search Supplier</label>
                                <input type="text" name="keyword" id="supplierSearch" class="form-control" placeholder="Enter supplier name or ID..."required>
                            </div>
                            <button type="submit" class="btn btn-primary" id="searchSupplierBtn">
                                <i class="fas fa-search"></i> Search
                            </button>
                        </form>

                        <!-- Selected Supplier Display -->
                        <div id="selectedSupplier" style="display: none;">
                            <h4 style="margin-bottom: 15px; color: var(--primary);">Selected Supplier</h4>
                            <table>
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
                                <tbody id="supplierTableBody">
                                    <!-- Supplier data will be populated here -->
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Empty State for Supplier -->
                        <div id="supplierEmptyState" class="empty-state">
                            <i class="fas fa-truck"></i>
                            <h4>No Supplier Selected</h4>
                            <p>Please search and select a supplier to continue</p>
                        </div>
                    </div>
                    
                    <!-- Product Import Section -->
                    <div class="section">
                        <h3 class="section-title">
                            <i class="fas fa-boxes"></i> Import Products
                        </h3>
                        
                        <form action="SearchProductServlet" method="get" class="search-form">
                            <div class="form-group">
                                <label for="productSearch">Search Product</label>
                                <input type="text" name="keyword" id="productSearch" class="form-control" placeholder="Enter product name or ID..."required>
                            </div>
                            <button type="submit" class="btn btn-primary" id="searchProductBtn">
                                <i class="fas fa-search"></i> Search
                            </button>
<!--                            <button type="button" class="btn btn-success" id="addNewProductBtn">
                                <i class="fas fa-plus"></i> Add New Product
                            </button>-->
                        </form>
                        
                        <!-- Products Table -->
                        <div id="productsTable">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Unit</th>
                                        <th>Quantity</th>
                                        <th>Unit Price (VND)</th>
                                        <th>Total (VND)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="productTableBody">
                                   
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Empty State for Products -->
                        <div id="productsEmptyState" class="empty-state">
                            <i class="fas fa-box-open"></i>
                            <h4>No Products Added</h4>
                            <p>Search and add products to create an import order</p>
                        </div>
                        
                        <!-- Summary Section -->
                        <div class="summary-section">
                            <div class="summary-row">
                                <span>Subtotal:</span>
                                <span id="subtotalAmount">0 VND</span>
                            </div>
                            <div class="summary-row">
                                <span>Tax (0%):</span>
                                <span id="taxAmount">0 VND</span>
                            </div>
                            <div class="summary-row summary-total">
                                <span>Total Amount:</span>
                                <span id="totalAmount">0 VND</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Submit Section -->
                    <div style="text-align: center; margin-top: 30px;">
                        <button type="button" class="btn btn-success" id="createReceiptBtn" style="padding: 15px 40px; font-size: 16px;">
                            <i class="fas fa-file-invoice"></i> Create Import Receipt
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        Supplier supplier = (Supplier) session.getAttribute("selectedSupplier");
        List<Product> selectedProducts = (List<Product>) session.getAttribute("selectedProducts");

        Gson gson = new Gson();
    %>
    <script>
       
        let selectedSupplier = <%= (supplier != null ? gson.toJson(supplier) : "null") %>;
        let importedProducts = <%= (selectedProducts != null ? gson.toJson(selectedProducts) : "[]") %>;

        console.log("Selected Supplier:", selectedSupplier);
        console.log("Imported Products:", importedProducts);

        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            updateUI();
            // Create receipt button event
            document.getElementById('createReceiptBtn').addEventListener('click', function() {
               if (!selectedSupplier) {
                    alert('Please select a supplier first');
                    return;
                }

                if (importedProducts.length === 0) {
                    alert('Please add at least one product to import');
                    return;
                }

                fetch('ImportServlet?action=createImportReceipt', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        alert('Import receipt created successfully!');
                        window.location.href = 'ImportReceiptServlet';
                    } else {
                        alert('Error: ' + data.message);
                    }
                })
                .catch(err => console.error('Create receipt error:', err));
            });
        });
        function updateUI() {
            // Update supplier display
            if (selectedSupplier) {
                document.getElementById('selectedSupplier').style.display = 'block';
                document.getElementById('supplierEmptyState').style.display = 'none';
                
                const supplierTableBody = document.getElementById('supplierTableBody');
                const initials = selectedSupplier.name.split(' ').map(word => word[0]).join('').toUpperCase();
               supplierTableBody.innerHTML = `
                <tr>
                    <td><strong>ID: S\${selectedSupplier.id.toString().padStart(4, '0')}</strong></td>
                    <td>
                        <div class="supplier-info">
                            <div class="supplier-avatar">\${initials.substring(0, 2)}</div>
                            <div class="supplier-details">
                                <h4>\${selectedSupplier.name}</h4>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="contact-info">
                            <span class="phone-number">\${selectedSupplier.phone}</span>
                            <span class="email-address">\${selectedSupplier.email}</span>
                        </div>
                    </td>
                    <td>\${selectedSupplier.address}</td>
                    <td>
                        <div class="description-text">
                            \${selectedSupplier.description || 'No description available'}
                        </div>
                    </td>
                    <td class="action-cell">
                        <button class="btn btn-danger" onclick="deselectSupplier()">
                            <i class="fas fa-times"></i> Remove
                        </button>
                    </td>
                </tr>
                `;

            } else {
                document.getElementById('selectedSupplier').style.display = 'none';
                document.getElementById('supplierEmptyState').style.display = 'block';
            }
              // Update products display
            if (importedProducts.length > 0) {
                document.getElementById('productsTable').style.display = 'block';
                document.getElementById('productsEmptyState').style.display = 'none';
                
                const productTableBody = document.getElementById('productTableBody');
                productTableBody.innerHTML = '';
                
                let subtotal = 0;
                
                importedProducts.forEach(product => {
                    const productTotal = product.inventoryQuantity * product.standardPrice;
                    subtotal += productTotal;
                    
                    productTableBody.innerHTML += `
                        <tr>
                            <td>
                                <strong>ID:P\${product.id.toString().padStart(4, '0')}</strong>
                            </td>   
                            <td>
                                <div class="product-info">
                                    <div class="product-details">
                                        <h4>\${product.name}</h4>
                                    </div>
                                </div>
                            </td>
                            <td>\${product.type}</td>
                            <td>\${product.unit}</td>
                            <td>
                                <input type="number" class="quantity-input" 
                                       value="\${product.inventoryQuantity}" min="1" 
                                       onchange="updateProductQuantity('\${product.id}', this.value)">
                            </td>
                            <td>
                                <input type="text" class="price-input" 
                                       value="\${formatCurrency(product.standardPrice)}"
                                       onchange="updateProductPrice('\${product.id}', this.value)">
                            </td>
                            <td class="total-amount">\${formatCurrency(productTotal)}</td>
                            <td class="action-cell">
                                <button class="btn btn-danger" onclick="removeProduct('\${product.id}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    `;
                });
                
                const tax = subtotal * 0.0;
                const total = subtotal + tax;
                
                document.getElementById('subtotalAmount').textContent = formatCurrency(subtotal);
                document.getElementById('taxAmount').textContent = formatCurrency(tax);
                document.getElementById('totalAmount').textContent = formatCurrency(total);
            } else {
                document.getElementById('productsTable').style.display = 'none';
                document.getElementById('productsEmptyState').style.display = 'block';
                
                document.getElementById('subtotalAmount').textContent = '0 VND';
                document.getElementById('taxAmount').textContent = '0 VND';
                document.getElementById('totalAmount').textContent = '0 VND';
            }
            
        }
        function updateProductQuantity(productId, newQuantity) {
            const product = importedProducts.find(p => p.id == productId);
            console.log("change quantity:", newQuantity);

            if (product) {
                 console.log("change quantity:", product);
                product.inventoryQuantity = parseInt(newQuantity) || 1;
                updateUI();
            }
        }
         function updateProductPrice(productId, newPrice) {
            const product = importedProducts.find(p => p.id == productId);
            console.log("change price:", newPrice);

            if (product) {
                console.log("change product before:", product);
                product.standardPrice = parseFloat(newPrice) || 1;
                console.log("change product after:", product);
                updateUI();
            }
        }

        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }

        function deselectSupplier() {
            fetch('ImportServlet?action=removeSupplier', { method: 'POST' })
                .then(() => {
                    selectedSupplier = null;
                    updateUI();
             });
        }
        function removeProduct(productId) {
            const product = { id: productId };
            if (confirm('Remove this product from the list?')) {
                fetch('ImportServlet?action=removeProduct', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(product)
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) window.location.reload();
                    else alert(data.message);
                });
            }
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
                if (pageName !== 'Import Products') {
                    alert(`Navigating to ${pageName}...`);
                }
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