<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Options</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 40px;
        padding: 20px;
        text-align: center;
    }
    .content {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: auto;
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
        display: inline-block;
    }
    a:hover {
        background-color: #007bff;
        color: white;
    }
</style>
</head>
<body>
<div class="content">
    ${message}
    <%
        Integer customer_id = (Integer) session.getAttribute("customerinfo");
        if (customer_id != null) {
    %>
        <h1>Welcome to Customer Options Page</h1>
        <a href="readhotelname.jsp">View Products By Hotel</a><br>
        <a href="fetchallproducts">Buy Products</a><br>
        <a href="readpricerange.jsp">View Products Between Price Range</a><br>
    <%
        } else {
    %>
        <h1><a href="customerlogin.jsp">Login First</a></h1>
    <%
        }
    %>
</div>
</body>
</html>
