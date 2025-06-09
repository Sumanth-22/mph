<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="miniProject1.Vital" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home Page - Vitals Graph</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
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
            font-size: 18px;
            /* Larger font size */
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
        #vitalsChart { 
            max-height: 400px; 
        }
        h2 {
            font-size: 36px; /* Adjusted font size */
            color: #343a40; /* Dark grey color */
            margin-bottom: 20px; /* Adjusted margin */
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
        <h2 class="text-center mb-4">Doctor Home Page - Vitals Graph</h2>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% 
            }
        %>
        <canvas id="vitalsChart"></canvas>
    </div>
    <%
        List<Vital> vitals = (List<Vital>) request.getAttribute("vitals");
        StringBuilder labels = new StringBuilder("[");
        StringBuilder bpLowData = new StringBuilder("[");
        StringBuilder bpHighData = new StringBuilder("[");
        StringBuilder spo2Data = new StringBuilder("[");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (vitals != null) {
            for (int i = 0; i < vitals.size(); i++) {
                Vital vital = vitals.get(i);
               labels.append("\"").append(sdf.format(vital.getRecordedOn())).append("\"");
                bpLowData.append(vital.getBpLow());
                bpHighData.append(vital.getBpHigh());
                spo2Data.append(vital.getSpo2());
                if (i < vitals.size() - 1) {
                    labels.append(",");
                    bpLowData.append(",");
                    bpHighData.append(",");
                    spo2Data.append(",");
                }
            }
        }
        labels.append("]");
        bpLowData.append("]");
        bpHighData.append("]");
        spo2Data.append("]");
        
    %>
    <script>
        const ctx = document.getElementById('vitalsChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: <%= labels.toString() %>,
                datasets: [
                    {
                        label: 'BP Low',
                        data: <%= bpLowData.toString() %>,
                        borderColor: 'violet',
                        fill: false
                    },
                    {
                        label: 'BP High',
                        data: <%= bpHighData.toString() %>,
                        borderColor: 'green',
                        fill: false
                    },
                    {
                        label: 'SPO2',
                        data: <%= spo2Data.toString() %>,
                        borderColor: 'red',
                        fill: false
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Recorded On'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Value'
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
