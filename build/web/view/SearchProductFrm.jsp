<%-- 
    Document   : SearchProductFrm
    Created on : Sep 30, 2025, 7:04:01 PM
    Author     : ADMIN
--%>

<%-- 
    Document   : SearchProductFrm.jsp
    Created on : Sep 30, 2025
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Product</title>
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
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        input[type=text] {
            flex: 1;
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .btn {
            display: inline-block;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            background: #007bff;
            color: white;
            cursor: pointer;
            text-decoration: none;   /* bỏ gạch chân */
            transition: 0.3s;
        }
        .btn:hover { background: #0056b3; }
        .btn-add {
            background: #28a745;
        }
        .btn-add:hover { background: #1e7e34; }
        .btn-back {
            background: #6c757d;
        }
        .btn-back:hover { background: #565e64; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #f4f4f4;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Search Product</h2>

    <!-- Search bar -->
    <div class="search-bar">
        <form action="SearchProductFrm.jsp" method="get" style="flex:1; display:flex;">
            <input type="text" name="productName" placeholder="Enter product name...">
            <button type="submit" class="btn">Search Product</button>
        </form>
        <a href="AddProductFrm.jsp" class="btn btn-add">Add New Product</a>
    </div>

    <!-- Bảng danh sách sản phẩm -->
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Unit</th>
                <th>Standard Price</th>
                <th>Type</th>
                <th>In Stock</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Ví dụ dữ liệu -->
            <tr>
                <td>P001</td>
                <td>Iphone 17 Pro Max</td>
                <td>Cái</td>
                <td>34.999.000</td>
                <td>Iphone</td>
                <td>300</td>
                <td>  </td>
                <td><button type="button" class="btn">Choose</button></td>

            </tr>
            <tr>
                <td>P002</td>
                <td>Iphone 16 Pro Max</td>
                <td>Cái</td>
                <td>31.790.000</td>
                <td>Iphone</td>
                <td>200</td>
                <td>  </td>
                <td><button type="button" class="btn">Choose</button></td>


            </tr>
        </tbody>
    </table>

    <!-- Back -->
    <div style="text-align:center; margin-top:20px;">
        <a href="ImportFrm.jsp" class="btn btn-back">Back</a>
    </div>
</div>
</body>
</html>
