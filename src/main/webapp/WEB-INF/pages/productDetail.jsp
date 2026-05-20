<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Description</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    
</head>

<body>

<jsp:include page="../../components/header.jsp" />

<!-- Popup messsage -->
	    <c:if test="${not empty sessionScope.cartMessage}">
    <div class="popup-message">
        ${sessionScope.cartMessage}
    </div>
    <c:remove var="cartMessage" scope="session"/>
</c:if>

<div class="container">
	<!-- Product image -->
    <img src="${pageContext.request.contextPath}/product-image?name=${product.imageName}"
                                    alt="${product.productName}" />
    <div class="description">
        <h1>${product.productName}</h1>
        
        <div class="price-container">
            <p>${product.price}</p>
        </div>

        <h2>Description</h2>
        <p>${product.description}</p>

        <h2>Category</h2>
        <p>${product.category}</p>

		<div class="button-group">
	        <button type="submit" class="buy-now">
	            Buy Now
	        </button>

    <form action="${pageContext.request.contextPath}/cart" method="post">
        <input type="hidden" name="ProductID" value="${product.productId}">
        <button type="submit" class="add-to-cart">
            Add to Cart
        </button>
    </form>
		</div>
		
    </div>
</div>
<jsp:include page="/components/footer.jsp" />
</body>
</html>