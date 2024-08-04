<%@page import="com.HMS.entities.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Management Options</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        margin: 40px;
        padding: 20px;
        text-align: center;
    }
    h1 {
        color: #007bff;
    }
    a {
        text-decoration: none;
        color: #007bff;
        padding: 10px 15px;
        margin: 10px;
        border: 1px solid #007bff;
        border-radius: 5px;
        display: inline-block;
    }
    a:hover {
        background-color: #007bff;
        color: white;
    }
    .menu {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        display: inline-block;
    }
</style>
</head>
<body>
<%
Integer hotel = (Integer) session.getAttribute("hotelinfo");
if (hotel != null) {
%>
    <div class="menu">
        <h1>${message}</h1><br>
        <a href="addproduct">Add Product</a><br>
        <a href="fetchallhotelproducts">View all products</a><br>
        <a href="updateproductbyid.jsp">Update product by id</a><br>
        <a href="">Delete Product by id</a><br>
    </div>
<%
} else {
%>
    <a href="Hotellogin.jsp">Login first</a>
<%
}
%>
</body>
</html>
