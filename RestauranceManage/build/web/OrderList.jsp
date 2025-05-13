<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Order" %> 
<%@ page import="model.OrderItem" %> 
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order List</title>
    <link rel="stylesheet" href="css/tailwind.css">
    <link rel="stylesheet" href="css/tooplate-antique-cafe.css">
    <style>
        .order { margin-top: 5%; }
        .top-nav {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #333;
            z-index: 1000;
            padding: 10px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .top-nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            text-align: right;
            padding-right: 20px;
        }
        .top-nav li { display: inline-block; }
        .top-nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            font-size: 16px;
        }
        .top-nav a:hover {
            background-color: #555;
            border-radius: 5px;
        }
        .date-filter {
            text-align: center;
            margin: 30px auto;
        }
        .date-filter label { font-size: 25px; }
        .date-filter select {
            font-size: 20px;
            padding: 5px 15px;
            border-radius: 5px;
        }
        .order-container {
            background: rgba(255,255,255,0.9);
            padding: 20px;
            margin: 20px auto;
            border-radius: 10px;
            max-width: 600px;
            box-shadow: 0 4px 8px rgbacement: none;
            border-radius: 5px;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        .pagination a:hover { background-color: #f0f0f0; }
    </style>
</head>
<body>
    <%
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null) {
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            rs.forward(request, response);
            return;
        }
    %>

    <div id="intro" class="parallax-window" data-parallax="scroll" data-image-src="img/antique-cafe-bg-01.jpg">
        <nav class="top-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/LogoutController">Logout</a></li>
            </ul>
        </nav>

        <div class="container mx-auto tm-container">
            <div class="text-center mb-16">
                <h2 class="order bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">Order List</h2>
            </div>

            <!-- Date Filter -->
            <div class="date-filter">
                <form action="OrderController" method="GET">
                    <label for="date">Select Date:</label>
                    <select name="date" id="date" onchange="this.form.submit()">
                        <c:forEach var="date" items="${orderDates}">
                            <option value="${date}" ${date eq selectedDate ? 'selected' : ''}>${date}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>
            <div>
                <c:if test="${not empty error}">
                    <p style="color: red;">${error}</p>
                </c:if>
            </div>

            <div id="ordersWrapper">
                <c:if test="${empty orderList}">
                    <p class="text-center">No orders found for ${selectedDate}</p>
                </c:if>

                <c:forEach var="order" items="${orderList}">
                    <!-- Reset totalOrderPrice for each order -->
                    <c:set var="totalOrderPrice" value="0" />

                    <div class="order-container">
                      
                        <table class="order-table">
                            <tr>
                                <td>OrderID:</td>
                                <td>${order.orderId}</td>
                            </tr>
                            <tr>
                                <td>Table Number:</td>
                                <td>${order.tableNumber}</td>
                            </tr>
                            <tr>
                                <td>Order Time:</td>
                                <td>${order.orderTime}</td>
                            </tr>
                            <tr>
                                <td>Status:</td>
                                <td>
                                    <form action="HistoryController" method="post">
                                        <input type="hidden" name="orderId" value="${order.orderId}" />
                                        <input type="hidden" name="userId" value="${user.userId}" />
                                        <input type="hidden" name="username" value="${user.userName}" />
                                        <input type="hidden" name="totalPrice" value="${totalOrderPrice}" />
                                        <select name="newStatus">
                                            <c:choose>
                                                <c:when test="${user.role eq 'kitchen'}">
                                                    <c:if test="${order.status eq 'pending'}">
                                                        <option value="cooking">cooking</option>
                                                    </c:if>
                                                    <c:if test="${order.status eq 'cooking'}">
                                                        <option value="ready">ready</option>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${user.role eq 'staff'}">
                                                    <c:if test="${order.status eq 'ready'}">
                                                        <option value="deliver">deliver</option>
                                                    </c:if>
                                                    <c:if test="${order.status eq 'deliver'}">
                                                        <option value="paid">paid</option>
                                                    </c:if>
                                                </c:when>
                                            </c:choose>
                                            <option value="${order.status}" selected disabled>${order.status}</option>
                                        </select>
                                        <input type="submit" value="Save" />
                                    </form>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>Items</td>
                                <td>
                                    <c:forEach var="item" items="${orderItemList}">
                                        <c:if test="${item.orderId eq order.orderId && item.quantity > 0}">
                                            <c:forEach var="food" items="${menuItem}">
                                                <c:if test="${item.itemId eq food.itemId}">
                                                    <c:set var="itemTotalPrice" value="${food.price * item.quantity}" />
                                                    <c:set var="totalOrderPrice" value="${totalOrderPrice + itemTotalPrice}" />
                                                    Name: ${food.name}, Quantity: ${item.quantity}<br />
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>Total Price</td>
                                <td>$<fmt:formatNumber value="${totalOrderPrice}" pattern="#,##0" /></td>
                            </tr>
                        </table>
                          
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <c:if test="${totalPages > 1}">
                    <c:if test="${currentPage > 0}">
                        <a href="?date=${selectedDate}&page=${currentPage - 1}">Previous</a>
                    </c:if>
                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                        <a href="?date=${selectedDate}&page=${i}" class="${i == currentPage ? 'active' : ''}">${i + 1}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages - 1}">
                        <a href="?date=${selectedDate}&page=${currentPage + 1}">Next</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/parallax.min.js"></script>
</body>
</html>