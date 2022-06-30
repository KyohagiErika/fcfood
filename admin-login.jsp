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
    <h1>Admin Login</h1>
    <form action="" method="post">
        <div>
            <label for="token">Token:</label>
            <input type="text" name="token" id="token" value="">
        </div>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
