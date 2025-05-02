<%-- 
    Document   : OrderList
    Created on : Apr 25, 2025, 3:36:55 PM
    Author     : XUAN_SANG_PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Order" %> 
<%@ page import="model.OrderItem" %> 
<%@page import="model.User"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Antique Bakery Cafe HTML Template by Tooplate</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.css">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&family=Oswald:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/all.min.css"> <!-- fontawesome -->
        <!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
        <link rel="stylesheet" href="css/tailwind.css">
        <link rel="stylesheet" href="css/tooplate-antique-cafe.css">

        <!--
        
        Tooplate 2126 Antique Cafe
        
        https://www.tooplate.com/view/2126-antique-cafe
        
        -->
        <style>
.pagination {
    margin: 20px 0;
    text-align: center;
    font-size: 16px;
}

.pagination a {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-decoration: none;
    color: #333;
    background-color: #fff;
    transition: all 0.3s ease;
}

.pagination a:hover {
    background-color: #f0f0f0;
    border-color: #999;
}

.pagination a.active {
    background-color: #007bff;
    color: white;
    border-color: #007bff;
    font-weight: bold;
}

.pagination a.active:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.pagination a:first-child,
.pagination a:last-child {
    font-weight: bold;
}
            .order{
                margin-top:5%;
            }
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
            .top-nav li {
                display: inline-block;
            }
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
            .date-filter label {
                font-size: 25px;
            }
            .date-filter {
                margin: 20px auto;
                text-align: center;
                padding: 10px;
            }
            .date-filter select {
                padding: 5px 25px 5px 10px;
                font-size: 25px;
                border-radius: 5px;
                min-width: 150px;
                background-color: white;
                border: 1px solid #ccc;
                appearance: auto;
                -webkit-appearance: auto;
                -moz-appearance: auto;
                cursor: pointer;
            }
            .date-filter select option {
                padding: 5px;
            }
            .order-container {
                background: rgba(255, 255, 255, 0.9);
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                padding: 20px;
                margin: 20px auto;
                width: 90%;
                max-width: 600px;
            }

            .order-table {
                width: 100%;
                border-collapse: collapse;
            }

            .order-table td {
                border: 1px solid #ddd;
                padding: 8px 12px;
            }

            .order-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .order-table tr:hover {
                background-color: #f1f1f1;
            }

            .order-table td:first-child {
                font-weight: bold;
                background-color: #f0f0f0;
                width: 35%;
            }
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
                    <h2 class=" order bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">Order List</h2>
                </div>

                <div class="date-filter">
                    <form action="OrderController" method="GET">
                        <label for="date">Select Date: </label>
                        <select name="date" id="date" onchange="this.form.submit()">
                            <c:forEach var="date" items="${orderDates}">
                                <option value="${date}" ${date eq selectedDate ? 'selected' : ''}>${date}</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>

                <div id="ordersWrapper">
                    <c:if test="${empty orderList}">
                        <p class="text-center">No orders found for ${selectedDate}</p>
                    </c:if>

                    <c:forEach var="order" items="${orderList}" >


                        <div class="order-container">
                            <table  class="order-table">
                                <tr>
                                    <td>OrderID: </td>
                                    <td>${order.orderId}</td>
                                </tr>
                                <tr>
                                    <td>TableNumber: </td>
                                    <td>${order.tableNumber}</td>
                                </tr>
                                <tr>
                                    <td>OrderTime: </td>
                                    <td>${order.orderTime}</td>
                                </tr>
                                <tr>
                                    <td>Status: </td>
                                    <td>${order.status}</td>
                                </tr>
                                <tr><td>Items</td>
                                    <td>
                                        <c:forEach var="item" items="${orderItemList}">
                                            <c:if test="${item.orderId eq order.orderId and item.quantity gt 0}">
                                                <c:forEach var="food" items="${menuItem}">
                                                    <c:if test="${item.itemId eq food.itemId}">


                                                        Name: ${food.name} Quantity: ${item.quantity}<br>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach></td>



                                </tr>

                            </table>

                        </div>     

                    </c:forEach>

                </div>

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

            <script src="js/jquery-3.6.0.min.js"></script>

            <script src="js/parallax.min.js"></script>
            <script src="js/jquery.singlePageNav.min.js"></script>
            <script>
                            $(function () {

                                $('#date').off('click').on('click', function (e) {
                                    e.stopPropagation();
                                });
                                $('#date').off('change').on('change', function () {
                                    $(this).closest('form').submit();
                                });
                            });
            </script>
    </body>
</html>
