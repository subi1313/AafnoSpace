<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
                <form action="${pageContext.request.contextPath}/product" method="get">
                    <h3>Filter Options</h3>
                    <hr>
                    <h4>Categories</h4>
                    <label><input type="checkbox" name="category" value="Minimal"> Minimal </label>
                    <label><input type="checkbox" name="category" value="Japandi"> Japandi </label>
                    <label><input type="checkbox" name="category" value="Modern"> Modern </label>
                    <label><input type="checkbox" name="category" value="Bohemian"> Bohemian (Boho) </label>
                    <label><input type="checkbox" name="category" value="Luxury"> Luxury </label>
                    <h4>Price</h4>
                    <label><input type="checkbox" name="price" value="range1"> Under NRS 5,000 </label>
                    <label><input type="checkbox" name="price" value="range2"> NRS 5,000 – NRS 12,000 </label>
                    <label><input type="checkbox" name="price" value="range3"> NRS 12,000 – NRS 27,000 </label>
                    <label><input type="checkbox" name="price" value="range4"> NRS 27,000 – NRS 50,000 </label>
                    <label><input type="checkbox" name="price" value="range5"> NRS 50,000 – NRS 80,000 </label>
                    <button type="submit">Apply Filters</button>
                </form>
            </div>
            <div class="product-content">
                <form action="${pageContext.request.contextPath}/products" method="get">
                	<div class="search-row">
	                    <div class="search">
	                        <img src="${pageContext.request.contextPath}/images/product/search.png" alt="Search Icon">
	                        <input type="text" id="searchbar" name="searchbar" placeholder="What are you looking for?">
	                    </div>
	                    <a href="${pageContext.request.contextPath}/cart" class="cart-icon">
				            <i class="fa-solid fa-cart-shopping"></i>
				        </a>
			        </div>
                </form>
                <div class="products-grid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-itelis">
                            <div class="products">
                                <img src="${pageContext.request.contextPath}/product-image?name=${product.imageName}"
                                    alt="${product.productName}" />
                            </div>
                            <div class="prod-info">
                                <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}">
                                    ${product.productName}
                                </a>
                                <p>NRS ${product.price}</p>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty products}">
                        <p>No products found.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../../components/footer.jsp" />
</body>

</html>