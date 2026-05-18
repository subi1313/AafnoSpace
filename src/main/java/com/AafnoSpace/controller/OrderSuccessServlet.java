package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.AafnoSpace.dao.OrderDAO;
import com.AafnoSpace.model.CartModel;
import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.CheckoutService;
import com.AafnoSpace.utils.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/order-success" })
public class OrderSuccessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // check login
        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = user.getuserId();

        // fetch latest order from DAO
        int orderId = orderDAO.getLatestOrderId(userId);

        // pass to JSP
        request.setAttribute("orderId", orderId);

        request.getRequestDispatcher("/WEB-INF/pages/orderSuccess.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String payment = request.getParameter("payment");
        //getting all selected items
        String[] selectedItems = request.getParameterValues("selectedItems");

        try {
            UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
            CheckoutService checkoutService = new CheckoutService();
            List<CartModel> items = checkoutService.getCheckoutItems(user.getuserId(), selectedItems);
            double subtotal = checkoutService.calculateSubtotal(items);
            double total = checkoutService.calculateTotal(subtotal);
            int userId = user.getuserId();
            checkoutService.placeOrder(userId, items, payment, total);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/order-success");
    }
}