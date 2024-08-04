<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter Receiver Address</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 40px;
        padding: 20px;
        color: #333;
    }
    h1 {
        color: #007bff;
    }
    form {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        margin: auto;
    }
    label {
        margin-bottom: 10px;
        display: block;
    }
    .form-group {
        margin-bottom: 15px;
    }
    input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Added to ensure padding does not affect width */
    }
    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<h1>Enter Receiver Address</h1>
<form:form action="saveFoodOrder" modelAttribute="foodOrderObj">
    <div class="form-group">
        <label for="name">Enter Name:</label>
        <form:input path="name" id="name"/>
    </div>
    <div class="form-group">
        <label for="mobileNumber">Enter Mobile Number:</label>
        <form:input path="mobileNumber" id="mobileNumber"/>
    </div>
    <div class="form-group">
        <label for="address">Enter Address:</label>
        <form:input path="address" id="address"/>
    </div>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
