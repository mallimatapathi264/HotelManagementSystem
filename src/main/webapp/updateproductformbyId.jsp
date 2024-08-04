<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product Details</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .form-container {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    h1 {
        color: #333;
        text-align: center;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    form label {
        margin-bottom: 5px;
    }
    form input[type="text"],
    form input[type="number"] {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
    }
    input[type="submit"] {
        background-color: #0056b3;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #004494;
    }
</style>
</head>
<body>
<div class="form-container">
    <h1>Update Product Details</h1>
    <form:form action="updateproductinfobyid" modelAttribute="existingProductinfobyId">
        Id: <form:input path="id" readonly="true"/><br>
        Enter Name: <form:input path="name"/> <br>
        Enter Type: <form:input path="type"/> <br>
        Enter Cost: <form:input path="cost"/> <br>
        Enter Discount: <form:input path="discount"/> <br>
        <input type="submit" value="Update Product"/>
    </form:form>
</div>
</body>
</html>
