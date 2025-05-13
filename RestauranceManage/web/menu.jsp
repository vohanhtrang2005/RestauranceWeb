<%-- 
    Document   : menu
    Created on : Apr 15, 2025, 10:48:09 PM
    Author     : XUAN_SANG_PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="model.MenuItem" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Antique Bakery Cafe HTML Template by Tooplate</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
            .foodImg {
    text-align: center; /* căn giữa hình ảnh trong ô */
    padding: 8px;
}

.foodImg img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 12px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.foodImg img:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}
            table {
                width: 100%;
                border-collapse: collapse;
                background: rgba(255, 255, 255, 0.6); /* Nền trắng trong suốt */
                backdrop-filter: blur(5px);            /* Hiệu ứng làm mờ phía sau */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Viền đổ bóng nhẹ */
                border-radius: 12px;
                overflow: hidden;
            }

            th {

                font-size: 18px;      /* Tăng kích thước chữ */
                font-weight: bold;    /* In đậm */
                color: black;         /* Màu đen */
                padding: 12px 16px;
                background-color: rgba(255, 255, 255, 0.3); /* Header cũng có nền trong suốt */
                backdrop-filter: blur(3px);
                text-align: left;
            }

            td {
                padding: 12px 16px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
                color: #333;
            }

        </style>
    </head>
    <body>    
        <!-- Intro -->
        <div id="intro" class="parallax-window" data-parallax="scroll" data-image-src="img/antique-cafe-bg-01.jpg">
            <nav id="tm-nav" class="fixed w-full">
                <div class="tm-container mx-auto px-2 md:py-6 text-right">
                    <button class="md:hidden py-2 px-2" id="menu-toggle"><i class="fas fa-2x fa-bars tm-text-gold"></i></button>
                    <ul class="mb-3 md:mb-0 text-2xl font-normal flex justify-end flex-col md:flex-row">
                        <li class="inline-block mb-4 mx-4"><a href="#intro" class="tm-text-gold py-1 md:py-3 px-4">Intro</a></li>
                        <li class="inline-block mb-4 mx-4"><a href="#menu" class="tm-text-gold py-1 md:py-3 px-4">Menu</a></li>
                        <li class="inline-block mb-4 mx-4"><a href="#about" class="tm-text-gold py-1 md:py-3 px-4">About</a></li>
                        <li class="inline-block mb-4 mx-4"><a href="#contact" class="tm-text-gold py-1 md:py-3 px-4">Contact</a></li>
                        <li class="inline-block mb-4 mx-4"><a href="LoginController" class="tm-text-gold py-1 md:py-3 px-4">Login</a></li>
                    </ul>
                </div>            
            </nav>
            
            <div class="container mx-auto px-2 tm-intro-width">
                <div class="sm:pb-60 sm:pt-48 py-20">
                    <div class="bg-black bg-opacity-70 p-12 mb-5 text-center">
                        <h1 class="text-white text-5xl tm-logo-font mb-5">Saigon Taste</h1>
                        <p class="tm-text-gold tm-text-2xl">Authentic,flavorful and cozy</p>
                    </div>    
                    <div class="bg-black bg-opacity-70 p-10 mb-5">
                        <p class="text-white leading-8 text-sm font-light">
                            This is a Vietnamese restaurant named Saigon Taste, known for its authentic dishes, cozy atmosphere, and flavorful cuisine.
                            Feel free to visit and enjoy traditional Vietnamese meals prepared with fresh ingredients.
                    </div>
                    <div class="text-center">
                        <div class="inline-block">
                            <a href="#menu" class="flex justify-center items-center bg-black bg-opacity-70 py-6 px-8 rounded-lg font-semibold tm-text-2xl tm-text-gold hover:text-gray-200 transition">
                                <i class="fas 	fa-utensils mr-3"></i>
                                <span>Let's explore...</span>                        
                            </a>
                        </div>                    
                    </div>                
                </div>
            </div>        
        </div>
        <!-- Cafe Menu -->
        <div id="menu" class="parallax-window" data-parallax="scroll" data-image-src="img/antique-cafe-bg-02.jpg">
            <div class="container mx-auto tm-container py-24 sm:py-48">
                <div class="text-center mb-16">
                    <h2 class="bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">Our Menu</h2>
                </div>   
          <c:if test="${not empty check}">
    <script>
        alert('${fn:escapeXml(check)}');
    </script>
