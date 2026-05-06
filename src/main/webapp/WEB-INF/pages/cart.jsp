<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
	<!-- Header -->
    <jsp:include page="/components/header.jsp" />
    
    <!-- User side panel -->
	<div class="side-panel">
    <div class="layout">
        <jsp:include page="/components/userPanel.jsp" />
    </div>

    <!-- Cart cards + Buy Now -->
    <div class="product-cart">

      <!-- Product 1 -->
      <div class="card">
        <input type="checkbox" class="cart-checkbox">
        <div class="image-holder">
          <img src="${pageContext.request.contextPath}/images/cart/download.jpg" alt="lamp">
        </div>
        
        <span class="product-name">Product 1</span>
        
        <div class="price">
          <div class="price-label">Price</div>
          <div class="price-value">Rs.1500</div>
        </div>
        
        <div class="quantity">
          <div class="qty-label">Quantity</div>
          <div class="qty-property">
            <button class="qty-btn" onclick="changeQty(this, -1)">−</button>
            <span class="qty-value">2</span>
            <button class="qty-btn" onclick="changeQty(this, 1)">+</button>
          </div>
        </div>
        </div>

      <!-- Product 2 -->
     <div class="card">
        <input type="checkbox" class="cart-checkbox">
       <div class="image-holder">
          <img src="${pageContext.request.contextPath}/images/cart/HMVPL Gold Floor Lamps for Living Room, Modern Floor Lamp with Shelves, Crystal Standing Lamps with Table, Brass Tall Lamp with Crystal Shade, On_Off Switch, Mid Century Corner Floor Lamp for Bedroom.jpg" alt="lamp">
        </div>
        
        <span class="product-name">Product 2</span>
        <div class="price">
          <div class="price-label">Price</div>
          <div class="price-value">Rs.2000</div>
        </div>
        
        <div class="quantity">
          <div class="qty-label">Quantity</div>
          <div class="qty-property">
            <button class="qty-btn" onclick="changeQty(this, -1)">−</button>
            <span class="qty-value">4</span>
            <button class="qty-btn" onclick="changeQty(this, 1)">+</button>
          </div>
        </div>
        </div>


      <!-- Product 3 -->
 		<div class="card">
        <input type="checkbox" class="cart-checkbox">
        <div class="image-holder">
          <img src="${pageContext.request.contextPath}/images/cart/Modern Bedroom Furniture 2026 — Stylish Beds, Mattresses, Nightstands & Smart Storage Essentials.jpg" alt="lamp">
        </div>
        
        <span class="product-name">Product 3</span>
        <div class="price">
          <div class="price-label">Price</div>
          <div class="price-value">Rs.1900</div>
        </div>
        
        <div class="quantity">
          <div class="qty-label">Quantity</div>
          <div class="qty-property">
            <button class="qty-btn" onclick="changeQty(this, -1)">−</button>
            <span class="qty-value">5</span>
            <button class="qty-btn" onclick="changeQty(this, 1)">+</button>
          </div>
        </div>
        </div>
     

      <!-- Product 4 -->
		<div class="card">
        <input type="checkbox" class="cart-checkbox">
        <div class="image-holder">
          <img src="${pageContext.request.contextPath}/images/cart/Pinterest.jpg" alt="lamp">
        </div>
        
        <span class="product-name">Product 4</span>
        <div class="price">
          <div class="price-label">Price</div>
          <div class="price-value">Rs.3000</div>
        </div>
        
        <div class="quantity">
          <div class="qty-label">Quantity</div>
          <div class="qty-property">
            <button class="qty-btn" onclick="changeQty(this, -1)">−</button>
            <span class="qty-value">3</span>
            <button class="qty-btn" onclick="changeQty(this, 1)">+</button>
          </div>
	</div>
      </div>

      <!-- Buy Now -->
      <div class="buy-now">
        <button class="buy-btn" onclick="handleBuyNow()">Buy Now</button>
      </div>

    </div>
  </div>

<script>
  function changeQty(btn, delta) {
    const controls = btn.closest('.qty-property');
    const display = controls.querySelector('.qty-value');
    let val = parseInt(display.textContent) + delta;
    if (val < 1) val = 1;
    display.textContent = val;
  }

  function handleBuyNow() {
    const checked = document.querySelectorAll('.cart-checkbox:checked');
    if (checked.length === 0) {
      alert('Please select at least one item to purchase.');
      return;
    }
    alert('Proceeding to checkout with ' + checked.length + ' item(s).');
  }
</script>


</body>
</html>