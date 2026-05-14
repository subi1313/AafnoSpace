<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <div class="productbg">
                    <div class="proddesc">
                        <img src="${pageContext.request.contextPath}/images/main/greensofa.jpg" alt="product" style="width:150px; height:150px; 
    margin-top:10px;
    margin-bottom:10px;">

                        <div class="prodheading">
                            <p>Product 1</p>
                        </div>
                        <div class="prodheading">
                            <p>Price</p>
                            <p>Rs.1500</p>
                        </div>
                        <div class="prodheading">
                            <p>Quantity</p>
                            <p>2</p>
                        </div>
                    </div>
                </div>
                <div class="productbg">
                    <div class="proddesc">
                        <img src="${pageContext.request.contextPath}/images/main/greensofa.jpg" alt="product" style="width:150px; height:150px; 
    margin-top:10px;
    margin-bottom:10px;">

                        <div class="prodheading">
                            <p>Product 1</p>
                        </div>
                        <div class="prodheading">
                            <p>Price</p>
                            <p>Rs.1500</p>
                        </div>
                        <div class="prodheading">
                            <p>Quantity</p>
                            <p>2</p>
                        </div>
                    </div>
                </div>
				<div class="totalandpay">
                <div class="totalitemsbg">
                    <p>Total Items: 1</p>
                    <p>Total Price:1000</p>
                    <p>Delivery Charge: Rs.100</p>
                    <p>Shipping Address: Kamalpokhari, Kathmandu</p>
                    <p>Total Price:Rs.1100</p>
                </div>
                <div class="paymentbg">
                    <p>Payment Method</p>
                     <form action="checkout" method="post">

    <!-- payment -->
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