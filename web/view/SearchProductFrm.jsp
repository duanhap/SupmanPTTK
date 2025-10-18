<%-- 
    Document   : SearchProductFrm.jsp
    Created on : Sep 30, 2025, 7:04:01 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="top-bar">
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
        </div>
        
        <div class="content-area">
            <div class="container">
                <div class="page-header">
                    <h2><i class="fas fa-search"></i> Search Products</h2>
                    <p>Find and select products for import operations</p>
                </div>
                
                <div class="form-content">
                    <!-- Search Section -->
                    <div class="search-section">
                        <form id="searchForm" class="search-form">
                            <div class="form-group">
                                <label for="searchTerm">Search Products</label>
                                <input type="text" id="searchTerm" class="form-control" 
                                       placeholder="Search by product name, ID, type, or description...">
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search"></i> Search
                            </button>
                        </form>
                        
                        <!-- Filter Section -->
                        <div class="filter-section">
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
                        </div>
                        
                        <div class="action-buttons">
                            <a href="AddProductFrm.jsp" class="btn btn-success">
                                <i class="fas fa-plus"></i> Add New Product
                            </a>
                            <a href="ImportFrm.jsp" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Import
                            </a>
                        </div>
                    </div>
                    
                    <!-- Results Section -->
                    <div id="resultsSection">
                        <div class="results-count" id="resultsCount">Showing all products</div>
                        
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
        // Sample product data matching your database structure
        const products = [
            {
                id: 1,
                name: 'iPhone 17 Pro Max',
                description: 'Latest iPhone model with advanced features',
                unit: 'Piece',
                inventoryQuantity: 300,
                type: 'iPhone',
                standardPrice: 34999000
            },
            {
                id: 2,
                name: 'iPhone 16 Pro Max',
                description: 'Premium smartphone with excellent camera',
                unit: 'Piece',
                inventoryQuantity: 200,
                type: 'iPhone',
                standardPrice: 31790000
            },
            {
                id: 3,
                name: 'Samsung Galaxy S24 Ultra',
                description: 'Flagship Android phone with S-Pen',
                unit: 'Piece',
                inventoryQuantity: 150,
                type: 'Samsung',
                standardPrice: 28990000
            },
            {
                id: 4,
                name: 'iPad Pro 12.9"',
                description: 'Professional tablet for work and creativity',
                unit: 'Piece',
                inventoryQuantity: 80,
                type: 'Tablet',
                standardPrice: 25990000
            },
            {
                id: 5,
                name: 'AirPods Pro 3',
                description: 'Wireless earbuds with noise cancellation',
                unit: 'Pair',
                inventoryQuantity: 25,
                type: 'Accessory',
                standardPrice: 5990000
            },
            {
                id: 6,
                name: 'MacBook Air M3',
                description: 'Lightweight laptop for everyday use',
                unit: 'Piece',
                inventoryQuantity: 45,
                type: 'Laptop',
                standardPrice: 32990000
            }
        ];

        let filteredProducts = [...products];

        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            displayProducts();
            
            // Search form submission
            document.getElementById('searchForm').addEventListener('submit', function(e) {
                e.preventDefault();
                filterProducts();
            });
            
            // Filter changes
            document.getElementById('typeFilter').addEventListener('change', filterProducts);
            document.getElementById('stockFilter').addEventListener('change', filterProducts);
            
            // Clear search when input is emptied
            document.getElementById('searchTerm').addEventListener('input', function() {
                if (this.value === '') {
                    filterProducts();
                }
            });
        });

        function filterProducts() {
            const searchTerm = document.getElementById('searchTerm').value.toLowerCase();
            const typeFilter = document.getElementById('typeFilter').value;
            const stockFilter = document.getElementById('stockFilter').value;
            
            filteredProducts = products.filter(product => {
                // Text search
                const matchesSearch = !searchTerm || 
                    product.name.toLowerCase().includes(searchTerm) ||
                    (product.description && product.description.toLowerCase().includes(searchTerm)) ||
                    product.type.toLowerCase().includes(searchTerm);
                
                // Type filter
                const matchesType = !typeFilter || product.type === typeFilter;
                
                // Stock filter
                let matchesStock = true;
                if (stockFilter === 'high') {
                    matchesStock = product.inventoryQuantity >= 100;
                } else if (stockFilter === 'medium') {
                    matchesStock = product.inventoryQuantity >= 20 && product.inventoryQuantity <= 99;
                } else if (stockFilter === 'low') {
                    matchesStock = product.inventoryQuantity < 20;
                }
                
                return matchesSearch && matchesType && matchesStock;
            });
            
            displayProducts();
        }

        function displayProducts() {
            const tableBody = document.getElementById('productsTableBody');
            const emptyState = document.getElementById('emptyState');
            const resultsCount = document.getElementById('resultsCount');
            
            // Update results count
            resultsCount.textContent = `Showing ${filteredProducts.length} product\${filteredProducts.length !== 1 ? 's' : ''}`;
            
            if (filteredProducts.length === 0) {
                tableBody.innerHTML = '';
                document.getElementById('productsTable').style.display = 'none';
                emptyState.style.display = 'block';
                return;
            }
            
            // Show table and hide empty state
            document.getElementById('productsTable').style.display = 'table';
            emptyState.style.display = 'none';
            
            // Populate table
            tableBody.innerHTML = '';
            filteredProducts.forEach(product => {
                const row = document.createElement('tr');
                
                // Generate avatar initials
                const initials = product.name.split(' ').map(word => word[0]).join('').toUpperCase();
                
                // Determine stock level class
                let stockClass = 'stock-high';
                if (product.inventoryQuantity < 20) {
                    stockClass = 'stock-low';
                } else if (product.inventoryQuantity < 100) {
                    stockClass = 'stock-medium';
                }
                
                row.innerHTML = `
                    <td>
                        <strong>P${product.id.toString().padStart(3, '0')}</strong>
                    </td>
                    <td>
                        <div class="product-info">
                            <div class="product-avatar">${initials.substring(0, 2)}</div>
                            <div class="product-details">
                                <h4>${product.name}</h4>
                                <p>ID: P${product.id.toString().padStart(3, '0')}</p>
                            </div>
                        </div>
                    </td>
                    <td>${product.type}</td>
                    <td>${product.unit}</td>
                    <td class="price">${formatCurrency(product.standardPrice)}</td>
                    <td class="stock-info ${stockClass}">${product.inventoryQuantity}</td>
                    <td>
                        <div class="description-text" title="${product.description || 'No description'}">
                            ${product.description || 'No description available'}
                        </div>
                    </td>
                    <td class="action-cell">
                        <button class="btn btn-primary btn-sm" onclick="selectProduct(${product.id})">
                            <i class="fas fa-check"></i> Choose
                        </button>
                    </td>
                `;
                
                tableBody.appendChild(row);
            });
        }

        function selectProduct(productId) {
            const product = products.find(p => p.id === productId);
            if (product) {
                // In a real application, this would pass the product data back to the Import form
                if (confirm(`Add ${product.name} to import list?`)) {
                    // Store selected product in sessionStorage to pass to Import form
                    const selectedProducts = JSON.parse(sessionStorage.getItem('selectedProducts') || '[]');
                    selectedProducts.push(product);
                    sessionStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));
                    
                    // Redirect back to Import form
                    window.location.href = 'ImportFrm.jsp';
                }
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