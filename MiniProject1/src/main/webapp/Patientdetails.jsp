<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="miniProject1.Patient" %>
<%
    if (session.getAttribute("doctorEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Home Page - Patient Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f4ff; /* Soft lavender */
        }

        .navbar {
            background-color: #5e60ce; /* Deep violet */
            color: white;
            padding: 10px 20px;
        }

        .navbar .navbar-brand {
            color: #ffffff !important;
            font-weight: bold;
            font-size: 24px;
        }

        .navbar .btn-custom {
            background-color: #4ea8de;
            color: white;
            border: none;
        }

        .navbar .btn-custom:hover {
            background-color: #3b8bb7;
            color: #fff;
        }

        .logout a {
            color: #ff6b6b;
            font-weight: bold;
            font-size: 18px;
            text-decoration: none;
        }

        .logout a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 1200px;
            margin: 100px auto 40px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            font-size: 32px;
            color: #3c096c;
            margin-bottom: 25px;
            text-align: center;
        }

        h3 {
            font-size: 22px;
            color: #5c5f66;
            margin-bottom: 15px;
        }

        .table th {
            background-color: #5e60ce;
            color: white;
        }

        .btn-info {
            background-color: #38b000;
            border: none;
        }

        .btn-info:hover {
            background-color: #2d8700;
        }

        .btn-primary {
            background-color: #9d4edd;
            border: none;
        }

        .btn-primary:hover {
            background-color: #7b2cbf;
        }

        .btn-danger {
            background-color: #e5383b;
            border: none;
        }

        .btn-danger:hover {
            background-color: #b02a2e;
        }

        .alert-danger {
            background-color: #ffe6e6;
            color: #b22222;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="dashboard.jsp">Health Logger</a>
        <div class="banner-buttons ms-auto d-flex">
            <a href="Searchpatient.jsp" class="btn btn-custom btn-sm me-2">Search Patient</a>
            <a href="Addpatient.jsp" class="btn btn-custom btn-sm me-2">Add Patient</a>
            <a href="VitalServlet?action=list" class="btn btn-custom btn-sm">Manage Vitals</a>
        </div>
        <div class="logout ms-3">
            <a href="LogoutServlet">Logout</a>
        </div>
    </div>
</nav>

<div class="container">
    <h2>Doctor Home Page - Patient Details</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert alert-danger text-center"><%= error %></div>
    <%
        }
    %>

    <h3>Patients (
        <%
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            out.print(patients != null ? patients.size() : 0);
        %>
    )</h3>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Sr.No</th>
                <th>Name - Age</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Diagnosis</th>
                <th>Remark</th>
                <th>Gender</th>
                <th>Action</th>
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
                <td><%= patient.getName() %> - <%= patient.getAge() %></td>
                <td><%= patient.getEmail() %></td>
                <td><%= patient.getPhone() %></td>
                <td><%= patient.getDiagnosis() != null ? patient.getDiagnosis() : "N/A" %></td>
                <td><%= patient.getRemark() != null ? patient.getRemark() : "N/A" %></td>
                <td><%= patient.getGender() %></td>
                <td>
                    <a href="Addvitals.jsp?patient_id=<%= patient.getId() %>&patient_name=<%= patient.getName() %>" class="btn btn-info btn-sm">Manage Vitals</a>
                    <a href="PatientServlet?action=edit&id=<%= patient.getId() %>" class="btn btn-primary btn-sm">Update</a>
                    <a href="PatientServlet?action=delete&id=<%= patient.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
