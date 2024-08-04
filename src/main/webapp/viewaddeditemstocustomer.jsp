<%@page import="java.util.List"%>
<%@page import="com.HMS.entities.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 90vh;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 10px;
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
        color: #007bff;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    button {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button a {
        color: white;
        text-decoration: none;
    }
    button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
<%
List<Item> items = (List<Item>) session.getAttribute("itemlist");
if (items != null && !items.isEmpty()) {
%>
<table>
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Cost</th>
            <th>Type</th>
            <th>Quantity</th>
            <th>Remove</th>
        </tr>
    </thead>
    <tbody>
        <%
        int tempid = 0;
        for (Item i : items) {
            tempid++;
        %>
        <tr>
            <td><%= tempid %></td>
            <td><%= i.getName() %></td>
            <td><%= i.getCost() %></td>
            <td><%= i.getType() %></td>
            <td><%= i.getQuantity() %></td>
            <td><a href="removeitem?id=<%= i.getId() %>">Remove</a></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>
<button><a href="addfoodorder">Proceed to buy</a></button>
<%
} else {
    out.println("<p>No items available.</p>");
}
%>
</body>
</html>
