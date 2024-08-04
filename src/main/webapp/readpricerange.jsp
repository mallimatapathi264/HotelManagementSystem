<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fetch Products by Price Range</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 40px;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .form-container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    h2 {
        color: #333;
        text-align: center;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    form input[type="number"] {
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 20px;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="form-container">
    <h2>Fetch Products by Price Range</h2>
    <form action="fetchproductsbetweenpricerange">
        Enter min price: <input type="number" name="minprice" /><br>
        Enter max price: <input type="number" name="maxprice" /><br>
        <input type="submit" value="Fetch Products">
    </form>
</div>
</body>
</html>
