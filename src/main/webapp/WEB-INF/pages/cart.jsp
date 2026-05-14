<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
	<!-- Header -->
    <jsp:include page="/components/header.jsp" />
    
    <!-- User side panel -->
	<div class="side-panel">
    <div class="layout">
        <jsp:include page="/components/userPanel.jsp" />
    </div>

    <!-- Cart cards + Buy Now -->
    <div class="product-cart">

    <c:forEach var="item" items="${cartList}">

        <div class="card">

            <div class="image-holder">
                <img src="${pageContext.request.contextPath}/images/cart/download.jpg">
            </div>

            <span class="product-name">
                ${item.productName}
            </span>

            <div class="price">
                <div class="price-label">Price</div>
                <div class="price-value">
                    Rs. ${item.price}
                </div>
            </div>

            <div class="quantity">
                <div class="qty-label">Quantity</div>
                <div class="qty-value">
                    ${item.quantity}
                </div>
            </div>

        </div>

    </c:forEach>

</div>
  </div>


</body>
</html>