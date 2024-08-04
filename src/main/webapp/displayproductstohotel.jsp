<%@page import="com.HMS.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 40px;
        padding: 20px;
    }
    table {
        width: 100%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    a {
        text-decoration: none;
        color: #007bff;
    }
    a:hover {
        text-decoration: underline;
    }
    .actions a {
        margin-right: 10px;
    }
</style>
</head>
<body>
<p>${message}</p>
<c:choose>
    <c:when test="${not empty products}">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Cost</th>
                    <th>Discount</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.type}</td>
                        <td>${product.cost}</td>
                        <td>${product.discount}</td>
                        <td><a href="updateproduct?id=${product.id}">Update</a></td>
                        <td><a href="delete?id=${product.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="hoteloptions.jsp">Back to Main Menu</a><br>
        <a href="hotellogout">Logout</a>
    </c:when>
    <c:otherwise>
        <p>No products available.</p>
        <a href="hoteloptions.jsp">Back to Main Menu</a>
    </c:otherwise>
</c:choose>
</body>
</html>
