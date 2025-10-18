<%-- 
    Document   : SearchSupplierFrm
    Created on : Sep 30, 2025, 6:48:32 PM
    Author     : ADMIN
--%>
<%-- 
    Document   : SearchSupplierFrm.jsp
    Created on : Sep 30, 2025
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Supplier</title>
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
            max-width: 800px;
            margin: auto;
        }
        h2 { text-align: center; margin-bottom: 20px; }
        input[type=text] {
            width: 60%;
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            background: #007bff;
            color: white;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }
        .btn:hover { background: #0056b3; }
        .btn-add {
            background: #28a745;
            margin-top: 15px;
            text-decoration: none;
        }
        .btn-add:hover { background: #1e7e34; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th { background: #f4f4f4; }
    </style>
</head>
<body>
<div class="container">
    <h2>Search Supplier</h2>

    <!-- Form tìm kiếm + nút thêm -->
    <form action="SearchSupplierFrm.jsp" method="get" style="margin-bottom: 15px;">
        <input type="text" name="supplierName" placeholder="Enter supplier name...">
        <button type="submit" class="btn">Search Supplier</button>
        <a href="AddSupplierFrm.jsp" class="btn btn-add">Add New Supplier</a>
    </form>
    <!-- Bảng kết quả -->
    <table>
        <thead>
            <tr>
                <th>Supplier ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Ví dụ dữ liệu -->
            <tr>
                <td>S001</td>
                <td>ABC Supplies</td>
                <td>Hà Nội</td>
                <td>0123456789</td>
                <td><button type="button" class="btn">Choose</button></td>

            </tr>
            <tr>
                <td>S002</td>
                <td>XYZ Trading</td>
                <td>Đà Nẵng</td>
                <td>0987654321</td>
                <td><button type="button" class="btn">Choose</button></td>

            </tr>
        </tbody>
    </table>
    <!-- Nút Back -->
    <div style="text-align:center; margin-top: 20px;">
        <a href="ImportFrm.jsp" class="btn" style="background:#6c757d;">Back</a>
    </div>

    
</div>
</body>
</html>
