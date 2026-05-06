<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Description</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css">
</head>

<body>

<jsp:include page="../../components/header.jsp" />

<div class="container">

    <img src="${pageContext.request.contextPath}/images/productDetail/Lamp 1.png">

    <div class="description">
        <h1>Crystal Shape LED Table Lamp</h1>
        <div class="price-container">
            <p>NPR 3500</p>
        </div>

        <h2>Description</h2>
        <p>Coquette aesthetic table lamp in brass finish and crystal reflecting lampshade made of acrylic glass. Will perfectly fit dark academia, vintage and coquette room desks or bedside tables.</p>

        <h2>Product Features:</h2>
        <ul class="features">
            <li>Light Modes: Warm white, White, Cold White</li>
            <li>Power: Rechargeable Lithium Battery</li>
            <li>USB-C Charging port</li>
            <li>Switch: Touch Control</li>
            <li>Size: H: 12in W: 6.7in (H: 30.4cm W: 17cm)</li>
            <li>Material: Metal case, Acrylic Lampshade</li>
        </ul>

        <button class="buy-now">Buy Now</button>
        <button class="add-to-cart">Add to Cart</button>

    </div>

</div>

</body>
</html>