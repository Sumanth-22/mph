<!DOCTYPE html>
<html>
<head>
<title>Health Logger - Doctor Login</title>
<style>
body {
text-align: center;
font-family: Arial, sans-serif;
padding-top: 100px;
background-color: #f0f8ff; /* Light blue background */
}

.login-button {
margin-top: 20px;
font-size: 20px; /* Change the size of the button text */
padding: 10px 20px; /* Adjust the padding for the button */
background-color: #4CAF50; /* Green background */
color: white; /* White text */
border: none; /* Remove border */
border-radius: 5px; /* Rounded corners */
cursor: pointer; /* Pointer cursor on hover */
}

.login-button:hover {
background-color: #45a049; /* Darker green on hover */
}

h2 {
font-size: 36px; /* Change the size of the heading */
color: #00008B; /* Dark blue color for the heading */
font-weight: bold; /* Make the heading bold */
}
</style>
</head>
<body>
<h2>Health Logger</h2>
<form action="doctorLoginPage.jsp" method="post">
<input type="submit" value="Doctor Login" class="login-button">
</form>

</body>
</html>
