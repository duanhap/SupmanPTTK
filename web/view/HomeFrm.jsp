<%-- 
    Document   : HomeFrm.jsp
    Created on : Oct 17, 2025, 9:55:34 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warehouse Management System</title>
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
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
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

        .welcome-banner {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .welcome-banner h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 24px;
        }

        .stat-info h3 {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .stat-info p {
            color: var(--gray);
            font-size: 14px;
        }

        .card-1 .stat-icon {
            background-color: rgba(52, 152, 219, 0.2);
            color: var(--primary);
        }

        .card-2 .stat-icon {
            background-color: rgba(46, 204, 113, 0.2);
            color: var(--success);
        }

        .card-3 .stat-icon {
            background-color: rgba(241, 196, 15, 0.2);
            color: var(--warning);
        }

        .card-4 .stat-icon {
            background-color: rgba(155, 89, 182, 0.2);
            color: #9b59b6;
        }

        .quick-actions {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 20px;
            margin-bottom: 20px;
            color: var(--secondary);
            display: flex;
            align-items: center;
        }

        .section-title i {
            margin-right: 10px;
            color: var(--primary);
        }

        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 15px;
        }

        .action-btn {
            background-color: var(--light);
            border: none;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .action-btn:hover {
            background-color: var(--primary);
            color: white;
            transform: translateY(-3px);
        }

        .action-btn i {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .recent-activity {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
        }

        .activity-list {
            list-style: none;
        }

        .activity-item {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(52, 152, 219, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--primary);
        }

        .activity-content h4 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .activity-content p {
            font-size: 14px;
            color: var(--gray);
        }

        .activity-time {
            margin-left: auto;
            font-size: 12px;
            color: var(--gray);
        }

        @media (max-width: 992px) {
            .dashboard-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
            }
            
            .stats-cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .stats-cards {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
            
            .top-bar {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .search-bar {
                width: 100%;
                margin-bottom: 15px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-container">
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
                <div class="nav-item active">
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
                <a href="ImportServlet" class="nav-item">
                    <i class="fas fa-arrow-down"></i>
                    <span>Import Products</span>
                </a>
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
                <div class="welcome-banner">
                    <h2>Welcome back, Warehouse Staff!</h2>
                    <p>You have 12 pending orders to approve and 5 shipments to dispatch today.</p>
                </div>
                
                <div class="stats-cards">
                    <div class="stat-card card-1">
                        <div class="stat-icon">
                            <i class="fas fa-box-open"></i>
                        </div>
                        <div class="stat-info">
                            <h3>1,248</h3>
                            <p>Total Products</p>
                        </div>
                    </div>
                    
                    <div class="stat-card card-2">
                        <div class="stat-icon">
                            <i class="fas fa-clipboard-list"></i>
                        </div>
                        <div class="stat-info">
                            <h3>42</h3>
                            <p>Pending Orders</p>
                        </div>
                    </div>
                    
                    <div class="stat-card card-3">
                        <div class="stat-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <div class="stat-info">
                            <h3>18</h3>
                            <p>Suppliers</p>
                        </div>
                    </div>
                    
                    <div class="stat-card card-4">
                        <div class="stat-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="stat-info">
                            <h3>7</h3>
                            <p>Low Stock Items</p>
                        </div>
                    </div>
                </div>
                
                <div class="quick-actions">
                    <h3 class="section-title"><i class="fas fa-bolt"></i> Quick Actions</h3>
                    
                    <div class="action-buttons">
                        <button class="action-btn">
                            <i class="fas fa-boxes"></i>
                            <span>Manage Products</span>
                        </button>
                        
                        <button class="action-btn">
                            <i class="fas fa-truck-loading"></i>
                            <span>Manage Suppliers</span>
                        </button>
                        
                        <button class="action-btn">
                            <i class="fas fa-arrow-down"></i>
                            <span>Import Products</span>
                        </button>
                        
                        <button class="action-btn">
                            <i class="fas fa-clipboard-check"></i>
                            <span>Approve Orders</span>
                        </button>
                        
                        <button class="action-btn">
                            <i class="fas fa-shipping-fast"></i>
                            <span>Dispatch Orders</span>
                        </button>
                        
                        <button class="action-btn">
                            <i class="fas fa-chart-line"></i>
                            <span>View Reports</span>
                        </button>
                    </div>
                </div>
                
                <div class="recent-activity">
                    <h3 class="section-title"><i class="fas fa-history"></i> Recent Activity</h3>
                    
                    <ul class="activity-list">
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-clipboard-check"></i>
                            </div>
                            <div class="activity-content">
                                <h4>Order #ORD-7842 Approved</h4>
                                <p>Online order from John Doe has been approved for shipping</p>
                            </div>
                            <div class="activity-time">10:24 AM</div>
                        </li>
                        
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-arrow-down"></i>
                            </div>
                            <div class="activity-content">
                                <h4>New Stock Received</h4>
                                <p>50 units of Product A received from Supplier XYZ</p>
                            </div>
                            <div class="activity-time">09:45 AM</div>
                        </li>
                        
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="activity-content">
                                <h4>Low Stock Alert</h4>
                                <p>Product B is running low on stock (only 12 units left)</p>
                            </div>
                            <div class="activity-time">Yesterday</div>
                        </li>
                        
                        <li class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="activity-content">
                                <h4>Order Dispatched</h4>
                                <p>Order #ORD-7839 has been dispatched to delivery staff</p>
                            </div>
                            <div class="activity-time">Yesterday</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Add interactivity to navigation items
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.nav-item').forEach(nav => {
                    nav.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        // Add interactivity to action buttons
        document.querySelectorAll('.action-btn').forEach(button => {
            button.addEventListener('click', function() {
                const action = this.querySelector('span').textContent;
                alert(`You clicked: ${action}`);
                // In a real application, this would navigate to the appropriate page
            });
        });

        // Logout functionality
        document.querySelector('.logout-btn').addEventListener('click', function() {
            if (confirm('Are you sure you want to logout?')) {
                // In a real application, this would redirect to logout endpoint
                alert('Logging out...');
            }
        });
    </script>
</body>
</html>