<%@page import="com.HMS.entities.FoodOrder"%>
<%@page import="com.HMS.entities.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 40px;
            padding: 20px;
            text-align: center;
        }
        table {
            width: 60%;
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
        li {
            list-style-type: none;
        }
    </style>
</head>
<body>
    <c:choose>
        <c:when test="${not empty foodOrderInfo}">
            <c:set var="f" value="${foodOrderInfo}" />
            <ul>
                <li>Name: ${f.name}</li>
                <li>Mobile Number: ${f.mobileNumber}</li>
            </ul>
            <table>
                <thead>
                    <tr>
                        <th>Items</th>
                        <th>Quantity</th>
                        <th>Cost</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${f.items}" var="item">
                        <tr>
                            <td>${item.name}</td>
                            <td>${item.quantity}</td>
                            <td>${item.cost}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul>
                <li>Address: ${f.address}</li>
                <li>Total Price: ${f.totalprice}</li>
            </ul>
            <h1>Food Ordered Successfully</h1>
        </c:when>
        <c:otherwise>
            <h1>No Order Information Available</h1>
        </c:otherwise>
    </c:choose>
</body>
</html>
