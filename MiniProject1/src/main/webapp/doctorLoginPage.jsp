<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Roboto', sans-serif; /* Changed font */
            background-color: #e9ecef; /* Light grey background */
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0; 
        }
        .container { 
            text-align: center; 
            background-color: #ffffff; 
            padding: 40px; /* Increased padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 0 15px rgba(0,0,0,0.2); /* Slightly darker shadow */
        }
        .btn-login { 
            background-color: #28a745; /* Green background */
            color: #ffffff; 
            padding: 12px 25px; /* Increased padding */
            border: none; 
            border-radius: 8px; /* More rounded corners */
            text-decoration: none; 
            font-size: 18px; /* Larger font size */
        }
        .btn-login:hover { 
            background-color: #218838; /* Darker green on hover */
        }
        h1 {
            font-size: 48px; /* Larger heading */
            color: #343a40; /* Dark grey color */
        }
        h3 {
            font-size: 24px; /* Larger subheading */
            color: #6c757d; /* Medium grey color */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Health Logger</h1>
        <h3>Hello, Doctor</h3>
        <a href="login.jsp" class="btn-login mt-4 d-inline-block">Doctor Login</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
