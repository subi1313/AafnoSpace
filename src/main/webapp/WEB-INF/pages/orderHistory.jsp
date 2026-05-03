<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderHistory.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<div class="layout">
	<jsp:include page="/components/userPanel.jsp"/>
  </div>
  <div class="main">
    <h1>Order history</h1>
  <div class="tableWrapper">
    <table>
        <tr>
          <th style="padding-right:250px;">Order id</th>
          <th style="padding-right:160px;">Order date</th>
          <th style="padding-right:50px;">Total Amount</th>
        </tr>
        <tr>
          <td>20890876</td>
          <td>2022-02-14</td>
          <td>Rs 2,900</td>
        </tr>
        <tr>
          <td>17375648</td>
          <td>2023-04-21</td>
          <td>Rs 10,400</td>
        </tr>
        <tr>
          <td>64867452</td>
          <td>2024-11-01</td>
          <td>Rs 24,220</td>
        </tr>
        <tr>
          <td>32657490</td>
          <td>2025-09-19</td>
          <td>Rs 40,530</td>
        </tr>
        <tr>
          <td>75830315</td>
          <td>2026-11-12</td>
          <td>Rs 55,820</td>
        </tr>
    </table>
  </div>
</div>
<%@ include file="/components/footer.jsp" %>
</body>
</html>