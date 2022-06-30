<%@ page import="com.fcfood.models.UserAccount" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Stack" %><%--
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
      <h2>Your Orders</h2>
      <p>Check your orders.</p>
      <table>
        <tr>
          <th>#</th>
          <th>Payment ID</th>
          <th>Status</th>
          <th>Items</th>
          <th>Total</th>
          <th>Date</th>
          <th colspan="2"></th>
        </tr>
        <%
          ArrayList<Hashtable<String, String>> paymentList = (ArrayList<Hashtable<String, String>>) request.getAttribute("paymentList");
          Hashtable<String, Stack<Hashtable<String, String>>> orderItems = (Hashtable<String, Stack<Hashtable<String, String>>>) request.getAttribute("orderItems");
          StringBuilder rows = new StringBuilder();
          if (paymentList !=  null && orderItems != null) {
            int i = 1;
            for (Hashtable<String, String> payment : paymentList) {
              rows.append("<tr>");
              rows.append("<td>"+i+"</td>");
              rows.append("<td>"+payment.get("payment_id")+"</td>");
              rows.append("<td>"+payment.get("status")+"</td>");
              rows.append("<td>");
              Stack<Hashtable<String, String>> itemStack = orderItems.get(payment.get("payment_id"));
              while (!itemStack.empty()) {
                Hashtable<String, String> item = itemStack.pop();
                rows.append(item.get("name")+" ("+item.get("quantity")+")<br>");
              }
              rows.append("</td>");
              rows.append("<td>"+payment.get("total")+"</td>");
              rows.append("<td>"+payment.get("created_at")+"</td>");
              rows.append("<td>");
              if (payment.get("status").equals("NOT PAID")) {
                rows.append("<form action=\"\" method=\"post\">");
                rows.append("<input type=\"hidden\" name=\"payment_id\" value=\""+payment.get("payment_id")+"\">");
                rows.append("<input type=\"hidden\" name=\"action\" value=\"pay\">");
                rows.append("<input type=\"submit\" value=\"Pay\">");
                rows.append("</form>");
              }
              rows.append("</td>");
              rows.append("<td>");
              if (payment.get("status").equals("NOT PAID")) {
                rows.append("<form action=\"\" method=\"post\">");
                rows.append("<input type=\"hidden\" name=\"payment_id\" value=\""+payment.get("payment_id")+"\">");
                rows.append("<input type=\"hidden\" name=\"action\" value=\"cancel\">");
                rows.append("<input type=\"submit\" value=\"Cancel\">");
                rows.append("</form>");
              }
              rows.append("</td>");
              rows.append("</tr>");
              i++;
            }
          }

        %>
        <%=rows%>
      </table>
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
