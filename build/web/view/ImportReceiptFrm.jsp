<%-- 
    Document   : ImportRecieptFrm
    Created on : Sep 30, 2025, 11:45:04 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Imported Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 20px;
        }
        .container {
            background: #fff;
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            max-width: 900px;
            margin: auto;
        }
        h2 { text-align: center; margin-bottom: 20px; }
        .section { margin-bottom: 25px; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th { background: #f4f4f4; }
        .info-table td {
            text-align: left;
            border: none;
            padding: 6px 4px;
        }
        .total-price {
            text-align: right;
            font-weight: bold;
            margin-top: 15px;
            font-size: 16px;
        }
        .btn {
            display: inline-block;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            background: #6c757d;
            color: white;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
            margin: 5px;
        }
        .btn:hover { background: #565e64; }
        .btn-print { background: #17a2b8; }
        .btn-print:hover { background: #117a8b; }
    </style>
</head>
<body>
<div class="container">
    <h2>Imported Receipt</h2>

    <!-- Thông tin phiếu -->
    <div class="section">
        <h3>Receipt Info</h3>
        <table class="info-table">
            <tr><td><strong>Receipt ID:</strong></td><td>R0011</td></tr>
            <tr><td><strong>Date:</strong></td><td>30/09/2025</td></tr>
        </table>
    </div>

    <!-- Thông tin nhà cung cấp -->
    <div class="section">
        <h3>Supplier Info</h3>
        <table class="info-table">
            <tr><td><strong>Supplier ID:</strong></td><td>S001</td></tr>
            <tr><td><strong>Name:</strong></td><td>ABC Supplies</td></tr>
            <tr><td><strong>Phone:</strong></td><td>0123456789</td></tr>
            <tr><td><strong>Email:</strong></td><td>abc@supplies.com</td></tr>
        </table>
    </div>

    <!-- Bảng mặt hàng nhập -->
    <div class="section">
        <h3>Imported Products</h3>
        <table>
            <thead>
                <tr>
                    <th>Imported Product ID</th>
                    <th>Name</th>
                    <th>Unit</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>IP023</td>
                    <td>Iphone 17 Pro Max</td>
                    <td>Cái</td>
                    <td>10</td>
                    <td>33.000.000</td>
                    <td>330.000.000</td>
                    
                </tr>
                <tr>
                    <td>IP025</td>
                    <td>Iphone 16 Pro Max</td>
                    <td>Cái</td>
                    <td>10</td>
                    <td>30.000.000</td>
                    <td>300.000.000</td>
                </tr>
            </tbody>
        </table>
        <div class="total-price">Total: 667.890.000 VND</div>
    </div>

    <!-- Thông tin nhân viên kho -->
    <div class="section">
        <h3>Warehouse Staff</h3>
        <table class="info-table">
            <tr><td><strong>Staff ID:</strong></td><td>W001</td></tr>
            <tr><td><strong>Name:</strong></td><td>Nguyễn Văn A</td></tr>
            <tr><td><strong>Phone:</strong></td><td>0987654321</td></tr>
            <tr><td><strong>Email:</strong></td><td>staff@warehouse.com</td></tr>
        </table>
    </div>

    <!-- Back + Print -->
    <div style="text-align:center; margin-top:20px;">
        <a href="ImportFrm.jsp" class="btn">Back</a>
        <button type="button" class="btn btn-print" onclick="window.print()">Print Receipt</button>
    </div>
</div>
</body>
</html>