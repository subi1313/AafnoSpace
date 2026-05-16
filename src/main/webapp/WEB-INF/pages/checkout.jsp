<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title>Order Checkout– आफ्नो SPACE</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderCheckout.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
        </head>
        <body>
        <jsp:include page="/components/header.jsp"/>
            <div class="admin-profile">
                <jsp:include page="/components/userPanel.jsp" />
            

            <div class="main">
                <p class="orderconfirmheading">Order Confirmation</p>
                <c:forEach var="item" items="${items}">
    <div class="productbg">
        <div class="proddesc">

            <img src="${pageContext.request.contextPath}/product-image?name=${item.imageName}"
                 alt="product"
                 style="width:150px; height:150px; margin-top:10px; margin-bottom:10px;">

            <div class="prodheading">
                <p>${item.productName}</p>
            </div>

            <div class="prodheading">
                <p>Price</p>
                <p>Rs. ${item.price}</p>
            </div>

            <div class="prodheading">
                <p>Quantity</p>
                <p>${item.quantity}</p>
            </div>

        </div>
    </div>
</c:forEach>
				<div class="totalandpay">
                <div class="totalitemsbg">
				    <p>Total Items: ${items.size()}</p>
				    <p>Total Price: Rs. ${subtotal}</p>
				    <p>Delivery Charge: Rs. ${delivery}</p>
				    <p>Shipping Address: Kamalpokhari, Kathmandu</p>
				    <p><b>Total Price: Rs. ${total}</b></p>
                </div>
                <div class="paymentbg">
                    <p>Payment Method</p>
               <form action="${pageContext.request.contextPath}/order-success" method="post">
               <!-- saving cartItemId for order success -->
    <c:forEach var="item" items="${items}">
        <input type="hidden" name="selectedItems" value="${item.cartItemId}">
    </c:forEach>
    <select name="payment" class="paymentselect">
        <option value="cash">Cash</option>
        <option value="online">Online</option>
    </select>
    <button type="submit">Place Order</button>
</form>
			
			</div>
			</div>
        </body>

        </html>