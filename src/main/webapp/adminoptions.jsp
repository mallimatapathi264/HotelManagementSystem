<%@ page import="com.HMS.entities.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 40px;
            padding: 20px;
        }
        h1, h2 {
            color: #333;
        }
        a {
            text-decoration: none;
            color: #0056b3;
        }
        a:hover {
            text-decoration: underline;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .links {
            margin-top: 20px;
        }
        .links h1 {
            margin-bottom: 10px;
        }
        .links a {
            display: block;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            Admin a = (Admin) session.getAttribute("admininfo");
            if (a != null) {
        %>
        <h1>${message}</h1>
        <div class="links">
            <h1><a href="fetchunapprovedhotels">Approve Hotel</a></h1>
            <h1><a href="fetchunblockedhotels">Block Hotel</a></h1>
            <h1><a href="fetchblockedhotels">Unblock Hotel</a></h1>
            <h1><a href="provideddiscount">Provide Discount</a></h1>
        </div>
        <%
            } else {
        %>
        <h2>Please Login first</h2>
        <a href="Adminlogin.jsp">Login</a>
        <%
            }
        %>
    </div>
</body>
</html>
