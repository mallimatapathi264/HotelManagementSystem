<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Login</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        width: 300px;
    }
    h1 {
        color: #007bff;
        text-align: center;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    input[type="email"], input[type="password"], input[type="submit"] {
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Ensures padding does not affect the width */
    }
    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="login-container">
    <h1>${message}</h1>
    <form action="hotelloginvalidate" method="post">
        Enter Email: <input type="email" name="email"><br>
        Enter Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
