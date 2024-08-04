<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        width: 300px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    input[type="email"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #0056b3;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #004494;
    }
</style>
</head>
<body>
<div class="login-container">
    ${message}
    <form action="customerloginvalidate" method="post">
        <h1>Enter to Login</h1>
        Enter Email:<input type="email" name="email" required>
        <br>
        Enter Password:<input type="password" name="password" required>
        <br>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
