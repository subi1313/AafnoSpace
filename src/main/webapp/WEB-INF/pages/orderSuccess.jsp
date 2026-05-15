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
</head>

<body>

	<!-- Header -->
    <jsp:include page="/components/header.jsp" />
    
    <!-- User side panel -->

        <div class="layout">
            <jsp:include page="/components/userPanel.jsp" />

		
            <!-- Main Content -->
    <div class="text-content">
        <h1>Order Confirmed</h1>
        <h2>Thankyou !</h2>

        <p>You have successfully placed your order.</p>
        <p>Your Order ID is:</p>
        <p>${orderId}</p>

        <p>
            We are currently processing your order and carefully preparing it for shipment.<br>
            You will receive a tracking update<br>
            as soon as your order is dispatched.
        </p>
    </div>

</div>
</body>
</html>