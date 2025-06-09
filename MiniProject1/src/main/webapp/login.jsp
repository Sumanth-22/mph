<!DOCTYPE html>
<html>
<head>
<title>Doctor Login</title>
<style>
body {
text-align: center;
font-family: 'Roboto', sans-serif; /* Changed font */
padding-top: 100px;
background-color: #f0f8ff; /* Light blue background */
}

input {
margin: 10px;
padding: 12px; /* Increased padding */
border: 1px solid #ced4da; /* Border color */
border-radius: 5px; /* Rounded corners */
font-size: 16px; /* Font size */
}

.login-button {
background-color: #28a745; 
color: white;
padding: 10px 20px; 
border: none;
border-radius: 5px; 
cursor: pointer; 
font-size: 18px; 
}

.login-button:hover {
background-color: #218838; 
}

h2 {
font-size: 36px; 
color: #343a40; 
font-weight: bold;
margin-bottom: 20px;
}
body {
    background-image: url('https://static.vecteezy.com/system/resources/previews/023/639/130/non_2x/molecular-structure-with-hospital-cross-for-medical-chemistry-and-science-concept-background-illustration-vector.jpg'); /* Replace with the actual image URL */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
     height: 100vh; /* Ensures full screen height */
    width: 100vw; /* Ensures full screen width */
    margin: 0; /* Removes any default margins */
    padding: 0;
    overflow: hidden;
}
div {
    position: relative;
    top: 50px; /* Pushes input fields downward */
}

</style>
</head>
<body>

<form action="LoginServlet" method="post">
<div>
<h2>Health Logger</h2>
<input type="text" name="email" placeholder="abc@xyz.com" required><br>
<input type="password" name="password" placeholder="Enter Password" required><br>
<input type="submit" value="Login" class="login-button">
</div>
</form>
<form action="dashboard.jsp" method="post"></form>
</body>
</html>
