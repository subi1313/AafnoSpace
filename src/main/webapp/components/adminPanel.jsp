<%@ page isELIgnored="false" %>
<!-- SIDEBAR -->
  <div class="sidebar">
  	<div class="sidebar-section-label">
  	<img src="${pageContext.request.contextPath}/images/main/mainmenu.png" alt="menu" style="width:20px;height:20px;">
  	Main Menu
      <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/dashboard.png" alt="dashboard">
      Dashboard
      </a>
      <a href="${pageContext.request.contextPath}/admin/profile" class="sidebar-item active">
      <img src="${pageContext.request.contextPath}/images/main/profile.png" alt="profile">
      Profile</a>
      <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/usermgmt.png" alt="userManagement">
      User Management</a>
      <a href="${pageContext.request.contextPath}/admin/products" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/productlist.png" alt="productList">
      Product List</a>
      <a href="${pageContext.request.contextPath}/admin/products/add" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/addproduct.png" alt="addProduct">
      Add Product</a>
      <a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/ordermgmt.png" alt="orderManagement">
      Order Management</a>
    </div>
    <div class="sidebar-section-label">
    
      <img src="${pageContext.request.contextPath}/images/main/others.png" alt="menu" style="width:20px;height:20px;">
  	Others
      <a href="${pageContext.request.contextPath}/admin/logout" class="sidebar-item">
      <img src="${pageContext.request.contextPath}/images/main/logout.png" alt="dashboard">
      Logout
      </a>
    </div>