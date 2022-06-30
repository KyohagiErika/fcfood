<%@ page import="com.fcfood.models.UserAccount" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %><%--
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
    <header>
        <h1>F-Code Food</h1>
        <h3>Navigation</h3>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/dishes">Dishes</a></li>
            <li><a href="/cart">Cart</a></li>
            <li><a href="/orders">Orders</a></li>
        </ul>
        <%
            String msg;
            Hashtable<String, String> account = (Hashtable<String, String>) session.getAttribute("user");
            if (account != null) {
                msg = "Hello " + account.get("first_name").toString() + " " + account.get("last_name").toString() + "! <a href=\"/logout\">Logout</a>";
            } else {
                msg = "You are not logged in. <a href=\"/login\">Login</a> or <a href=\"/register\">Register</a>";
            }
        %>
        <p><%=msg%></p>
    </header>
    <hr>
    <div>
        <section>
            <h2>Welcome</h2>
            <p>Welcome to F-Code Food! Here we have the best dishes for your meal.</p>
        </section>
        <section>
            <h2>About</h2>
            <p>F-Code Food was born in 2022. Our mission is to bring you the best meal.</p>
            <p>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
            </p>
            <p>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
            </p>
            <p>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
            </p>
        </section>
        <section>
            <h2>License</h2>
            <p>MIT License</p>
            <p>
                Permission is hereby granted, free of charge, to any person obtaining a copy
                of this software and associated documentation files (the "Software"), to deal
                in the Software without restriction, including without limitation the rights
                to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                copies of the Software, and to permit persons to whom the Software is
                furnished to do so, subject to the following conditions:
            </p>
            <p>
                The above copyright notice and this permission notice shall be included in all
                copies or substantial portions of the Software.
            </p>
            <p>
                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
                SOFTWARE.
            </p>
        </section>
    </div>
    <hr>
    <footer>
        <p>Copyright (c) 2022 Lê Thành Long</p>
        <h4>Contact</h4>
        <ul>
            <li>Facebook: <a href="">Lê Thành Long</a></li>
            <li>Gmail: <a href="">favefrong2003@gmail.com</a></li>
            <li>Github: <a href="">fcfood</a></li>
        </ul>
    </footer>
</div>
</body>
</html>
