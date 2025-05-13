package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import dao.OrderDAO;
import java.net.URLEncoder;

public class HistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("OrderController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy các tham số
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("newStatus");
        String currentStatus = OrderDAO.getStatus(orderId);
        String error = "";

        // Xác thực chuyển đổi trạng thái dựa trên vai trò người dùng
        boolean isValidTransition = false;

        if (user.getRole().equalsIgnoreCase("staff")) {
            // Nhân viên chỉ có thể chuyển: ready -> deliver, deliver -> paid
            if (currentStatus.equalsIgnoreCase("ready") && newStatus.equalsIgnoreCase("deliver")) {
                isValidTransition = true;
            } else if (currentStatus.equalsIgnoreCase("deliver") && newStatus.equalsIgnoreCase("paid")) {
                isValidTransition = true;
            } else {
                error = "Chuyển trạng thái không hợp lệ. Vui lòng chọn theo thứ tự.";
            }
        } else if (user.getRole().equalsIgnoreCase("kitchen")) {
            // Nhà bếp chỉ có thể chuyển: pending -> cooking, cooking -> ready
            if (currentStatus.equalsIgnoreCase("pending") && newStatus.equalsIgnoreCase("cooking")) {
                isValidTransition = true;
            } else if (currentStatus.equalsIgnoreCase("cooking") && newStatus.equalsIgnoreCase("ready")) {
                isValidTransition = true;
            } else {
                error = "Chuyển trạng thái không hợp lệ. Vui lòng chọn theo thứ tự.";
            }
        } else {
            error = "Vai trò không được phép cập nhật trạng thái đơn hàng.";
        }

        // Cập nhật trạng thái nếu chuyển đổi hợp lệ
        if (isValidTransition) {
            OrderDAO.updateStatus(orderId, newStatus);
        }

        // Chuyển hướng về OrderController với thông báo lỗi (nếu có)
        String redirectUrl = "OrderController";
        if (!error.isEmpty()) {
            redirectUrl += "?error=" + URLEncoder.encode(error, "UTF-8");
        }
        response.sendRedirect(redirectUrl);
    }

    @Override
    public String getServletInfo() {
        return "Xử lý cập nhật trạng thái đơn hàng cho vai trò nhân viên và nhà bếp.";
    }
}