<%@ page import="com.fcfood.models.UserAccount" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.ArrayList" %><%--
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
            <h2>Dishes</h2>
            <p>Discover our dishes!</p>
            <form action="">
                <h4>Search</h4>
                <input type="hidden" name="action" value="search">
                <div class="form-group">
                    <label for="">Dish name</label>
                    <input type="text" name="name">
                </div>
                <input type="submit">
            </form>
            <form action="">
                <h4>Category Filter</h4>
                <%
                    ArrayList<Hashtable<String, String>> categories = (ArrayList<Hashtable<String, String>>) request.getAttribute("categories");
                    StringBuilder rows = new StringBuilder();
                    if (categories != null) {
                        for (int i = 0; i < categories.size(); i++) {
                            rows.append("<div class=\"form-group\">");
                            rows.append("<input type=\"checkbox\" name=\"categories\" value=\""+categories.get(i).get("id")+"\">");
                            rows.append("<label>"+categories.get(i).get("name")+"</label>");
                            rows.append("</div>");
                        }
                    }
                %>
                <%=rows%>
                <input type="submit">
            </form>
            <div>
                <%
                    ArrayList<Hashtable<String, String>> dishes = (ArrayList<Hashtable<String, String>>) request.getAttribute("dishes");
                    rows = new StringBuilder();
                    if (dishes != null) {
                        for (int i = 0; i < dishes.size(); i++) {
                            rows.append("<div class=\"dish-item\">");
                            rows.append("<h3>"+dishes.get(i).get("name")+"</h3>");
                            rows.append("<p>Price: "+dishes.get(i).get("price")+"</p>");
                            rows.append("<p>"+dishes.get(i).get("description")+"</p>");
                            rows.append("<img src=\""+dishes.get(i).get("img_link")+"\" alt=\""+dishes.get(i).get("name")+"\">");
                            rows.append("<p>Categories: "+dishes.get(i).get("categories")+"</p>");
                            rows.append("<form action=\"\" method=\"post\">");
                            rows.append("<input type=\"hidden\" name=\"id\" value=\""+dishes.get(i).get("id")+"\">");
                            rows.append("<input type=\"number\" min=\"1\" name=\"quantity\" value=\"1\">");
                            rows.append("<input type=\"submit\" value=\"Add to cart\">");
                            rows.append("</form>");
                            rows.append("</div>");
                        }
                    }
                %>
                <%=rows%>
<%--                <div>--%>
<%--                    <h3>Dish name</h3>--%>
<%--                    <p>Price: </p>--%>
<%--                    <p>Dish description</p>--%>
<%--                    <img src="" alt="Dish name">--%>
<%--                    <p>Categories: </p>--%>
<%--                    <form action="" method="post">--%>
<%--                        <input type="hidden" name="id" value="">--%>
<%--                        <input type="number" min="1" name="quantity">--%>
<%--                        <input type="submit" value="Add to cart">--%>
<%--                    </form>--%>
<%--                </div>--%>
            </div>
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
