<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
  <title>Order Management – आफ्नो SPACE</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderManagement.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>
<div class="admin-profile">
    <jsp:include page="/components/adminPanel.jsp"/>
    <div class="maindiv">
        <div class="main">
            <p class="mgmtheading">Order Management</p>
        </div>
        <div class="container">
            <div class="headerdiv">
                <p>Order <span>List</span></p>
                <c:if test="${not empty orders}">
                    <div class="totalusers">
                        <i class="fa fa-box"></i> &nbsp; ${fn:length(orders)} Orders
                    </div>
                </c:if>
            </div>

            <div class="tablediv">
                <c:choose>
                    <c:when test="${empty orders}">
                        <div class="emptystate">
                            <i class="fa-regular fa-folder-open fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                            <p>No orders found.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>User ID</th>
                                    <th>Order Date</th>
                                    <th>Payment ID</th>
                                    <th>Total Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${orders}">
                                    <tr>
                                        <td>#${o.orderId}</td>
                                        <td>${o.userId}</td>
                                        <td>${o.orderDate}</td>
                                        <td>${o.paymentId}</td>
                                        <td>Rs. ${o.totalAmount}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>