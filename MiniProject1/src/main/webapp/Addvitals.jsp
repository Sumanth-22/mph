<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="miniProject1.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger - Add Vitals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Lato', sans-serif; /* Changed font */
            background-color: #f0f8ff; /* Light blue background */
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0; 
        }
        .container { 
            max-width: 450px; /* Increased max-width */
            margin: 60px auto; /* Adjusted margin */
            background-color: #ffffff; 
            padding: 40px; /* Adjusted padding */
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
        .alert {
            font-size: 16px; /* Adjusted font size */
        }
    </style>
</head>
<body>
    <%
        if (session.getAttribute("doctorEmail") == null) {
            response.sendRedirect("login.jsp");
        }

        List<Patient> patients = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/health_logger", "root", "root@39");
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patients");
            java.sql.ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                patients.add(new Patient(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("diagnosis"),
                    rs.getString("remark"),
                    rs.getString("gender")
                ));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        }

        String selectedPatientId = request.getParameter("patient_id");
        String selectedPatientName = request.getParameter("patient_name");
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">Health Logger</a>
            <div class="navbar-nav">
                <a class="nav-link" href="dashboard.jsp">Home</a>
            </div>
            <div class="logout">
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <h2 class="text-center mb-4">Add Patient's Vitals</h2>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% 
            }
        %>
        <form action="VitalServlet" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="patient_id">Select Patient</label>
                <select id="patient_id" name="patient_id" required>
                    <%
                        for (Patient patient : patients) {
                            String selected = patient.getId() == (selectedPatientId != null ? Integer.parseInt(selectedPatientId) : -1) ? "selected" : "";
                    %>
                    <option value="<%= patient.getId() %>" <%= selected %>><%= patient.getName() %></option>
                    <%  } %>
                </select>
            </div>
            <div class="form-group">
                <label for="bp_low">BP Low</label>
                <input type="number" id="bp_low" name="bp_low" required>
            </div>
            <div class="form-group">
                <label for="bp_high">BP High</label>
                <input type="number" id="bp_high" name="bp_high" required>
            </div>
            <div class="form-group">
                <label for="spo2">SPO2</label>
                <input type="number" id="spo2" name="spo2" required>
            </div>
            <button type="submit" class="btn btn-submit">Submit</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
