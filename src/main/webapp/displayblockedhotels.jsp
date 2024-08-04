<%@page import="com.HMS.entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blocked Hotels</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
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
</style>
</head>
<body>
<c:choose>
    <c:when test="${not empty blockedhotels}">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Mobile Number</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${blockedhotels}" var="hotel">
                    <tr>
                        <td>${hotel.id}</td>
                        <td>${hotel.name}</td>
                        <td>${hotel.email}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.mobilenumber}</td>
                        <td>${hotel.status}</td>
                        <td><a href="unblockhotel?id=${hotel.id}">Unblock</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="adminoptions.jsp">Back to Menu</a><br>
        <a href="adminlogout">Logout</a>
    </c:when>
    <c:otherwise>
        <p>No blocked hotels to display.</p>
        <a href="adminoptions.jsp">Back to Menu</a>
    </c:otherwise>
</c:choose>
</body>
</html>
