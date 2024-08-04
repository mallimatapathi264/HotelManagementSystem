<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 40px;
        padding: 20px;
    }
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: auto;
    }
    h1 {
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        color: #666;
    }
    .error {
        color: red;
        font-size: 0.875em;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Customer Form</h1>
    <form:form action="savecustomer" modelAttribute="customerobj">
        <div class="form-group">
            <label for="name">Enter name:</label>
            <form:input path="name" id="name"/>
        </div>
        <div class="form-group">
            <label for="email">Enter email:</label>
            <form:input path="email" id="email"/>
        </div>
        <div class="form-group">
            <label for="password">Enter password:</label>
            <form:input path="password" id="password" type="password"/>
        </div>
        <div class="form-group">
            <label for="mobilenumber">Enter mobilenumber:</label>
            <form:input path="mobilenumber" id="mobilenumber"/>
        </div>
        <div class="form-group">
            <label for="address">Enter Address:</label>
            <form:input path="address" id="address"/>
        </div>
        <input type="submit" value="Register"/>
        <form:errors path="*" cssClass="error"/>
    </form:form>
</div>
</body>
</html>
