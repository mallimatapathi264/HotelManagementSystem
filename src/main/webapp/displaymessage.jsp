<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Page</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 40px;
        padding: 20px;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    a {
        text-decoration: none;
        color: #007bff;
        margin-top: 20px;
        display: inline-block;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<h1>${message}</h1>
<a href="HotelHomepage.jsp">Back to Home Page</a>
</body>
</html>
