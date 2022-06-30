<%@ page import="com.fcfood.models.UserAccount" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fcfood.models.Category" %>
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
            <li><a href="#dashboard-section">Dashboard</a></li>
            <li><a href="#users-section">Users</a></li>
            <li><a href="#dishes-section">Dishes</a></li>
            <li><a href="#categories-section">Categories</a></li>
            <li><a href="#dish-category-section">Dish Category</a></li>
        </ul>
        <p><a href="/logout">Logout</a></p>
    </header>
    <hr>
    <section id="dashboard-section">
        <h2>Dashboard</h2>
        <table>
            <tr>
                <th>#</th>
                <th>Payment ID</th>
                <th>Username</th>
                <th>Status</th>
                <th>Order Items</th>
                <th>Total</th>
                <th>Date</th>
            </tr>
            <%
                ArrayList<Hashtable<String, String>> paymentList = (ArrayList<Hashtable<String, String>>) request.getAttribute("paymentList");
                Hashtable<String, Stack<Hashtable<String, String>>> orderItems = (Hashtable<String, Stack<Hashtable<String, String>>>) request.getAttribute("orderItems");
                StringBuilder rows = new StringBuilder();
                if (paymentList != null) {
                    int i = 1;
                    for (Hashtable<String, String> payment : paymentList) {
                        rows.append("<tr>");
                        rows.append("<td>"+i+"</td>");
                        rows.append("<td>"+payment.get("payment_id")+"</td>");
                        rows.append("<td>"+payment.get("username")+"</td>");
                        rows.append("<td>"+payment.get("status")+"</td>");
                        rows.append("<td>");
                        Stack<Hashtable<String, String>> itemStack = orderItems.get(payment.get("payment_id"));
                        while (!itemStack.empty()) {
                            Hashtable<String, String> item = itemStack.pop();
                            rows.append(item.get("dish_name")+" ("+item.get("quantity")+")<br>");
                        }
                        rows.append("</td>");
                        rows.append("<td>"+payment.get("total")+"</td>");
                        rows.append("<td>"+payment.get("created_at")+"</td>");
                        rows.append("</tr>");
                        i++;
                    }
                }
            %>
            <%=rows%>
        </table>
    </section>
    <section id="users-section">
        <h2>Users</h2>
        <table>
            <tr>
                <th>#</th>
                <th>Username</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Created At</th>
                <th>Last Modified</th>
            </tr>
            <%
                ArrayList<Hashtable<String, String>> users = (ArrayList<Hashtable<String, String>>) request.getAttribute("users");
                rows = new StringBuilder();
                if (users != null) {
                    for (int i = 0; i < users.size(); i++) {
                        rows.append("<tr>");
                        rows.append("<td>"+(i+1)+"</td>");
                        rows.append("<td>"+users.get(i).get("username")+"</td>");
                        rows.append("<td>"+users.get(i).get("name")+"</td>");
                        rows.append("<td>"+users.get(i).get("mail")+"</td>");
                        rows.append("<td>"+users.get(i).get("phone")+"</td>");
                        rows.append("<td>"+users.get(i).get("created_at")+"</td>");
                        rows.append("<td>"+users.get(i).get("modified_at")+"</td>");
                        rows.append("</tr>");
                    }
                }

            %>
            <%=rows.toString()%>
            <%--            <tr>--%>
            <%--                <td>1</td>--%>
            <%--                <td>long123</td>--%>
            <%--                <td>Le Thanh Long</td>--%>
            <%--                <td>long@gmail.com</td>--%>
            <%--                <td>0123456789</td>--%>
            <%--                <td>07:53:22 24-06-2022</td>--%>
            <%--                <td>07:53:22 24-06-2022</td>--%>
            <%--            </tr>--%>
        </table>
    </section>
    <section id="dishes-section">
        <h2>Dishes</h2>
        <table>
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Categories</th>
                <th>Image Link</th>
            </tr>
            <%
                ArrayList<Hashtable<String, String>> dishes = (ArrayList<Hashtable<String, String>>) request.getAttribute("dishes");
                rows = new StringBuilder();
                if (dishes != null) {
                    for (int i = 0; i < dishes.size(); i++) {
                        rows.append("<tr>");
                        rows.append("<td>"+(i+1)+"</td>");
                        rows.append("<td>"+dishes.get(i).get("id")+"</td>");
                        rows.append("<td>"+dishes.get(i).get("name")+"</td>");
                        rows.append("<td>"+dishes.get(i).get("description")+"</td>");
                        rows.append("<td>"+dishes.get(i).get("price")+"</td>");
                        rows.append("<td>"+dishes.get(i).get("categories")+"</td>");
                        rows.append("<td>"+dishes.get(i).get("img_link")+"</td>");
                        rows.append("</tr>");
                    }
                }
            %>
            <%=rows%>
            <%--            <tr>--%>
            <%--                <td>1</td>--%>
            <%--                <td>COMCHIEN1</td>--%>
            <%--                <td>Cơm Chiên</td>--%>
            <%--                <td>Cơm chiên trứng</td>--%>
            <%--            </tr>--%>
        </table>

        <form action="" method="post" enctype="multipart/form-data">
            <h3>Add dish</h3>
            <input type="hidden" name="action" value="dish">
            <input type="hidden" name="operation" value="add">
            <div class="form-group">
                <label>ID</label>
                <input type="text" name="id">
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" cols="30" rows="10"></textarea>
            </div>
            <div class="form-group">
                <label>Price</label>
                <input type="number" min="10000" name="price">
            </div>
            <div>
                <label for="">Image</label>
                <input type="file" accept="image/*" name="img">
            </div>
            <input type="submit">
        </form>

        <form action="" method="post">
            <h3>Delete dish</h3>
            <input type="hidden" name="action" value="dish">
            <input type="hidden" name="operation" value="delete">
            <div class="form-group">
                <label>ID</label>
                <select name="id">
                    <%
                        StringBuilder opts = new StringBuilder();
                        if (dishes != null) {
                            for (Hashtable<String, String> dish : dishes) {
                                opts.append("<option value=\""+dish.get("id")+"\">"+dish.get("name")+"</option>");
                            }
                        }
                    %>
                    <%=opts.toString()%>
                </select>
            </div>
            <input type="submit">
        </form>
    </section>
    <section id="categories-section">
        <h2>Category</h2>
        <table>
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>
            <%
                ArrayList<Hashtable<String, String>> categories = (ArrayList<Hashtable<String, String>>) request.getAttribute("categories");
                rows = new StringBuilder();
                if (categories != null) {
                    for (int i = 0; i < categories.size(); i++) {
                        rows.append("<tr>");
                        rows.append("<td>"+(i+1)+"</td>");
                        rows.append("<td>"+categories.get(i).get("id")+"</td>");
                        rows.append("<td>"+categories.get(i).get("name")+"</td>");
                        rows.append("<td>"+categories.get(i).get("description")+"</td>");
                        rows.append("</tr>");
                    }
                }
            %>
            <%=rows%>
        </table>

        <form action="" method="post">
            <h3>Add category</h3>
            <input type="hidden" name="action" value="category">
            <input type="hidden" name="operation" value="add">
            <div class="form-group">
                <label>ID</label>
                <input type="text" name="id">
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" cols="30" rows="10"></textarea>
            </div>
            <input type="submit">
        </form>

        <form action="" method="post">
            <h3>Delete category</h3>
            <input type="hidden" name="action" value="category">
            <input type="hidden" name="operation" value="delete">
            <div class="form-group">
                <label>ID</label>
                <select name="id">
                    <%
                        opts = new StringBuilder();
                        if (categories != null) {
                            for (Hashtable<String, String> category : categories) {
                                opts.append("<option value=\""+category.get("id")+"\">"+category.get("name")+"</option>");
                            }
                        }
                    %>
                    <%=opts.toString()%>
                </select>
            </div>
            <input type="submit">
        </form>
    </section>

    <section id="dish-category-section">
        <h2>Dish Category</h2>
        <table>
            <tr>
                <th>#</th>
                <th>Category ID</th>
                <th>Dish ID</th>
            </tr>
            <%
                ArrayList<Hashtable<String, String>> dishCategories = (ArrayList<Hashtable<String, String>>) request.getAttribute("dish-category");
                rows = new StringBuilder();
                if (dishCategories != null) {
                    for (int i = 0; i < dishCategories.size(); i++) {
                        rows.append("<tr>");
                        rows.append("<td>"+(i+1)+"</td>");
                        rows.append("<td>"+dishCategories.get(i).get("category_id")+"</td>");
                        rows.append("<td>"+dishCategories.get(i).get("dish_id")+"</td>");
                        rows.append("</tr>");
                    }
                }
            %>
            <%=rows%>
        </table>

        <form action="" method="post">
            <h3>Add dish category</h3>
            <input type="hidden" name="action" value="dish-category">
            <input type="hidden" name="operation" value="add">
            <div class="form-group">
                <label>Category</label>
                <select name="category_id">
                    <%
                        opts = new StringBuilder();
                        if (categories != null) {
                            for (Hashtable<String, String> category : categories) {
                                opts.append("<option value=\""+category.get("id")+"\">"+category.get("name")+"</option>");
                            }
                        }
                    %>
                    <%=opts.toString()%>
                </select>
            </div>
            <div class="form-group">
                <label>Dish</label>
                <select name="dish_id">
                    <%
                        opts = new StringBuilder();
                        if (dishes != null) {
                            for (Hashtable<String, String> dish : dishes) {
                                opts.append("<option value=\""+dish.get("id")+"\">"+dish.get("name")+"</option>");
                            }
                        }
                    %>
                    <%=opts.toString()%>
                </select>
            </div>
            <input type="submit">
        </form>

        <form action="" method="post">
            <h3>Delete dish category</h3>
            <input type="hidden" name="action" value="dish-category">
            <input type="hidden" name="operation" value="delete">
            <select name="id">
                <%
                    opts = new StringBuilder();
                    if (dishCategories != null) {
                        for (Hashtable<String, String> dishCategoriy : dishCategories) {
                            opts.append("<option value=\""+dishCategoriy.get("id")+"\">"+dishCategoriy.get("category_id")+": "+dishCategoriy.get("dish_id")+"</option>");
                        }
                    }
                %>
                <%=opts.toString()%>
            </select>
            <input type="submit">
        </form>
    </section>
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
