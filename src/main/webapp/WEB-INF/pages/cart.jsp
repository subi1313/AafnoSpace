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

    <!-- SIDE PANEL -->

        <jsp:include page="/components/userPanel.jsp" />


    <!-- CART AREA -->
    <div class="product-cart">

        <c:forEach var="item" items="${cartItems}">

            <div class="card">

                <form action="${pageContext.request.contextPath}/cart"
                      method="post"
                      style="display:flex; width:100%; align-items:center; gap:16px;">

                    <!-- CART ITEM ID -->
                    <input type="hidden" name="cartItemId" value="${item.cartItemId}">

                    <input type="checkbox" class="cart-checkbox">

                    <!-- IMAGE -->
                    <div class="image-holder">
                        <img src="${pageContext.request.contextPath}/getImage?name=${item.imageName}">
                    </div>

                    <!-- PRODUCT NAME -->
                    <div class="product-name">
                        ${item.productName}
                    </div>

                    <!-- PRICE -->
                    <div class="price">
                        <div class="price-label">Price</div>
                        <div class="price-value">Rs. ${item.price}</div>
                    </div>

                    <!-- QUANTITY -->
                    <div class="quantity">
                        <div class="qty-label">Quantity</div>

                        <div class="qty-property">

                            <!-- DECREASE -->
                            <button type="submit"
                                    name="action"
                                    value="decrease"
                                    class="qty-btn">−</button>

                            <div class="qty-value">
                                ${item.quantity}
                            </div>

                            <!-- INCREASE -->
                            <button type="submit"
                                    name="action"
                                    value="increase"
                                    class="qty-btn">+</button>

                            <!-- DELETE BUTTON (NEW) -->
                            <button type="submit"
                                    name="action"
                                    value="delete"
                                    class="qty-btn">
                                Remove
                            </button>

                        </div>
                    </div>

                </form>

            </div>

        </c:forEach>

        <!-- EMPTY CART MESSAGE -->
        <c:if test="${empty cartItems}">
            <h3>Your cart is empty</h3>
        </c:if>

    </div>
</div>

</body>
</html>