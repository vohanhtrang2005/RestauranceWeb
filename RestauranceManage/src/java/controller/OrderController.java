/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MenuItemsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.OrderItemDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.MenuItem;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author XUAN_SANG_PC
 */
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String error = request.getParameter("error");
        if (error != null && !error.isEmpty()) {
            request.setAttribute("error", error);
        }
        //add luôn items
        //add hàng loạt
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<MenuItem> menuItem = MenuItemsDAO.getAccount();
        request.setAttribute("menuItem", menuItem);

        String selectedDate = request.getParameter("date");
        String pageParam = request.getParameter("page");
        int page = pageParam != null ? Integer.parseInt(pageParam) : 0;
        int itemsPerPage = 10;

        ArrayList<Order> orderList;
        if (selectedDate == null || selectedDate.isEmpty()) {

            ArrayList<String> dates = OrderDAO.getOrderDates();
            selectedDate = dates.isEmpty() ? null : dates.get(0);
            orderList = selectedDate != null ? OrderDAO.getOrdersByDate(selectedDate) : new ArrayList<>();
        } else {
            orderList = OrderDAO.getOrdersByDate(selectedDate);
        }

        int totalItems = orderList.size();
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        int start = page * itemsPerPage;
        int end = Math.min(start + itemsPerPage, totalItems);
        ArrayList<Order> paginatedOrders = new ArrayList<>(orderList.subList(start, end));

        ArrayList<OrderItem> orderItemList = OrderItemDAO.OrderItem();
        ArrayList<String> getRole = new ArrayList<>();
        if (user == null) {
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            rs.forward(request, response);
        } else {
            if (user.getRole().equalsIgnoreCase("staff")) {
                getRole.add("pending");
                getRole.add("cooking");
                getRole.add("ready");
                getRole.add("delivered");
                getRole.add("paid");
            }
            if (user.getRole().equalsIgnoreCase("kitchen")) {
                getRole.add("pending");
                getRole.add("ready");
                getRole.add("cooking");

            }

        }

        request.setAttribute("status", getRole);
        request.setAttribute("orderList", paginatedOrders);
        request.setAttribute("orderItemList", orderItemList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("selectedDate", selectedDate);
        request.setAttribute("orderDates", OrderDAO.getOrderDates());

        RequestDispatcher rs = request.getRequestDispatcher("OrderList.jsp");
        rs.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        ArrayList<MenuItem> object = MenuItemsDAO.getAccount();
        request.setAttribute("object", object);

        boolean add = false;
        String check;
        ArrayList<MenuItem> obj = MenuItemsDAO.getAccount();
        int TableNumber = Integer.parseInt(request.getParameter("tablenumber"));
        int OrderId = OrderDAO.AddOrder(TableNumber);
        for (MenuItem item : obj) {
            String name = "quantity-" + item.getItemId();
            int quantity = Integer.parseInt(request.getParameter(name));
            add = OrderItemDAO.addOrderItem(OrderId, item.getItemId(), quantity);

        }

        if (add == true && OrderId != -1) {
            check = "Order success!";

        } else {
            check = "Order fail!";

        }
        request.setAttribute("check", check);
        RequestDispatcher rs = request.getRequestDispatcher("menu.jsp");
        rs.forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
