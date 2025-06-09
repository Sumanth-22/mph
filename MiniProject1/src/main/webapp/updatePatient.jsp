<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="miniProject1.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger - Update Patient</title>
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
        Patient patient = (Patient) request.getAttribute("patient");
    %>
    <div class="container">
        <h2>Health Logger</h2>
        <p>Update Patient Information</p>
        <form action="PatientServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= patient.getId() %>">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="<%= patient.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= patient.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= patient.getPhone() %>" required>
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" value="<%= patient.getAge() %>" required>
            </div>
            <div class="form-group">
                <label for="diagnosis">Diagnosis</label>
                <input type="text" id="diagnosis" name="diagnosis" value="<%= patient.getDiagnosis() %>" required>
            </div>
            <div class="form-group">
                <label for="remark">Remark</label>
                <input type="text" id="remark" name="remark" value="<%= patient.getRemark() %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="male" <%= "male".equals(patient.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="female" <%= "female".equals(patient.getGender()) ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <button type="submit" class="btn-submit">Update</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
