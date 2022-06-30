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
    <h1>Login</h1>
    <p><%=request.getAttribute("msg") != null ? request.getAttribute("msg").toString() : ""%></p>
    <form action="" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="pass">Password:</label>
            <input type="password" name="pass" id="pass">
        </div>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
