<%--
Document : RegisterFrm
Created on : Sep 30, 2025, 3:36:36 PM
Author : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html><html> <head> <meta charset="UTF-8"> <title>Register Member</title> <style> * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #3498db 0%, #1a5276 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    .register-container {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 450px;
        position: relative;
        overflow: hidden;
    }

    .register-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #3498db, #2980b9);
    }

    .logo {
        text-align: center;
        margin-bottom: 20px;
    }

    .logo i {
        font-size: 48px;
        color: #3498db;
        margin-bottom: 10px;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
        font-size: 28px;
        font-weight: 600;
    }

    .form-row {
        display: flex;
        gap: 15px;
        margin-bottom: 20px;
    }

    .form-row .input-group {
        flex: 1;
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
        font-size: 14px;
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
        font-size: 16px;
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

    .link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #3498db;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .link:hover {
        color: #2980b9;
        text-decoration: underline;
    }

    .link i {
        margin-right: 8px;
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

    .register-container {
        animation: fadeIn 0.6s ease-out;
    }

    .password-requirements {
        font-size: 12px;
        color: #7f8c8d;
        margin-top: 5px;
        text-align: left;
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
</head> <body> <div class="register-container"> <div class="logo"> <i class="fas fa-store"></i> </div> <h2>Join Our E-Store</h2>

<script>
    // Tự động ẩn sau 3 giây
    setTimeout(() => {
        document.querySelectorAll('.alert').forEach(el => el.classList.add('fade-out'));
    }, 3000);
</script>
<!-- Form đăng ký -->
<form action="RegisterServlet" method="post">
    <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" name="name" class="input-field" placeholder="Full Name" required>
    </div>

    <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="email" class="input-field" placeholder="Email Address" required>
    </div>

    <div class="form-row">
        <div class="input-group">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" class="input-field" placeholder="Password" required>
        </div>
        <div class="input-group">
            <i class="fas fa-lock"></i>
            <input type="password" name="confirmPassword" class="input-field" placeholder="Confirm Password" required>
        </div>
    </div>
    <div class="password-requirements">
        Password must be at least 8 characters with letters and numbers
    </div>

    <div class="form-row">
        <div class="input-group">
            <i class="fas fa-calendar"></i>
            <input type="date" name="dob" class="input-field" required>
        </div>
        <div class="input-group">
            <i class="fas fa-phone"></i>
            <input type="tel" name="phone" class="input-field" placeholder="Phone Number" required>
        </div>
    </div>

    <button type="submit" class="btn">
        <i class="fas fa-user-plus" style="margin-right: 8px;"></i>
        Create Account
    </button>
</form>

<!-- Quay lại đăng nhập -->
<a href="LoginServlet" class="link">
    <i class="fas fa-arrow-left"></i>
    Back to Sign In
</a>
</div><script> // Thêm hiệu ứng cho các trường input 
document.querySelectorAll('.input-field').forEach(input => { input.addEventListener('focus', function() { this.parentElement.querySelector('i').style.color = '#3498db'; }); input.addEventListener('blur', function() { this.parentElement.querySelector('i').style.color = '#7f8c8d'; }); }); // Hiệu ứng cho logo 
const logo = document.querySelector('.logo i'); setInterval(() => { logo.style.transform = 'scale(1.1)'; setTimeout(() => { logo.style.transform = 'scale(1)'; }, 500); }, 3000); // Set min date for date of birth (18 years ago) 
const dobInput = document.querySelector('input[name="dob"]'); const today = new Date(); const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate()); const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate()); dobInput.min = minDate.toISOString().split('T')[0]; dobInput.max = maxDate.toISOString().split('T')[0]; </script></body> </html>