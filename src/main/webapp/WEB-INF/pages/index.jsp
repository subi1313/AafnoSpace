<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<!-- Header -->
<jsp:include page="/components/header.jsp" />
<!-- hero section -->
<section class="hero_section">

    <img 
        src="${pageContext.request.contextPath}/images/home/farmhouse-allisonwillson103651 1.png" 
        alt="farmhouse"
    >

    <div class="hero_overlay">

        <h1>Design a home that feels truly yours</h1>

        <p>
            Discover timeless furniture and decor crafted
            to bring warmth, comfort, and elegance into every space.
        </p>

        <a href="${pageContext.request.contextPath}/products" class="hero_btn">
            View Products
        </a>

    </div>

</section>

    <!-- homepage text -->
    <section class="homepage_text">
        <p>From cozy nooks to living rooms, create your own</p> 
        <p>space with</p>
        <h2>आफ्नोspace</h2>
    </section>

    <!-- homepage products -->
    <section class="homepage_products">
        <h1>Our Products</h1>

        <div class="product_holder">
            <div class="product">
                <img src="${pageContext.request.contextPath}/images/home/lamp.png" alt="lamp">
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/images/home/Современное кресло _ 3D визуализация мебели для брендов 1.png" alt="sofa">
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/images/home/download 1.png" alt="lamp2">
            </div>
        </div>
    </section>

    <!--homepage gallery -->
    <section class="homepage_gallery">
        <div class="image_holder">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 17.png">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 18.png">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 19.png">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 20.png">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 22.png">
            <img src="${pageContext.request.contextPath}/images/home/Rectangle 21.png">
        </div>

        <h1>Gallery</h1>
        <p>Where आफ्नोspace comes to life</p>   
    </section>
	<!-- Footer -->
   	<jsp:include page="/components/footer.jsp" />

</body>
</html>