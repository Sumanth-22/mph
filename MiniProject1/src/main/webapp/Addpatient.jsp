<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger - Add Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Lato', sans-serif; /* Changed font */
            background-color: #f0f8ff; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0; 
        }
        .container { 
            max-width: 450px; 
            margin: 60px auto; /* Adjusted margin */
            background-color: #ffffff; 
            padding Adjusted padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 0 20px rgba(0,0,0,0.2); /* Darker shadow */
        }
        .form-group { 
            margin-bottom: 20px; /* Adjusted margin */
        }
        .form-group label { 
            display: block; 
            margin-bottom: 8px; /* Adjusted margin */
            font-size: 18px; /* Adjusted font size */
            color: #343a40; /* Dark grey color */
        }
        .form-group input, .form-group select { 
            width: 100%; 
            padding: 10px; /* Adjusted padding */
            border: 1px solid #ced4da; 
            border-radius: 8px; /* More rounded corners */
            font-size: 16px; /* Adjusted font size */
        }
        .btn-submit { 
            background-color: #007bff; /* Bootstrap blue color */
            color: #ffffff; 
            padding: 12px; /* Adjusted padding */
            border: none; 
            border-radius: 8px; /* More rounded corners */
            width: 100%; 
            font-size: 18px; /* Adjusted font size */
        }
        .btn-submit:hover { 
            background-color: #0056b3; /* Darker blue on hover */
        }
        .navbar { 
            background-color: #f0f8ff; /* Light blue background */
            position: absolute; 
            top: 0; 
            width: 100%; 
            padding: 10px 0; /* Added padding */
        }
        .logout { 
            position: absolute; 
            top: 60px; 
            right: 20px; /* Adjusted position */
        }
        .logout a { 
            color: #dc3545; 
            text-decoration: none; 
            font-size: 18px; /* Larger font size */
        }
        .logout a:hover { 
            text-decoration: underline; 
        }
        h2 {
            font-size: 36px; /* Adjusted font size */
            color: #343a40; /* Dark grey color */
            margin-bottom: 20px; /* Adjusted margin */
        }
        p {
            font-size: 20px; /* Larger font size */
            color: #6c757d; /* Medium grey color */
        }
    </style>
</head>
<body>
    <%
        if (session.getAttribute("doctorEmail") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <nav class="navbar">
        <div class="logout">
            <a href="LogoutServlet">Logout</a>
        </div>
    </nav>
    <div class="container">
        <h2>Health Logger</h2>
        <p>Add New Patient</p>
        <form action="PatientServlet" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required>
            </div>
            <div class="form-group">
                <label for="diagnosis">Diagnosis</label>
                <input type="text" id="diagnosis" name="diagnosis" required>
            </div>
            <div class="form-group">
                <label for="remark">Remark</label>
                <input type="text" id="remark" name="remark" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <button type="submit" class="btn btn-submit">Submit</button>
        </form>
    </div>
</body>
</html>
