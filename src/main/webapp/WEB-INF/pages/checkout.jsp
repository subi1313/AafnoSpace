<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title>Order Checkout Page</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderCheckout.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
        </head>
        <body>
        <jsp:include page="/components/header.jsp"/>
            <div class="layout">
	<jsp:include page="/components/adminPanel.jsp"/>
  </div>
  
  <div class="main">
    <p class="orderconfirmheading">Order Confirmation</p>
	<div class="productbg">
	<div class="proddesc">
	 <img src="${pageContext.request.contextPath}/images/main/greensofa.jpg" alt="product" style="width:150px; height:150px; 
    margin-top:10px;
    margin-bottom:10px;">
	<p>product1</p>
	<p>prokd2</p>
	<p>price</p>
	</div>
	</div>
		</div>
        </body>

        </html>