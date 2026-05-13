<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Side panel -->
  <div class="sidebar">
  	<div class="sidePanelLabel">
  	<i class="fas fa-bars"></i>
  	Main Menu
      <a href="${pageContext.request.contextPath}/admin/profile" class="sidePanelItem active">
      <i class="fas fa-user-edit"></i>
      Profile</a>
      <a href="${pageContext.request.contextPath}/admin/cart" class="sidePanelItem">
      <i class="fas fa-cart-shopping"></i>
      Cart</a>
      <a href="${pageContext.request.contextPath}/admin/orderHistory" class="sidePanelItem">
      <i class="fas fa-bag-shopping"></i>
      My Orders</a>
    </div>
    <div class="sidePanelLabel">
      <i class="fas fa-ellipsis"></i>
  	Others
      <a href="${pageContext.request.contextPath}/logout" class="sidePanelItem">
      <i class="fas fa-sign-out-alt"></i>
      Logout
      </a>
    </div>