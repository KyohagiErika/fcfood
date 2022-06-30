<%--
  Created by IntelliJ IDEA.
  User: favef
  Date: 14/06/2022
  Time: 10:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=application.getInitParameter("Title")%></title>
    <link rel="stylesheet" href="./css/all.css">
</head>
<body>
<div id="root">
    <a href="/">Back to home</a>
    <h1>Register</h1>
    <form action="" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="pass">Password:</label>
            <input type="password" name="pass" id="pass">
        </div>
        <div>
            <label for="confirm_pass">Confirm Password:</label>
            <input type="password" name="confirm_pass" id="confirm_pass">
        </div>
        <hr>
        <div>
            <label for="mail">Email:</label>
            <input type="email" name="mail" id="mail">
        </div>
        <div>
            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" id="phone">
        </div>
        <div>
            <label for="first_name">First Name:</label>
            <input type="text" name="first_name" id="first_name">
        </div>
        <div>
            <label for="last_name">Last Name:</label>
            <input type="text" name="last_name" id="last_name">
        </div>
        <div>
            <input type="checkbox" name="agree" id="agree">
            <label for="agree">I agree to the Terms and Conditions and wish to proceed</label>
        </div>
        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
