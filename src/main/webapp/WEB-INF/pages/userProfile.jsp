<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>

  <style>
    :root{
      --bg: #EFEEEB;
      --sidebar-bg: #252420;
      --card-bg: #252220;
      --text-light: #f0ece4;
      --text-dark:  #1e1c1a;
      --text-muted: #a09890;
      --accent:     #c8b89a;
      --border:     #3a3632;
    }

    body {
      font-family: 'Cormorant Garamond', serif;
      background: var(--bg);
      color: var(--text-dark);
      min-height: 100vh;
    }

    .layout {
      display: flex;
      flex-direction: row;
      margin: 30px 130px;
      gap: 20px;
    }

    .sidebar {
      width: 20%;
      background-color: #252420;
      border-radius: 16px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 20px 0;
      color: #f0ece4;
    }

    .sidebar-section-label {
      font-size: 13px;
      color: #a09890;
      margin: 10px 0 5px 20px;
    }

    .sidebar-item {
      display: block;
      text-decoration: none;
      color: #f0ece4;
      font-size: 14px;
      padding: 8px 28px;
      margin: 0 8px;
    }

    .sidebar-item:hover {
      background-color: #2e2b28;
    }

    .sidebar-item.active {
      color: #c8b89a;
    }

    .main {
      width: 80%;
      padding: 30px;
    }

    .page-title {
      font-size: 32px;
      margin-bottom: 20px;
    }

    .profile-hero {
      display: flex;
      align-items: center;
      background-color: #252420;
      border-radius: 16px;
      padding: 30px;
      margin-bottom: 20px;
      color: #f0ece4;
    }

    .avatar-wrap {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-right: 30px;
    }

    .avatar-wrap img {
      width: 90px;
      height: 90px;
      border-radius: 50%;
      border: 3px solid #3a3632;
    }

    .avatar-edit {
      font-size: 11px;
      color: #a09890;
      text-decoration: underline;
      margin-top: 6px;
    }

    .detail-card {
      background-color: #252420;
      border-radius: 16px;
      padding: 25px 30px;
      margin-bottom: 20px;
      color: #f0ece4;
    }

    .card-header {
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #3a3632;
      padding-bottom: 12px;
      margin-bottom: 20px;
    }

    .card-title {
      font-size: 22px;
      font-weight: 600;
    }

    .edit-link {
      font-size: 13px;
      color: #a09890;
      text-decoration: underline;
      cursor: pointer;
    }

    .fields-grid {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }

    .field {
      width: 30%;
    }

    .field p {
      font-size: 15px;
      margin: 0;
    }

    .field label {
      font-size: 13px;
      font-weight: 700;
      display: block;
      margin-bottom: 4px;
    }
  </style>
</head>

<body>

<%@ include file="/components/header.jsp" %>

<div class="layout">

  <!-- SIDEBAR -->
  <div class="sidebar">
    <div class="sidebar-section-label">
      <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-item">Dashboard</a>
      <a href="${pageContext.request.contextPath}/admin/profile" class="sidebar-item active">Profile</a>
      <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-item">User Management</a>
      <a href="${pageContext.request.contextPath}/admin/products" class="sidebar-item">Product List</a>
      <a href="${pageContext.request.contextPath}/admin/products/add" class="sidebar-item">Add Product</a>
      <a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-item">Order Management</a>
    </div>

    <div>
      <div class="sidebar-section-label">Others</div>
      <a href="${pageContext.request.contextPath}/logout" class="sidebar-item">Log Out</a>
    </div>
  </div>

  <!-- MAIN -->
  <div class="main">

    <p class="page-title">My Profile</p>

    <!-- HERO -->
    <div class="profile-hero">
      <div class="avatar-wrap">
        <img src="${pageContext.request.contextPath}/images/main/avatar.png">
        <a href="${pageContext.request.contextPath}/admin/profile/edit" class="avatar-edit">Edit</a>
      </div>

      <div>
        <p class="profile-name">${admin.firstName} ${admin.lastName}</p>
        <p>Customer</p>
        <p>${user.city}, ${user.country}</p>
      </div>
    </div>

    <!-- PERSONAL -->
    <div class="detail-card">
      <div class="card-header">
        <p class="card-title">Personal Information</p>
        <a href="${pageContext.request.contextPath}/admin/profile/edit?section=personal" class="edit-link">Edit Details</a>
      </div>

      <div class="fields-grid">
        <div class="field"><label>First Name</label><p>${admin.firstName}</p></div>
        <div class="field"><label>Last Name</label><p>${admin.lastName}</p></div>
        <div class="field"><label>Date of Birth</label><p>${admin.dob}</p></div>
        <div class="field"><label>Gender</label><p>${admin.gender}</p></div>
        <div class="field"><label>Email</label><p>${admin.email}</p></div>
        <div class="field"><label>Phone</label><p>${admin.phone}</p></div>
      </div>
    </div>

    <!-- ADDRESS -->
    <div class="detail-card">
      <div class="card-header">
        <p class="card-title">Address</p>
        <a href="${pageContext.request.contextPath}/admin/profile/edit?section=address" class="edit-link">Edit Details</a>
      </div>

      <div class="fields-grid">
        <div class="field"><label>Country</label><p>${admin.country}</p></div>
        <div class="field"><label>Province</label><p>${admin.province}</p></div>
        <div class="field"><label>City</label><p>${admin.city}</p></div>
      </div>
    </div>

  </div>
</div>

<%@ include file="/components/footer.jsp" %>

</body>
</html>