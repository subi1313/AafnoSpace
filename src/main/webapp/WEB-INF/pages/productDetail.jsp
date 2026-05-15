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
	
	<!-- Product image -->
    <img src="${pageContext.request.contextPath}/product-image?name=${product.imageName}">

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
        <button class="buy-now" >Buy Now</button>
        
		<form action="${pageContext.request.contextPath}/cart" method="post">
		    <input type="hidden" name="ProductID" value="${product.productId}"> 
		    <button type="submit" class="add-to-cart">
		        Add to Cart
		    </button>
		</form>
		</div>
		
    </div>
</div>
</body>
</html>