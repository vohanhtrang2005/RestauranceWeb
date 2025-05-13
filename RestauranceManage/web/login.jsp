<%-- 
    Document   : login
    Created on : Apr 28, 2025, 5:19:29 PM
    Author     : XUAN_SANG_PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
    /* Reset cơ bản */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Font chữ giống orderList.jsp */
    body {
        font-family: 'Raleway', sans-serif;
        background: url('img/antique-cafe-bg-01.jpg') no-repeat center center fixed;
        background-size: cover;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    /* Lớp phủ mờ cho nền */
    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5); /* Lớp phủ tối */
        z-index: 1;
    }

    /* Container chính của form */
    div {
        position: relative;
        z-index: 2; /* Đảm bảo form nằm trên lớp phủ */
        background: rgba(255, 255, 255, 0.95); /* Nền trắng mờ */
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); /* Bóng đổ */
        width: 100%;
        max-width: 400px; /* Độ rộng tối đa */
        text-align: center;
        animation: fadeIn 1s ease-in-out; /* Hiệu ứng xuất hiện */
    }

    /* Hiệu ứng fade-in */
    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    /* Tiêu đề (thêm nếu muốn) */
    h2 {
        font-family: 'Oswald', sans-serif;
        color: #4a2c2a; /* Màu nâu giống tm-text-brown */
        font-size: 28px;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    /* Style cho table */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }

    /* Style cho các ô trong table */
    td {
        padding: 10px 0;
        text-align: left;
        color: #333;
        font-weight: 500;
    }

    /* Style cho input */
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px 15px;
        border: 1px solid #ccc;
        border-radius: 25px; /* Bo góc mạnh */
        font-size: 16px;
        outline: none;
        transition: all 0.3s ease;
        background: #f9f9f9;
        box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.05);
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        background: #fff;
    }

    /* Style cho nút Login */
    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: linear-gradient(45deg, #007bff, #00c6ff); /* Gradient lung linh */
        border: none;
        border-radius: 25px;
        color: white;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
    }

    input[type="submit"]:hover {
        background: linear-gradient(45deg, #0056b3, #0099cc);
        box-shadow: 0 8px 20px rgba(0, 123, 255, 0.6);
        transform: translateY(-2px);
    }

    /* Style cho thông báo lỗi */
    .error-message {
        color: #e74c3c;
        font-size: 14px;
        margin-top: 10px;
        display: block;
    }

    /* Responsive */
    @media (max-width: 480px) {
        div {
            padding: 20px;
            max-width: 90%;
        }

        h2 {
            font-size: 24px;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            font-size: 14px;
            padding: 8px 12px;
        }
    }
</style>
        </style>
    </head>
    <body>
       <div>
            <form action="LoginController" method="POST">
                <center>
                    <table>
                        <tr>
                       
                        <td>Username:</td>
                       
                        <td><input type="text" name="username" value="${username}"></td>
                                         
                    
                        </tr>
                        <tr>
                            <td>Password: </td>
                             
                        <td><input type="text" name="password" value="${password}"></td>
                         

                        </tr>
                        <tr>
                            <td></td>
                             <td><input  type="submit" value="Login"/></td>
                        </tr>
                        <tr><td>${error}</td></tr>
                        
                          
                    </table> 
           
                </center>
                </form>   
        </div>
    </body>
</html>
