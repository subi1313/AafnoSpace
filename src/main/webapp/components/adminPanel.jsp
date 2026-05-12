
<%@ page isELIgnored="false" %>
<!-- Side panel -->
  <div class="sidebar">
  	<div class="sidePanelLabel">
  	<img src="${pageContext.request.contextPath}/images/main/mainmenu.png" alt="menu" style="width:20px;height:20px;">
  	Main Menu
      <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/dashboard.png" alt="dashboard">
      Dashboard
      </a>
      <a href="${pageContext.request.contextPath}/AdminProfile" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/profile.png" alt="profile">
      Profile</a>
      <a href="${pageContext.request.contextPath}/admin/users" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/usermgmt.png" alt="userManagement">
      User Management</a>
      <a href="${pageContext.request.contextPath}/admin/products" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/productlist.png" alt="productList">
      Product List</a>
      <a href="${pageContext.request.contextPath}/admin/products/add" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/addproduct.png" alt="addProduct">
      Add Product</a>
      <a href="${pageContext.request.contextPath}/admin/orders" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/ordermgmt.png" alt="orderManagement">
      Order Management</a>
    </div>
    <div class="sidePanelLabel">
      <img src="${pageContext.request.contextPath}/images/main/others.png" alt="menu" style="width:20px;height:20px;">
  	Others
      <a href="${pageContext.request.contextPath}/admin/logout" class="sidePanelItem">
      <img src="${pageContext.request.contextPath}/images/main/logout.png" alt="dashboard">
      Logout
      </a>
    </div>
