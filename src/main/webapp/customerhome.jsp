<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 40px;
        padding: 20px;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    a {
        text-decoration: none;
        color: #007bff;
        margin: 10px;
        padding: 8px 16px;
        border: 1px solid #007bff;
        border-radius: 4px;
    }
    a:hover {
        background-color: #007bff;
        color: white;
    }
</style>
</head>
<body>
<h1>${message}</h1>
<h1>Customer Home</h1>
<a href="addcustomer">Register</a><br>
<a href="customerlogin.jsp">Login</a>
</body>
</html>
