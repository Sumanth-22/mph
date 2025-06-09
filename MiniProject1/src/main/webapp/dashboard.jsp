<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Health Logger - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background image with overlay */
        body {
            margin: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            background: 
                linear-gradient(rgba(0, 43, 91, 0.6), rgba(0, 43, 91, 0.6)),
                url('https://images.unsplash.com/photo-1588776814546-2bc2c88a1c52?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
            max-width: 520px;
            text-align: center;
        }

        .header h2 {
            color: #002b5b;
            font-weight: 700;
            margin-bottom: 15px;
            font-size: 2.25rem;
        }

        .header p {
            font-size: 1.15rem;
            color: #004080;
            margin-bottom: 30px;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .nav-links a {
            padding: 14px 25px;
            background-color: #007bff;
            color: #fff;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 8px;
            text-decoration: none;
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.4);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .nav-links a:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 16px rgba(0, 86, 179, 0.5);
        }

        /* Navbar with transparent background */
        .navbar {
            position: absolute;
            top: 0;
            width: 100%;
            padding: 12px 20px;
            background: transparent;
            display: flex;
            justify-content: flex-end;
            z-index: 1000;
        }

        .logout a {
            color: #ff4d4d;
            font-weight: 600;
            font-size: 1rem;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 6px;
            background-color: rgba(255, 77, 77, 0.15);
            transition: background-color 0.3s ease;
        }

        .logout a:hover {
            background-color: rgba(255, 77, 77, 0.35);
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .container {
                padding: 30px 25px;
                max-width: 90vw;
            }
            .header h2 {
                font-size: 1.75rem;
            }
            .nav-links a {
                font-size: 1rem;
                padding: 12px 20px;
            }
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
        <div class="header">
            <h2>Health Logger - Dashboard</h2>
            <p>Welcome, <strong><%= session.getAttribute("doctorEmail") %></strong>!</p>
        </div>
        <div class="nav-links">
            <a href="PatientServlet?action=list">Manage Patients</a>
            <a href="VitalServlet?action=list">Manage Vitals</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
