
<%-- 
    Document   : SearchProductFrm.jsp
    Created on : Sep 30, 2025, 7:04:01 PM
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
    <title>Search Product - Warehouse Management</title>
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

        .product-info {
            display: flex;
            align-items: center;
        }

        .product-avatar {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            color: white;
            font-weight: bold;
        }

        .product-details h4 {
            margin-bottom: 2px;
            color: var(--dark);
        }

        .product-details p {
            font-size: 12px;
            color: var(--gray);
        }

        .price {
            font-weight: bold;
            color: var(--success);
        }

        .stock-info {
            text-align: center;
        }

        .stock-high {
            color: var(--success);
            font-weight: 600;
        }

        .stock-medium {
            color: var(--warning);
            font-weight: 600;
        }

        .stock-low {
            color: var(--accent);
            font-weight: 600;
        }

        .description-text {
            font-size: 13px;
            color: var(--gray);
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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

        .filter-section {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .filter-group label {
            font-size: 14px;
            color: var(--dark);
            font-weight: 500;
        }

        .filter-select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background: white;
        }

        /* Pagination Styles */
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding: 15px 0;
            border-top: 1px solid #e9ecef;
        }

        .pagination-info {
            font-size: 14px;
            color: var(--gray);
        }

        .pagination-controls {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .pagination-btn {
            padding: 8px 15px;
            border: 1px solid #e1e5ee;
            background: white;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .pagination-btn:hover:not(:disabled) {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .pagination-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .page-numbers {
            display: flex;
            gap: 5px;
        }

        .page-number {
            padding: 8px 12px;
            border: 1px solid #e1e5ee;
            background: white;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .page-number.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .page-number:hover:not(.active) {
            background: #f8f9fa;
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
            
            .filter-section {
                flex-direction: column;
            }

            .pagination-container {
                flex-direction: column;
                gap: 15px;
                align-items: stretch;
            }

            .pagination-controls {
                justify-content: center;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1><i class="fas fa-store"></i>E-SuperMan Warehouse</h1>
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
            <div class="nav-item active">
                <i class="fas fa-boxes"></i>
                <span>Product Management</span>
            </div>
            <div class="nav-item">
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
<!--        <div class="top-bar">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search products, suppliers...">
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
        </div>-->
        
        <div class="content-area">
            <div class="container">
                <div class="page-header">
                    <h2><i class="fas fa-search"></i> Search Products</h2>
                    <p>Find and select products for import operations</p>
                </div>
                
                <div class="form-content">
                    <!-- Search Section -->
                    <div class="search-section">
                        <form id="searchForm" class="search-form" action="SearchProductServlet" method="get">
                             <div class="form-group">
                                 <label for="searchTerm">Search Products</label>
                                 <input type="text" id="searchTerm" name="keyword" class="form-control"
                                        placeholder="Enter product name or ID..."
                                        value="${keyword != null ? keyword : ''}">
                             </div>
                             <button type="submit" class="btn btn-primary">
                                 <i class="fas fa-search"></i> Search
                             </button>
                         </form>

                        
                        <!-- Filter Section -->
<!--                        <div class="filter-section">
                            <div class="filter-group">
                                <label for="typeFilter">Type:</label>
                                <select id="typeFilter" class="filter-select">
                                    <option value="">All Types</option>
                                    <option value="iPhone">iPhone</option>
                                    <option value="Samsung">Samsung</option>
                                    <option value="Tablet">Tablet</option>
                                    <option value="Accessory">Accessory</option>
                                </select>
                            </div>
                            
                            <div class="filter-group">
                                <label for="stockFilter">Stock Level:</label>
                                <select id="stockFilter" class="filter-select">
                                    <option value="">All Stock</option>
                                    <option value="high">High (100+)</option>
                                    <option value="medium">Medium (20-99)</option>
                                    <option value="low">Low (0-19)</option>
                                </select>
                            </div>
                        </div>-->
                        
                        <div class="action-buttons">
                            <a href="AddProductFrm.jsp" class="btn btn-success">
                                <i class="fas fa-plus"></i> Add New Product
                            </a>
                            <a href="ImportServlet" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Import
                            </a>
                        </div>
                    </div>
                    
                    <!-- Results Section -->
                    <div id="resultsSection">
                        <!-- Pagination Info will be moved here -->
                        <div class="pagination-info" id="paginationInfo"></div>
                        
                        <table id="productsTable">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Information</th>
                                    <th>Type</th>
                                    <th>Unit</th>
                                    <th>Standard Price</th>
                                    <th>In Stock</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="productsTableBody">
                                <!-- Product data will be populated here -->
                            </tbody>
                        </table>
                        
                        <!-- Pagination Controls -->
                        <div class="pagination-container">
                            <div class="pagination-info" id="resultsInfo"></div>
                            <div class="pagination-controls">
                                <button class="pagination-btn" id="prevPage" disabled>
                                    <i class="fas fa-chevron-left"></i> Previous
                                </button>
                                <div class="page-numbers" id="pageNumbers"></div>
                                <button class="pagination-btn" id="nextPage" disabled>
                                    Next <i class="fas fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                        
                        <!-- Empty State -->
                        <div id="emptyState" class="empty-state" style="display: none;">
                            <i class="fas fa-box-open"></i>
                            <h3>No Products Found</h3>
                            <p>Try adjusting your search terms or add a new product</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let products = [];
        let filteredProducts = [];
        let currentPage = 1;
        const itemsPerPage = 7;

        try {
            <c:if test="${not empty products}">
            products = [
                <c:forEach var="p" items="${products}" varStatus="status">
                {
                    id: ${p.id},
                    name: "${fn:escapeXml(p.name)}",
                    description: "${fn:escapeXml(p.description)}",
                    unit: "${fn:escapeXml(p.unit)}",
                    inventoryQuantity: "${fn:escapeXml(p.inventoryQuantity)}",
                    type: "${fn:escapeXml(p.type)}",
                    standardPrice: "${fn:escapeXml(p.standardPrice)}"
                }<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];
            </c:if>
            <c:if test="${empty products}">
            products = [];
            </c:if>

            console.log('Products loaded:', products);
            filteredProducts = [...products];
        } catch (error) {
            console.error('Error initializing products:', error);
            products = [];
            filteredProducts = [];
        }

        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM ready - Products:', products);
            console.log('DOM ready - Filtered:', filteredProducts);
            displayProducts();
            
            // Thêm event listeners cho phân trang
            document.getElementById('prevPage').addEventListener('click', goToPreviousPage);
            document.getElementById('nextPage').addEventListener('click', goToNextPage);
        });

        function displayProducts() {
            const tableBody = document.getElementById('productsTableBody');
            const emptyState = document.getElementById('emptyState');
            const resultsInfo = document.getElementById('resultsInfo');
            const table = document.getElementById('productsTable');
            const paginationContainer = document.querySelector('.pagination-container');

            const totalItems = filteredProducts.length;
            const totalPages = Math.ceil(totalItems / itemsPerPage);
            
            // Đảm bảo currentPage hợp lệ
            if (currentPage > totalPages) {
                currentPage = totalPages || 1;
            }

            // Tính toán items cho trang hiện tại
            const startIndex = (currentPage - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, totalItems);
            const currentItems = filteredProducts.slice(startIndex, endIndex);

            console.log('Displaying products:', {
                totalItems,
                totalPages,
                currentPage,
                startIndex,
                endIndex,
                currentItemsCount: currentItems.length
            });

            // Cập nhật thông tin kết quả
            if (totalItems === 0) {
                resultsInfo.textContent = 'No products found';
                table.style.display = 'none';
                paginationContainer.style.display = 'none';
                emptyState.style.display = 'block';
                return;
            }

            resultsInfo.textContent = 'Showing ' + (startIndex + 1) + '-' + endIndex + ' of ' + totalItems + ' product' + (totalItems !== 1 ? 's' : '');
            table.style.display = 'table';
            paginationContainer.style.display = 'flex';
            emptyState.style.display = 'none';

            // Hiển thị dữ liệu
            tableBody.innerHTML = '';
            currentItems.forEach(product => {
                console.log('Rendering product:', product);
                
                // Determine stock level class
                let stockClass = 'stock-high';
                if (product.inventoryQuantity < 20) {
                    stockClass = 'stock-low';
                } else if (product.inventoryQuantity < 100) {
                    stockClass = 'stock-medium';
                }

                const row = document.createElement('tr');
                row.innerHTML = 
                    '<td>' +
                        '<strong>ID: P' + product.id.toString().padStart(4, '0') + '</strong>' +
                    '</td>' +
                    '<td>' +
                        '<div class="product-info">' +
                            '<div class="product-details">' +
                                '<h4>' + product.name + '</h4>' +
                            '</div>' +
                        '</div>' +
                    '</td>' +
                    '<td>' + product.type + '</td>' +
                    '<td>' + product.unit + '</td>' +
                    '<td class="price">' + formatCurrency(product.standardPrice) + '</td>' +
                    '<td class="stock-info ' + stockClass + '">' + product.inventoryQuantity + '</td>' +
                    '<td>' +
                        '<div class="description-text" title="' + (product.description || 'No description') + '">' +
                            (product.description || 'No description available') +
                        '</div>' +
                    '</td>' +
                    '<td class="action-cell">' +
                        '<button class="btn btn-primary btn-sm" onclick="selectProduct(' + product.id + ')">' +
                            '<i class="fas fa-check"></i> Choose' +
                        '</button>' +
                    '</td>';
                
                tableBody.appendChild(row);
            });

            // Cập nhật điều khiển phân trang
            updatePaginationControls(totalPages);
        }

        function updatePaginationControls(totalPages) {
            const prevButton = document.getElementById('prevPage');
            const nextButton = document.getElementById('nextPage');
            const pageNumbersContainer = document.getElementById('pageNumbers');

            // Cập nhật nút Previous/Next
            prevButton.disabled = currentPage === 1;
            nextButton.disabled = currentPage === totalPages || totalPages === 0;

            // Tạo số trang
            pageNumbersContainer.innerHTML = '';
            const maxVisiblePages = 5;
            let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
            let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

            // Điều chỉnh nếu gần cuối
            if (endPage - startPage + 1 < maxVisiblePages) {
                startPage = Math.max(1, endPage - maxVisiblePages + 1);
            }

            for (let i = startPage; i <= endPage; i++) {
                const pageButton = document.createElement('button');
                pageButton.className = 'page-number' + (i === currentPage ? ' active' : '');
                pageButton.textContent = i;
                pageButton.addEventListener('click', function() {
                    currentPage = i;
                    displayProducts();
                });
                pageNumbersContainer.appendChild(pageButton);
            }
        }

        function goToPreviousPage() {
            if (currentPage > 1) {
                currentPage--;
                displayProducts();
            }
        }

        function goToNextPage() {
            const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                displayProducts();
            }
        }

        function selectProduct(productId) {
            console.log('Selected product ID:', productId);
            const product = products.find(p => p.id === productId);

            if (!product) {
                alert('Product not found!');
                return;
            }

            // Lấy danh sách sản phẩm đã chọn từ sessionStorage (client-side)
            const selectedProducts = JSON.parse(sessionStorage.getItem('selectedProducts') || '[]');
            console.log('còn nè:', selectedProducts);

            // Kiểm tra xem sản phẩm đã có chưa
            const alreadyExists = selectedProducts.some(p => p.id === productId);

            if (alreadyExists) {
                alert('Product "' + product.name + '" is already in the import list!');
                return;
            }

            // Nếu chưa có, xác nhận thêm vào
            if (confirm('Add "' + product.name + '" to import list?')) {
                // Thêm vào sessionStorage
                selectedProducts.push(product);
                sessionStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));

                // Gửi lên server (nếu cần)
                fetch('ImportServlet?action=selectProduct', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(product)
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        window.location.href = 'ImportServlet';
                    } else {
                        alert(data.message);
                    }
                })
                .catch(err => console.error('Error sending product:', err));
            }
        }

        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
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
                if (pageName !== 'Product Management') {
                    alert('Navigating to ' + pageName + '...');
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
