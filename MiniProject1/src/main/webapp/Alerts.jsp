<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="miniProject1.Vital" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home Page - Vital Alerts</title>
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
            margin-top: 100px; /* Adjusted margin */
            margin-bottom: 40px; 
        }
        .table { 
            margin-top: 20px; 
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
        .banner-buttons { 
            margin-left: auto; 
        }
        .banner-buttons a { 
            margin-left: 10px; 
        }
        .abnormal { 
            background-color: #ffcccc; 
            color: #ff0000; 
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
            <div class="banner-buttons">
                <a href="PatientServlet?action=list" class="btn btn-primary btn-sm">Manage Patients</a>
                <div class="dropdown d-inline-block">
                    <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Export
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="exportDropdown">
                        <li><a class="dropdown-item" href="VitalServlet?action=export&format=pdf">PDF</a></li>
                        <li><a class="dropdown-item" href="VitalServlet?action=export&format=excel">Excel</a></li>
                        <li><a class="dropdown-item" href="VitalServlet?action=export&format=csv">CSV</a></li>
                    </ul>
                </div>
                <a href="AddVitals.jsp" class="btn btn-success btn-sm">Record New Vital</a>
                <a href="VitalServlet?action=alerts" class="btn btn-warning btn-sm">Vital Alerts</a>
                <a href="VitalServlet?action=graph" class="btn btn-info btn-sm">Graph</a>
            </div>
            <div class="logout">
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <h2 class="text-center mb-4">Doctor Home Page - Vital Alerts</h2>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% 
            }
        %>
        <h3>Alerts (<%
            List<Vital> vitals = (List<Vital>) request.getAttribute("vitals");
            out.print(vitals != null ? vitals.size() : 0);
        %>)</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Sr.No</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>BP Low</th>
                    <th>BP High</th>
                    <th>SPO2</th>
                     <th>Recorded On</th>
                    <th>Action</th>
                   
                   
                </tr>
            </thead>
            <tbody>
                <% 
                    if (vitals != null) {
                        for (int i = 0; i < vitals.size(); i++) {
                            Vital vital = vitals.get(i);
                %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= vital.getPatientName() %></td>
                    <td><%= vital.getPatientPhone() %></td>
                    <td class="<%= vital.getBpLow() < 60 ? "abnormal" : "" %>"><%= vital.getBpLow() %></td>
                    <td class="<%= vital.getBpHigh() > 140 ? "abnormal" : "" %>"><%= vital.getBpHigh() %></td>
                    <td class="<%= vital.getSpo2() < 90 ? "abnormal" : "" %>"><%= vital.getSpo2() %></td>
                   <td><%= vital.getRecordedOn() %></td>
                    <td>
                        <a href="VitalServlet?action=delete&id=<%= vital.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
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
