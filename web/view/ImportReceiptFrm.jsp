<%-- 
    Document   : ImportReceiptFrm
    Created on : Sep 30, 2025, 11:45:04 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            position: relative;
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

        .receipt-content {
            padding: 30px;
        }

        .section {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #fafbfc;
        }

        .section h3 {
            color: var(--primary-dark);
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-light);
            display: flex;
            align-items: center;
        }

        .section h3 i {
            margin-right: 10px;
        }

        .info-table {
            width: 100%;
            border-collapse: collapse;
        }

        .info-table td {
            padding: 8px 0;
            border: none;
        }

        .info-table td:first-child {
            font-weight: 600;
            color: var(--dark);
            width: 150px;
        }

        .info-table td:last-child {
            color: var(--secondary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 12px 15px;
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

        .total-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 8px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .total-final {
            font-size: 18px;
            font-weight: bold;
            color: var(--primary-dark);
            border-bottom: none;
            margin-top: 10px;
            padding-top: 15px;
            border-top: 2px solid var(--primary);
        }

        .price {
            font-weight: 600;
            color: var(--success);
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
            margin: 5px;
        }

        .btn i {
            margin-right: 8px;
        }

        .btn-secondary {
            background: linear-gradient(135deg, var(--gray) 0%, #5d6d7e 100%);
            color: white;
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.3);
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

        .action-buttons {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e9ecef;
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
            .container {
                box-shadow: none;
                border-radius: 0;
            }
            .action-buttons, .top-bar, .sidebar {
                display: none !important;
            }
            .section {
                break-inside: avoid;
            }
        }

        .print-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--success);
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 1000;
            animation: slideIn 0.3s ease-out;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
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
            table {
                display: block;
                overflow-x: auto;
            }
            
            .action-buttons {
                display: flex;
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Print Notification -->
    <div id="printNotification" class="print-notification">
        <i class="fas fa-print"></i> Preparing document for printing...
    </div>

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
            <div class="container">
                <div class="page-header">
                    <h2><i class="fas fa-file-invoice"></i> Import Receipt</h2>
                    <p>Receipt details and summary of imported products</p>
                </div>
                
                <div class="receipt-content">
                    <!-- Receipt Information -->
                    <div class="section">
                        <h3><i class="fas fa-receipt"></i> Receipt Information</h3>
                        <table class="info-table">
                            <tr>
                                <td>Receipt ID:</td>
                                <td><strong>R0011</strong></td>
                            </tr>
                            <tr>
                                <td>Date Created:</td>
                                <td>30/09/2025</td>
                            </tr>
                            <tr>
                                <td>Time:</td>
                                <td>14:30:45</td>
                            </tr>
                            <tr>
                                <td>Status:</td>
                                <td><span style="color: var(--success); font-weight: 600;">Completed</span></td>
                            </tr>
                        </table>
                    </div>

                    <!-- Supplier Information -->
                    <div class="section">
                        <h3><i class="fas fa-truck"></i> Supplier Information</h3>
                        <table class="info-table">
                            <tr>
                                <td>Supplier ID:</td>
                                <td><strong>S001</strong></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td>ABC Supplies</td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td>0123456789</td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>abc@supplies.com</td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td>123 Main Street, Hanoi, Vietnam</td>
                            </tr>
                        </table>
                    </div>

                    <!-- Imported Products -->
                    <div class="section">
                        <h3><i class="fas fa-boxes"></i> Imported Products</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Unit</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>P001</strong></td>
                                    <td>iPhone 17 Pro Max</td>
                                    <td>Piece</td>
                                    <td>10</td>
                                    <td class="price">33,000,000 ₫</td>
                                    <td class="price">330,000,000 ₫</td>
                                </tr>
                                <tr>
                                    <td><strong>P002</strong></td>
                                    <td>iPhone 16 Pro Max</td>
                                    <td>Piece</td>
                                    <td>10</td>
                                    <td class="price">30,000,000 ₫</td>
                                    <td class="price">300,000,000 ₫</td>
                                </tr>
                                <tr>
                                    <td><strong>P003</strong></td>
                                    <td>Samsung Galaxy S24 Ultra</td>
                                    <td>Piece</td>
                                    <td>5</td>
                                    <td class="price">28,000,000 ₫</td>
                                    <td class="price">140,000,000 ₫</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <!-- Total Calculation -->
                        <div class="total-section">
                            <div class="total-row">
                                <span>Subtotal:</span>
                                <span class="price">770,000,000 ₫</span>
                            </div>
                            <div class="total-row">
                                <span>Tax (10%):</span>
                                <span class="price">77,000,000 ₫</span>
                            </div>
                            <div class="total-row total-final">
                                <span>Grand Total:</span>
                                <span class="price">847,000,000 ₫</span>
                            </div>
                        </div>
                    </div>

                    <!-- Warehouse Staff Information -->
                    <div class="section">
                        <h3><i class="fas fa-user-tie"></i> Warehouse Staff</h3>
                        <table class="info-table">
                            <tr>
                                <td>Staff ID:</td>
                                <td><strong>WS001</strong></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td>Nguyễn Văn A</td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td>0987654321</td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>nguyenvana@warehouse.com</td>
                            </tr>
                            <tr>
                                <td>Department:</td>
                                <td>Warehouse Management</td>
                            </tr>
                        </table>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <a href="ImportFrm.jsp" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Back to Import
                        </a>
                        <button type="button" class="btn btn-primary" onclick="printReceipt()">
                            <i class="fas fa-print"></i> Print Receipt
                        </button>
                        <button type="button" class="btn btn-success" onclick="saveAsPDF()">
                            <i class="fas fa-file-pdf"></i> Save as PDF
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Enhanced print function with notification
        function printReceipt() {
            // Show printing notification
            const notification = document.getElementById('printNotification');
            notification.style.display = 'block';
            notification.innerHTML = '<i class="fas fa-print"></i> Preparing document for printing...';
            
            // Wait a moment for the notification to be visible
            setTimeout(() => {
                // Print the document
                window.print();
                
                // Update notification after print dialog closes
                setTimeout(() => {
                    notification.innerHTML = '<i class="fas fa-check"></i> Print completed successfully!';
                    setTimeout(() => {
                        notification.style.display = 'none';
                    }, 3000);
                }, 500);
            }, 1000);
        }

        // PDF save function (simulated)
        function saveAsPDF() {
            const notification = document.getElementById('printNotification');
            notification.style.display = 'block';
            notification.innerHTML = '<i class="fas fa-file-pdf"></i> Generating PDF document...';
            
            setTimeout(() => {
                notification.innerHTML = '<i class="fas fa-check"></i> PDF saved successfully!';
                setTimeout(() => {
                    notification.style.display = 'none';
                // In a real application, this would trigger a PDF download
                    alert('PDF download would start in a real application');
                }, 2000);
            }, 1500);
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

        // Auto-hide print notification after 5 seconds if still visible
        setInterval(() => {
            const notification = document.getElementById('printNotification');
            if (notification.style.display === 'block') {
                notification.style.display = 'none';
            }
        }, 5000);
    </script>
</body>
</html>