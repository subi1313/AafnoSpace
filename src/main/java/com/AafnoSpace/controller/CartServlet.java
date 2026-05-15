package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.AafnoSpace.model.CartModel;
import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.CartService;
import com.AafnoSpace.utils.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final CartService service = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
            if (user == null) {
                user = new UserModel();
                user.setuserId(1); // hardcoded for testing — remove when auth is ready
            }

            List<CartModel> cartItems = service.getCartItems(user.getuserId());
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
            if (user == null) {
                user = new UserModel();
                user.setuserId(1); // hardcoded for testing — remove when auth is ready
            }

            // ADD TO CART
            if (action == null || action.equals("add")) {
                String productId = request.getParameter("ProductID");
                boolean result = service.addCart(
                        String.valueOf(user.getuserId()),
                        productId
                );
                if (result) {
//                    response.sendRedirect(request.getContextPath() + "/cart");
                	 response.setStatus(HttpServletResponse.SC_OK);
                	 response.getWriter().println("added");
                } else {
                	response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().println("Failed To Add Cart");
                }
                return;
            }

            // UPDATE / DELETE CART
            String cartItemIdStr = request.getParameter("cartItemId");
            if (cartItemIdStr != null) {
                int cartItemId = Integer.parseInt(cartItemIdStr);
                switch (action) {
                    case "increase": service.increaseQuantity(cartItemId); break;
                    case "decrease": service.decreaseQuantity(cartItemId); break;
                    case "delete":   service.deleteCartItem(cartItemId);   break;
                }
            }

            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}