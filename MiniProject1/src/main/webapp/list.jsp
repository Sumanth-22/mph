<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="miniProject1.Vital" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home Page - Vitals Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
        .container { max-width: 1200px; margin: auto; background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-top: 80px; margin-bottom: 40px; }
        .table { margin-top: 20px; }
        .error { color: red; margin-bottom: 15px; }
        .navbar { background-color: #f8f9fa; position: fixed; top: 0; width: 100%; z-index: 1000; }
        .logout { position: absolute; top: 10px; right: 10px; }
        .logout a { color: #dc3545; text-decoration: none; font-size: 16px; }
        .logout a:hover { text-decoration: underline; }
        .banner-buttons { margin-left: auto; }
        .banner-buttons a { margin-left: 10px; }
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
                <a href="Addvitals.jsp" class="btn btn-success btn-sm">Record New Vital</a>
                <a href="VitalServlet?action=alerts" class="btn btn-warning btn-sm">Vital Alerts</a>
                <a href="VitalServlet?action=graph" class="btn btn-info btn-sm">Graph</a>
                <a href="LogoutServlet">Logout</a>
            </div>
            <%-- <div class="logout">
                <a href="LogoutServlet">Logout</a>
            </div>
             --%>
        </div>
    </nav>
    <div class="container">
        <h2 class="text-center mb-4">Doctor Home Page - Vitals Details</h2>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% 
            }
        %>
        <h3>Vitals (<%
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
                    <td><%= vital.getBpLow() %></td>
                    <td><%= vital.getBpHigh() %></td>
                    <td><%= vital.getSpo2() %></td>
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