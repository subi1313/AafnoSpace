<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderSuccess.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>

	<!-- Header -->
    <jsp:include page="/components/header.jsp" />
    
    <!-- User side panel -->
        <div class="layout">
            <jsp:include page="/components/userPanel.jsp" />
    <!-- Main Content -->
<div class="confirmation-wrapper">

    <div class="confirmation-card">
     <label class="round-check">
    <input type="checkbox" checked disabled>
    <span class="checkmark"></span>
</label>

        <h1>Order Confirmed</h1>

        <h2>Thank you!</h2>

        <p class="success-text">
            You have successfully placed your order.
        </p>

        <div class="order-id-box">
            Order ID: <span>${orderId}</span>
        </div>

        <p class="shipping-text">
            We are currently processing your order and carefully preparing it for shipment.
        </p>

        <p class="shipping-text">
            You will receive a tracking update as soon as your order is dispatched.
        </p>
    </div>
</div>
</div>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>