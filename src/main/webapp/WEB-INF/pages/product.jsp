<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    	<form id="filterForm" action="${pageContext.request.contextPath}/product" method="get">
        <div class="product-main">

            <%-- ONE single form wrapping both filter and search --%>
            
                <div class="filter">
                    <h3>Filter Options</h3>
                    <hr>
                    <h4>Categories</h4>
                    <label>
                        <input type="checkbox" name="category" value="Minimal"
                            <c:if test="${fn:contains(selectedCategories, 'Minimal')}">checked</c:if>>
                        Minimal
                    </label>
                    <label>
                        <input type="checkbox" name="category" value="Japandi"
                            <c:if test="${fn:contains(selectedCategories, 'Japandi')}">checked</c:if>>
                        Japandi
                    </label>
                    <label>
                        <input type="checkbox" name="category" value="Modern"
                            <c:if test="${fn:contains(selectedCategories, 'Modern')}">checked</c:if>>
                        Modern
                    </label>
                    <label>
                        <input type="checkbox" name="category" value="Bohemian"
                            <c:if test="${fn:contains(selectedCategories, 'Bohemian')}">checked</c:if>>
                        Bohemian (Boho)
                    </label>
                    <label>
                        <input type="checkbox" name="category" value="Luxury"
                            <c:if test="${fn:contains(selectedCategories, 'Luxury')}">checked</c:if>>
                        Luxury
                    </label>

                    <h4>Price</h4>
                    <label>
                        <input type="checkbox" name="price" value="range1"
                            <c:if test="${fn:contains(selectedPrices, 'range1')}">checked</c:if>>
                        Under NRS 5,000
                    </label>
                    <label>
                        <input type="checkbox" name="price" value="range2"
                            <c:if test="${fn:contains(selectedPrices, 'range2')}">checked</c:if>>
                        NRS 5,000 – NRS 12,000
                    </label>
                    <label>
                        <input type="checkbox" name="price" value="range3"
                            <c:if test="${fn:contains(selectedPrices, 'range3')}">checked</c:if>>
                        NRS 12,000 – NRS 27,000
                    </label>
                    <label>
                        <input type="checkbox" name="price" value="range4"
                            <c:if test="${fn:contains(selectedPrices, 'range4')}">checked</c:if>>
                        NRS 27,000 – NRS 50,000
                    </label>
                    <label>
                        <input type="checkbox" name="price" value="range5"
                            <c:if test="${fn:contains(selectedPrices, 'range5')}">checked</c:if>>
                        NRS 50,000 – NRS 80,000
                    </label>

                    <button type="submit">Apply Filters</button>
                </div>

                <div class="product-content">
                    <div class="search-row">
                        <div class="search">
                            
                            <input type="text" name="searchbar" value="${searchbar}"
                                placeholder="What are you looking for?">
                            <button type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <a href="${pageContext.request.contextPath}/cart" class="cart-icon">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                    </div>

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
        </form>
    </section>
    <jsp:include page="../../components/footer.jsp" />
</body>
</html>