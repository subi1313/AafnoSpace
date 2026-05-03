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
      <style>
      *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
	}
	
	@font-face { 
		font-family: "CormorantGaramond"; 
		src: url("../fonts/Cormorant_Garamond/CormorantGaramond-VariableFont_wght.ttf"); 
		} 
		
	body{ 
		background-color:#EFEEEB;
		font-family:"CormorantGaramond"; 
		color: #ffffff;
	} 
	
	
	.layout { 
	display: flex; 
	flex-direction: row; 
	margin-top: 10px; 
	margin-bottom:10px; 
	margin-left:80px; 
	margin-right:80px; 
	} 
	
	.side-panel{ 
	display: flex; 
	flex-direction: row; 
	} 
	
	/**Product Cart **/
    .product-cart {
    display: flex;
     flex-direction: column;
	  height: 800px;
	  width: 100vh; 
	  gap: 15px;     
    }

 	.card{
      background-color: #252420;
      border-radius: 10px;
      height: 200px;
      width: 100%;
      display: flex;
      align-items: center;
      padding: 20px 20px;
      gap: 16px;
    }
    
    .cart-checkbox {
      width: 18px; 
      height: 18px;
      cursor: pointer;
      background-color: white;
      border-radius: 5px;
    }
	
    .image-holder img {
      height:160px;
      width: 180px;
      object-fit: cover;
      border-radius: 5px;
    }

    .product-name {
      font-size: 25px;
    }

    .price{
      text-align: center;
      margin-left: 112px;
    }

    .price-label {
      font-size: 25px;
      margin-bottom: 4px;
    }

    .price-value {
      font-size: 25px;
      margin-top: 17px;
    }

    .quantity {
      text-align: center;
      margin-left: 83px;
    }

    .qty-label {
      font-size: 25px;
      margin-bottom: 6px;
    }

    .qty-property {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-top:30px;
      justify-content: center;
    }

    .qty-btn {
      width: 25px; 
      height: 25px;
      color: #000000;
      border: none;
     font-size: 18px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
    }
   

    .qty-value {
      font-size: 20px;
      text-align: center;
    }

    /* Buy Button*/
    .buy-now {
      display: flex;
      justify-content: flex-end;
      padding-top: 10px;
    }

    .buy-btn {
      background-color: #412617 ;
      color: #ffffff;
      border: none;
      padding: 20px 40px;
      font-size: 20px;
      border-radius: 10px;
      cursor: pointer;
    }
      </style>
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