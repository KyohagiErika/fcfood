<%@ page import="com.fcfood.models.UserAccount" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %><%--
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
            <h2>Cart</h2>
            <p>Review and checkout your cart!</p>
            <table>
                <tr>
                    <th>#</th>
                    <th>Dish</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub-Total</th>
                </tr>
                <%
                    ArrayList<Hashtable<String, String>> cartInfo = (ArrayList<Hashtable<String, String>>) request.getAttribute("cartInfo");
                    int total = 0;
                    StringBuilder rows = new StringBuilder();
                    if (cartInfo != null) {
                        total = (int) request.getAttribute("cartTotal");
                        int i = 1;
                        for (Hashtable<String, String> cart_item : cartInfo) {
                            rows.append("<tr>");
                            rows.append("<td>"+i+"</td>");
                            rows.append("<td>"+cart_item.get("name")+"</td>");
                            rows.append("<td>"+cart_item.get("price")+"</td>");
                            rows.append("<td>"+cart_item.get("quantity")+"</td>");
                            rows.append("<td>"+cart_item.get("subtotal")+"</td>");
                            rows.append("</tr>");
                            i++;
                        }
                    }
                %>
                <%=rows%>
                <tr>
                    <th colspan="4">Total</th>
                    <th><%=total%></th>
                </tr>
            </table>
            <%
                StringBuilder form = new StringBuilder();
                if (total > 0) {
                    form.append("<form action=\"\" method=\"post\">");
                    form.append("<input type=\"hidden\" name=\"total\" value=\""+total+"\">");
                    form.append("<input type=\"submit\" value=\"Checkout\">");
                    form.append("</form>");
                }
            %>
            <%=form%>
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
