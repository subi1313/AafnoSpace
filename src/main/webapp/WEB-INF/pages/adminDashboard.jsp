<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminDashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<jsp:include page="/components/adminPanel.jsp"/>
<div class="dashboard-container">
    <div class="dashboard-cards">

        <div class="card">
            <p>Total Orders</p>
            <h2>${totalOrders}</h2>
        </div>
 
        <div class="card">
            <p>Total Customers</p>
            <h2>${totalCustomers}</h2>
        </div>

        <div class="card">
            <p>Total Revenue</p>
            <h2>Rs. ${totalRevenue}</h2>
        </div>

    </div>
</div>
<%@ include file="/components/footer.jsp" %>
</body>
</html>