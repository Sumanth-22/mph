<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="miniProject1.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger - Search Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Lato', sans-serif; /* Changed font */
            background-color: #f0f8ff; /* Light blue background */
        }
        .container { 
            max-width: 1200px; 
            margin: auto; 
            background-color: #ffffff; 
            padding: 30px; /* Adjusted padding */
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 0 20px rgba(0,0,0,0.2); /* Darker shadow */
            margin-top: 80px; /* Adjusted margin */
            margin-bottom: 40px; 
        }
        .search-form { 
            margin-bottom: 20px; 
        }
        .input-group input { 
            font-size: 16px; /* Adjusted font size */
            padding: 10px; /* Adjusted padding */
            border-radius: 8px; /* More rounded corners */
        }
        .input-group button { 
            font-size: 16px; /* Adjusted font size */
            padding: 10px 20px; /* Adjusted padding */
            border-radius: 8px; /* More rounded corners */
        }
        .error { 
            color: #dc3545; /* Bootstrap red color */
            margin-bottom: 15px; 
        }
        .navbar { 
            background-color: #f0f8ff; /* Light blue background */
            position: fixed; 
            top: 0; 
            width: 100%; 
            z-index: 1000; 
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
        h3 {
            font-size: 24px; /* Adjusted font size */
            color: #6c757d; /* Medium grey color */
        }
        .alert {
            font-size: 16px; /* Adjusted font size */
        }
        .table {
            margin-top: 20px;
        }
        .table th, .table td {
            font-size: 16px; /* Adjusted font size */
        }
        .btn-sm {
            font-size: 14px; /* Adjusted font size */
            padding: 8px 12px; /* Adjusted padding */
            border-radius: 5px; /* More rounded corners */
        }
    </style>
</head>
<body>
    <%
        if (session.getAttribute("doctorEmail") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">Health Logger</a>
            <div class="navbar-nav">
                <a class="nav-link" href="dashboard.jsp">Home</a>
                <a class="nav-link" href="AddPatient.jsp">Add Patient</a>
            </div>
            <div class="logout">
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <h2 class="text-center mb-4">Search Patient</h2>
        <form action="PatientServlet" method="get" class="search-form">
            <input type="hidden" name="action" value="search">
            <div class="input-group">
                <input type="text" name="query" class="form-control" placeholder="Search by name..." required>
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% 
            }
        %>
        <h3>Results (<%
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            out.print(patients != null ? patients.size() : 0);
        %>)</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Sr.No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Age</th>
                    <th>Diagnosis</th>
                    <th>Remark</th>
                    <th>Gender</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (patients != null) {
                        for (int i = 0; i < patients.size(); i++) {
                            Patient patient = patients.get(i);
                %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= patient.getName() %></td>
                    <td><%= patient.getEmail() %></td>
                    <td><%= patient.getPhone() %></td>
                    <td><%= patient.getAge() %></td>
                    <td><%= patient.getDiagnosis() != null ? patient.getDiagnosis() : "N/A" %></td>
                    <td><%= patient.getRemark() != null ? patient.getRemark() : "N/A" %></td>
                    <td><%= patient.getGender() %></td>
                    <td>
                        <a href="PatientServlet?action=edit&id=<%= patient.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="PatientServlet?action=delete&id=<%= patient.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
