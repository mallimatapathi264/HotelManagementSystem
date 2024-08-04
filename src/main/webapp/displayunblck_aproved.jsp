<%@page import="com.HMS.entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approved Hotels</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 40px;
        padding: 20px;
        color: #333;
    }
    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
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
        padding: 5px 10px;
        color: white;
        background-color: #dc3545;
        border-radius: 5px;
        text-align: center;
    }
    .actions a:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
<% 
    List<Hotel> hotels = (List<Hotel>) request.getAttribute("approvedhotels");
%>
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
        <% 
            for (Hotel h : hotels) { 
        %>
        <tr>
            <td><%= h.getId() %></td>
            <td><%= h.getName() %></td>
            <td><%= h.getEmail() %></td>
            <td><%= h.getAddress() %></td>
            <td><%= h.getMobilenumber() %></td>
            <td><%= h.getStatus() %></td>
            <td class="actions">
                <a href="blockhotel?id=<%= h.getId() %>">Block</a>
            </td>
        </tr>
        <% 
            } 
        %>
    </tbody>
</table>
<a href="adminoptions.jsp">Back to Menu</a> <br>   
<a href="adminlogout">Logout</a>
</body>
</html>
