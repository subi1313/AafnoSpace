<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Dashboard – आफ्नो SPACE</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminDashboard.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<div class="adminDashboard">
    <jsp:include page="/components/adminPanel.jsp"/>

    <div class="main">
        <p class="pageTitle">Report Overview</p>
        <div class="dashboardCards">
            <div class="card">
                <p>Total Orders</p>
                <h2>${totalOrders}</h2>
            </div>
            <div class="card">
                <p>Total Customers</p>
                <h2>${totalCustomers}</h2>
            </div>
            <div class="card">
			    <p>Total Categories</p>
			    <h2>${totalCategories}</h2>
			</div>
			<div class="card">
                <p>Total Revenue</p>
                <h2>Rs. ${totalRevenue}</h2>
            </div>
			<div class="card">
			    <p>Highest Revenue By Category</p>
			    <h2>${highestCategory} : Rs. ${highestRevenue}</h2>
			</div>
			<div class="card">
			    <p>Lowest Revenue By Category</p>
			    <h2>${lowestCategory} : Rs. ${lowestRevenue}</h2>
			</div>
			<div class="card">
			    <p>Total Profit</p>
			    <h2>Rs. ${totalProfit}</h2>
			</div>
        </div>
    </div>
</div>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>