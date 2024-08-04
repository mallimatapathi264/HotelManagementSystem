<%@page import="com.HMS.entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unapproved Hotels</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 40px;
        padding: 20px;
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
        color: white;
        background-color: #28a745;
        padding: 5px 10px;
        border-radius: 5px;
    }
    .actions a.approve {
        background-color: #007bff;
    }
    .actions a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<% 
    List<Hotel> hotels = (List<Hotel>) request.getAttribute("unapprovedhotels");
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
            <th>Actions</th>
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
                <a href="approvehotel?id=<%= h.getId() %>" class="approve">Approve</a>
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
