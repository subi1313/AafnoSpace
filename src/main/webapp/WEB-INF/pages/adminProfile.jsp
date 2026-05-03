<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminProfile.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>

<div class="layout">
	<jsp:include page="/components/adminPanel.jsp"/>
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

      <div class="field">
        <p class="profile-name">${admin.firstName} ${admin.lastName}</p>
        <p>Admin</p>
        <p>${admin.city}, ${admin.country}</p>
      </div>
    </div>

    <!-- PERSONAL -->
    <div class="detail-card">
      <div class="card-header">
        <p class="card-title">Personal Information</p>
        <a href="${pageContext.request.contextPath}/admin/profile/edit?section=personal" class="edit-link">Edit Details</a>
      </div>

      <div class="fields-grid">
        <div class="field"><p>First Name</p>
        <p>${admin.firstName}</p></div>
        <div class="field"><p>Last Name</p>
        <p>${admin.lastName}</p></div>
        <div class="field"><p>Date of Birth</p>
        <p>${admin.dob}</p></div>
        <div class="field"><p>Gender</p>
        <p>${admin.gender}</p></div>
        <div class="field"><p>Email</p>
        <p>${admin.email}</p></div>
        <div class="field"><p>Phone</p>
        <p>${admin.phone}</p></div>
      </div>
    </div>

    <!-- ADDRESS -->
    <div class="detail-card">
      <div class="card-header">
        <p class="card-title">Address</p>
        <a href="${pageContext.request.contextPath}/admin/profile/edit?section=address" class="edit-link">Edit Details</a>
      </div>

      <div class="fields-grid">
        <div class="field">
        <p>Country</p>
        <p>${admin.country}</p></div>
        <div class="field">
        <p>Province</p>
        <p>${admin.province}</p></div>
        <div class="field">
        <p>City</p>
        <p>${admin.city}</p></div>
      </div>
    </div>

  </div>
</div>

<%@ include file="/components/footer.jsp" %>

</body>
</html>