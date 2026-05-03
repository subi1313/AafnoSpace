<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css">
</head>

<body>
	<jsp:include page="../../components/header.jsp" />
    <section>
        <div class="product-hero">
            <img src="${pageContext.request.contextPath}/images/product/1.png" alt="Product Hero">
        </div>
    </section>
    <section>
        <div class="product-main">
            <div class="filter">
                <h3>Filter Options</h3>
                <hr>

                <h4>Categories</h4>

                <label><input type="checkbox"> Minimal </label>
                <label><input type="checkbox"> Japandi </label>
                <label><input type="checkbox"> Modern </label>
                <label><input type="checkbox"> Bohemian(Boho) </label>
                <label><input type="checkbox"> Luxury </label>

                <h4>Price</h4>

                <label><input type="checkbox"> Under NRS 5,000 </label>
                <label><input type="checkbox"> NRS 5,000 – NRS 12,000 </label>
                <label><input type="checkbox"> NRS 12,000 – NRS 27,000 </label>
                <label><input type="checkbox"> NRS 27,000 – NRS 50,000 </label>
                <label><input type="checkbox"> NRS 50,000 – NRS 80,000 </label>
                <label><input type="checkbox"> NRS 50,000 – NRS 80,000 </label>
            </div>
            <div class="product-content">
                <div class="search">
                    <img src="${pageContext.request.contextPath}/images/product/search.png" alt="Search Icon">
                    <input type="text" placeholder="What are you looking for?">
                </div>
                <div class="products-grid">
                    <div class="products">
                        <img src="${pageContext.request.contextPath}/images/product/product.png" alt="${product.name}" />
                    </div>
                    <div class="prod-info">
                        <span>${product.name}</span>
                        <p>NRS ${product.price}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>