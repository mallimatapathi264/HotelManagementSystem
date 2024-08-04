<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Hotel</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 40px;
        padding: 20px;
        color: #333;
    }
    h2 {
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
    .form-group {
        margin-bottom: 15px;
    }
    label {
        margin-bottom: 10px;
        display: block;
    }
    input[type="text"], input[type="password"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Ensures padding does not affect width */
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
<h2>Register Hotel</h2>
<form:form action="savehotel" modelAttribute="hotelobj">
    <div class="form-group">
        <label for="name">Enter Hotel Name:</label>
        <form:input path="name" id="name"/>
    </div>
    <div class="form-group">
        <label for="mobilenumber">Enter Contact Number:</label>
        <form:input path="mobilenumber" id="mobilenumber"/>
    </div>
    <div class="form-group">
        <label for="address">Enter Address:</label>
        <form:input path="address" id="address"/>
    </div>
    <div class="form-group">
        <label for="email">Enter Email:</label>
        <form:input path="email" id="email"/>
    </div>
    <div class="form-group">
        <label for="password">Enter Password:</label>
        <form:input path="password" id="password" type="password"/>
    </div>
    <input type="submit" value="Register"/>
</form:form>
</body>
</html>
