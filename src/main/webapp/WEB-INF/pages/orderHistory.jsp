<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Order History</title>

  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/header.css">

  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/orderHistory.css">

  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/adminPanel.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>

<jsp:include page="/components/header.jsp"/>

<div class="layout">

    <jsp:include page="/components/userPanel.jsp"/>

    <div class="main">

        <h1>Order history</h1>

        <div class="tableWrapper">

<table>

    <tr>
        <th style="padding-right:250px;">Order ID</th>
        <th style="padding-right:160px;">Order Date</th>
        <th style="padding-right:50px;">Total Amount</th>
    </tr>

    <c:forEach var="order" items="${orders}">

        <tr>
            <td>${order.orderId}</td>
            <td>${order.orderDate}</td>
            <td>Rs. ${order.totalAmount}</td>
        </tr>

    </c:forEach>

</table>

        </div>

    </div>

</div>

<jsp:include page="/components/footer.jsp" />

</body>
</html>