<%--
Document : home
Created on : Sep 30, 2025, 2:53:46 PM
Author : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html><html> <head> <meta charset="UTF-8"> <title>Đăng nhập</title> <style>
            * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #3498db 0%, #1a5276 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    .login-container {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 100%;
        max-width: 400px;
        position: relative;
        overflow: hidden;
    }

    .login-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #3498db, #2980b9);
    }

    h2 {
        margin-bottom: 30px;
        color: #2c3e50;
        font-size: 28px;
        font-weight: 600;
    }

    .input-group {
        position: relative;
        margin-bottom: 20px;
    }

    .input-field {
        width: 100%;
        padding: 15px 20px 15px 45px;
        border: 2px solid #e1e5ee;
        border-radius: 10px;
        font-size: 16px;
        transition: all 0.3s ease;
        background: #f8f9fa;
    }

    .input-field:focus {
        outline: none;
        border-color: #3498db;
        background: white;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
    }

    .input-group i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #7f8c8d;
        font-size: 18px;
    }

    .btn {
        display: inline-block;
        width: 100%;
        padding: 15px;
        border: none;
        border-radius: 10px;
        background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
    }

    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(52, 152, 219, 0.3);
        background: linear-gradient(135deg, #2980b9 0%, #1f618d 100%);
    }

    .link-btn {
        background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
        text-decoration: none;
        display: block;
        margin-top: 20px;
    }

    .link-btn:hover {
        box-shadow: 0 8px 20px rgba(46, 204, 113, 0.3);
        background: linear-gradient(135deg, #27ae60 0%, #219653 100%);
    }

    .divider {
        margin: 25px 0;
        position: relative;
        text-align: center;
        color: #7f8c8d;
    }

    .divider::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        height: 1px;
        background: #e1e5ee;
    }

    .divider span {
        background: white;
        padding: 0 15px;
        position: relative;
    }

    .forgot-password {
        color: #3498db;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .forgot-password:hover {
        color: #2980b9;
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .login-container {
        animation: fadeIn 0.6s ease-out;
    }

    .logo {
        margin-bottom: 20px;
    }

    .logo i {
        font-size: 48px;
        color: #3498db;
        margin-bottom: 10px;
    }
     /* ======= TOAST FLOATING ======= */
    .alert {
        position: fixed;
        top: 20px;
        right: 20px; /* Góc trái toàn trang */
        background: #fff; /* Nền trắng như bạn yêu cầu */
        border-radius: 10px;
        border-left: 5px solid;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        padding: 24px 28px;
        min-width: 300px;
        font-size: 15px;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
        z-index: 9999;
        animation: slideIn 0.4s ease, fadeOut 0.4s ease 2.6s forwards;
    }

    .alert.success {
        border-color: #2ecc71;
        color: #27ae60;
    }

    .alert.error {
        border-color: #e74c3c;
        color: #c0392b;
    }

    .alert i {
        font-size: 18px;
    }

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateX(-30px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes fadeOut {
        from {
            opacity: 1;
            transform: translateX(0);
        }
        to {
            opacity: 0;
            transform: translateX(-20px);
        }
    }

    .fade-out {
        animation: fadeOut 0.4s forwards;
    }

</style>
<!-- Toast thông báo -->
<c:if test="${not empty message}">
    <div id="toastMessage" class="alert success">
        <i class="fas fa-check-circle"></i> ${message}
    </div>
</c:if>

<c:if test="${not empty error}">
    <div id="toastError" class="alert error">
        <i class="fas fa-exclamation-circle"></i> ${error}
    </div>
</c:if>

<script>
    // Tự động ẩn sau 3 giây
    setTimeout(() => {
        document.querySelectorAll('.alert').forEach(el => el.style.display = 'none');
    }, 3000);
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head> <body> <div class="login-container"> <div class="logo"> <i class="fas fa-store"></i></div> <h2>Welcome Back</h2>


<!-- Form đăng nhập -->
<form action="LoginServlet" method="post">
    <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="email" class="input-field" placeholder="Enter your email" required>
    </div>
    
    <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" class="input-field" placeholder="Enter your password" required>
    </div>

    <div style="text-align: right; margin-bottom: 20px;">
        <a href="#" class="forgot-password">Forgot password?</a>
    </div>

    <button type="submit" class="btn">
        <i class="fas fa-sign-in-alt" style="margin-right: 8px;"></i>
        Sign In
    </button>
</form>

<div class="divider">
    <span>or</span>
</div>

<!-- Nút chuyển sang đăng ký -->
<a href="RegisterServlet" class="btn link-btn">
    <i class="fas fa-user-plus" style="margin-right: 8px;"></i>
    Register as new member
</a>     
</div><script> // Thêm hiệu ứng cho các trường input 
    document.querySelectorAll('.input-field').forEach(input => { input.addEventListener('focus', function() { this.parentElement.querySelector('i').style.color = '#3498db'; }); input.addEventListener('blur', function() { this.parentElement.querySelector('i').style.color = '#7f8c8d'; }); }); // Hiệu ứng cho logo 
    const logo = document.querySelector('.logo i'); setInterval(() => { logo.style.transform = 'translateY(-5px)'; setTimeout(() => { logo.style.transform = 'translateY(0)'; }, 500); }, 3000); </script></body> </html>