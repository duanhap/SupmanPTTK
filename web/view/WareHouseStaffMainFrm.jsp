<%-- 
    Document   : WareHouseStaffMainFrm
    Created on : Sep 30, 2025, 6:26:41 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Warehouse Staff - Main</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .main-container {
            background: #fff;
            padding: 30px 50px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            background: #007bff;
            color: white;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="main-container">
    <h2>Warehouse Staff - Main Menu</h2>

    <!-- Nút xử lý nhập hàng từ nhà cung cấp -->
    <form action="ImportFrm.jsp" method="get">
        <button type="link" class="btn">Handle Import from Supplier</button>
    </form>
</div>
</body>
</html>
