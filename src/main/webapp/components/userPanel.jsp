<%@ page isELIgnored="false" %>
<!-- SIDEBAR -->
  <div class="sidebar">
  	<div class="sidePanelLabel">
  	<img src="${pageContext.request.contextPath}/images/main/mainmenu.png" alt="menu" style="width:20px;height:20px;">
  	Main Menu
      <a href="${pageContext.request.contextPath}/admin/profile" class="sidePanelItem active">
      <img src="${pageContext.request.contextPath}/images/main/profile.png" alt="profile">
      Profile</a>
      <a href="${pageContext.request.contextPath}/admin/cart" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/shoppingCart.png" alt="cart">
      Cart</a>
      <a href="${pageContext.request.contextPath}/admin/orderHistory" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/myOrders.png" alt="orders">
      My Orders</a>
    </div>
    <div class="sidePanelLabel">
    
      <img src="${pageContext.request.contextPath}/images/main/others.png" alt="menu" style="width:20px;height:20px;">
  	Others
      <a href="${pageContext.request.contextPath}/admin/logout" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/logout.png" alt="dashboard">
      Logout
      </a>
    </div>