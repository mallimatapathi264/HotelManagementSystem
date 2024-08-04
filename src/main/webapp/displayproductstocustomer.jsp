<%@page import="com.HMS.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        text-align: center;
    }
    table {
        width: 80%;
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
    button {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button a {
        color: white;
        text-decoration: none;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<c:choose>
    <c:when test="${not empty productList}">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Cost</th>
                    <th>Add</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td>${product.name}</td>
                        <td>${product.type}</td>
                        <td>${product.cost}</td>
                        <td><a href="additem?id=${product.id}">Add</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button><a href="viewaddeditemstocustomer.jsp">Proceed to Buy</a></button>
    </c:when>
    <c:otherwise>
        <p>No products available.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
