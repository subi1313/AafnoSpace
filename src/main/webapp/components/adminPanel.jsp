<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Side panel -->
  <div class="sidebar">
  	<div class="sidePanelLabel">
  	<i class="fas fa-bars"></i>
  	Main Menu
      <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidePanelItem">
      <i class="fas fa-table-cells"></i>
      Dashboard
      </a>
      <a href="${pageContext.request.contextPath}/AdminProfile" class="sidePanelItem">
      <i class="fas fa-user-edit"></i>
      Profile</a>
      <a href="${pageContext.request.contextPath}/userManagement" class="sidePanelItem">
      <i class="fas fa-users-gear"></i>
      User Management</a>
      <a href="${pageContext.request.contextPath}/admin/products" class="sidePanelItem">
      <i class="fas fa-clipboard-check"></i>
      Product List</a>
      <a href="${pageContext.request.contextPath}/admin/products/add" class="sidePanelItem">
      <i class="fas fa-square-plus"></i>
      Add Product</a>
      <a href="${pageContext.request.contextPath}/admin/orders" class="sidePanelItem">
      <i class="fas fa-boxes-stacked"></i>
      Order Management</a>
    </div>
    <div class="sidePanelLabel">
      <i class="fas fa-ellipsis"></i>
  	Others
      <a href="${pageContext.request.contextPath}/logout" class="sidePanelItem">
      <i class="fas fa-sign-out-alt"></i>
      Logout
      </a>
    </div>