</c:if>
                    
                <div class="overflow-x-auto">
                    <form action="OrderController" method="Post" onsubmit="return checkOrderItems()">
                        <table class="min-w-full table-auto border-collapse">
                            <thead>
                                <tr class="bg-brown text-white">
                                    <th class="px-4 py-2 text-left">Image</th>
                                    <th class="px-4 py-2 text-left">Name</th>
                                    <th class="px-4 py-2 text-left">Price</th>
                                    <th class="px-4 py-2 text-left">Description</th>
                                    <th class="px-4 py-2 text-left">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${object}">
                                   
                                    <tr class="border-b">
                                        <td class="foodImg px-4 py-2">
                                            <img src="img/${fn:toLowerCase(fn:replace(item.name, ' ', '-'))}.jpg" alt="Image" class="rounded-md w-[120px] h-[120px] object-cover">
                                        </td>
                                        <td class="px-4 py-2 tm-text-yellow">${item.name}</td>
                                        <td class="px-4 py-2">
                                        <fmt:formatNumber value="${item.price}" pattern="#,##0"  /> VNĐ</td>
                                        <td class="px-4 py-2">${item.description}</td>
                                        <td class="px-4 py-2 text-center">
                                            <!-- Nút giảm số lượng -->
                                            <button type="button" class="quantity-btn" onclick="updateQuantity('${item.itemId}', -1)">-</button>

                                            <!-- Hiển thị số lượng -->
                                            <span id="quantity-${item.itemId}" class="quantity">0</span>
                                            <input type="hidden" id="input-quantity-${item.itemId}" name="quantity-${item.itemId}" value="0">

                                            <!-- Nút tăng số lượng -->
                                            <button type="button" class="quantity-btn" onclick="updateQuantity('${item.itemId}', 1)">+</button>

                                        </td>
                                    </tr>
                                  
                                </c:forEach>
                            </tbody>
                        </table>
                        </br>
                         <div class="text-center mt-4">
                             Table Number
                            <input required type="text" name="tablenumber" class="bg-green-600 text-black py-2 px-4 rounded cursor-pointer">
                        </div>
                        </br>
                        <div class="text-center mt-4">
                            <input type="submit" value="Place Order" class="bg-green-600 text-red py-2 px-4 rounded cursor-pointer">
                        </div>

                    </form>
                </div>
            </div>        
            <div id="about" class="parallax-window" data-parallax="scroll" data-image-src="img/antique-cafe-bg-03.jpg">
                <div class="container mx-auto tm-container py-24 sm:py-48">
                    <div class="tm-item-container sm:ml-auto sm:mr-12 mx-auto sm:px-0 px-4">
                        <div class="bg-white bg-opacity-80 p-12 pb-14 rounded-xl mb-5">
                            <h2 class="mb-6 tm-text-green text-4xl font-medium">About our restaurant</h2>
                            <p class="mb-6 text-base leading-8">
                                Images are taken from various sources, showcasing the delightful dishes and ambiance of our restaurant. This template used Tailwind CSS. You may modify the Antique Cafe template in any way you prefer and use it for your restaurant's website.


                            </p>
                            <p class="text-base leading-8">
                                If you wish to support us, please consider making a small donation via PayPal. Your support will help us continue serving great meals and providing excellent service. Another way you can help is by sharing our restaurant with your friends. Thank you!
                            </p>
                        </div>
                        <a href="#contact" class="inline-block tm-bg-green transition text-white text-xl pt-3 pb-4 px-8 rounded-md">
                            <i class="far fa-comments mr-4"></i>
                            Contact
                        </a>
                    </div>           
                </div>        
            </div>
            <div id="contact" class="parallax-window relative" data-parallax="scroll" data-image-src="img/antique-cafe-bg-04.jpg">
                <div class="container mx-auto tm-container pt-24 pb-48 sm:py-48">
                    <div class="flex flex-col lg:flex-row justify-around items-center lg:items-stretch">
                        <div class="flex-1 rounded-xl px-10 py-12 m-5 bg-white bg-opacity-80 tm-item-container">
                            <h2 class="text-3xl mb-6 tm-text-green">Contact Us</h2>
                            <p class="mb-6 text-lg leading-8">
                                Praesent tellus magna, consectetur sit amet volutpat eu, pulvinar vitae sem.
                                Sed ultrices. bg white 80% alpha. btn #066    
                            </p>
                            <p class="mb-10 text-lg">
                                <span class="block mb-2">Tel: <a href="tel:0100200340" class="hover:text-yellow-600 transition">010-020-0340</a></span>
                                <span class="block">Email: <a href="mailto:info@company.com" class="hover:text-yellow-600 transition">info@company.com</a></span>                        
                            </p>
                            <div class="text-center">
                                <a href="https://www.google.com/maps" class="inline-block text-white text-2xl pl-10 pr-12 py-6 rounded-lg transition tm-bg-green">
                                    <i class="fas fa-map-marked-alt mr-8"></i>
                                    Open Maps
                                </a>
                            </div>                    
                        </div>
                        <div class="flex-1 rounded-xl p-12 pb-14 m-5 bg-black bg-opacity-50 tm-item-container">
                            <form action="" method="POST" class="text-lg">
                                <input type="text" name="name" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Name" required="" />
                                <input type="email" name="email" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Email" required="" />
                                <textarea rows="6" name="message" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Message..." required=""></textarea>
                                <div class="text-right">
                                    <button type="submit" class="text-white hover:text-yellow-500 transition">Send it</button>
                                </div>                        
                            </form>
                        </div>
                    </div>
                    <footer class="absolute bottom-0 left-0 w-full">
                        <div class="text-white container mx-auto tm-container p-8 text-lg flex flex-col md:flex-row justify-between">
                            <span>Copyright 2022 Antique Cafe. All rights reserved.</span>
                            <span class="mt-5 md:mt-0">Design: <a href="https://www.tooplate.com" target="_parent">Tooplate</a></span>
                        </div>                
                    </footer>
                </div>        
            </div>    

            <script src="js/jquery-3.6.0.min.js"></script>
            <script src="js/parallax.min.js"></script>
            <script src="js/jquery.singlePageNav.min.js"></script>
    

            <script>


                function updateQuantity(itemId, change) {
                    const quantityElement = document.getElementById('quantity-' + itemId); // Tìm <span>
                    const inputElement = document.getElementById('input-quantity-' + itemId); // Tìm <input>
                    if (!quantityElement || !inputElement) {
                        console.error('Không tìm thấy phần tử với ID: quantity-' + itemId + ' hoặc input-quantity-' + itemId);
                        return;
                    }
                    let currentQuantity = parseInt(quantityElement.innerText) || 0;
                    const newQuantity = currentQuantity + change;
                    if (newQuantity >= 0) {
                        quantityElement.innerText = newQuantity; // Cập nhật hiển thị
                        inputElement.value = newQuantity; // Cập nhật giá trị gửi
                    }
                }
            </script>
            <script>// Kiểm tra xem có món nào được chọn không
function checkOrderItems() {
    // Lấy tất cả input có name bắt đầu bằng "quantity-"
    const quantityInputs = document.querySelectorAll('input[name^="quantity-"]');
    let hasSelectedItem = false;

    // Kiểm tra từng input
    for (let input of quantityInputs) {
        const quantity = parseInt(input.value) || 0;
        if (quantity > 0) {
            hasSelectedItem = true;
            break; // Thoát vòng lặp nếu tìm thấy ít nhất 1 món
        }
    }

    // Nếu không có món nào được chọn, hiển thị alert và ngăn gửi form
    if (!hasSelectedItem) {
        alert("Vui lòng chọn ít nhất một món!");
        return false;
    }
    return true; // Cho phép gửi form nếu có món
}</script>

    </body>
</html>
