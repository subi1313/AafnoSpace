<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>

<body>

<jsp:include page="/components/header.jsp" />

<div class="layout">

    <!-- side-panel -->

        <jsp:include page="/components/userPanel.jsp" />


    <!-- cart area-->
    <div class="product-cart">

        <c:forEach var="item" items="${cartItems}">

            <div class="card">

                <form action="${pageContext.request.contextPath}/cart"
                      method="post"
                      style="display:flex; width:100%; align-items:center; gap:16px;">

                    <!-- cart item id -->
                    <input type="hidden" name="cartItemId" value="${item.cartItemId}">

                    <input type="checkbox" name="selectedItems" value="${item.cartItemId}" class="cart-checkbox">
                    <!-- image -->
                    <div class="image-holder">
                        <img src="${pageContext.request.contextPath}/product-image?name=${item.imageName}">
                    </div>

                    <!-- product name -->
                    <div class="product-name">
                        ${item.productName}
                    </div>

                    <!-- price -->
                    <div class="price">
                        <div class="price-label">Price</div>
                        <div class="price-value">Rs. ${item.price}</div>
                    </div>

                    <!--quantity -->
                    <div class="quantity">
                        <div class="qty-label">Quantity</div>

                        <div class="qty-property">

                            <!-- decrease -->
                            <button type="submit"
                                    name="action"
                                    value="decrease"
                                    class="qty-btn">−</button>

                            <div class="qty-value">
                                ${item.quantity}
                            </div>

                            <!-- increase -->
                            <button type="submit"
                                    name="action"
                                    value="increase"
                                    class="qty-btn">+</button>

                            <!-- delete button -->
                            <button type="submit"
                                    name="action"
                                    value="delete"
                                    class="delete">
                                X
                            </button>

                        </div>
                    </div>

                </form>

            </div>

        </c:forEach>

        <!-- empty cart message-->
        <c:if test="${empty cartItems}">
            <h3 class="empty-cart">Your cart is empty</h3>
        </c:if>
        
        <!-- Checkout button -->
        <div class="checkout-btn">
        <form action="${pageContext.request.contextPath}/checkout" method="post">
        <button type="submit" class="checkout">
        	Checkout
        </button>
        </form>
        </div>
    </div>
</div>

</body>
</html>