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
  <!-- Admin main information card -->
  <div class="main">
    <p class="pageTitle">My Profile</p>

    <div class="profileHero">
      <div class="profilePicture">
        <img src="${pageContext.request.contextPath}/images/main/avatar.png">
        <a href="${pageContext.request.contextPath}/editAdminProfile" class="profilePictureEdit">Edit</a>
      </div>
      <div class="generalinfo">
        <p>${user.firstName} ${user.lastName}</p>
        <p>Admin</p>
        <p>${user.address}</p>
      </div>
    </div>
    <!-- Admin personal information card-->
    <div class="detailPanel">
      <div class="panelHeader">
        <p class="panelTitle">Personal Information</p>
        <a href="${pageContext.request.contextPath}/editAdminProfile" class="editLink">Edit Details</a>
      </div>
      <div class="fieldsGrid">
        <div class="field"><label>First Name</label>
        <p>${user.firstName}</p></div>
        <div class="field"><label>Last Name</label>
        <p>${user.lastName}</p></div>
        <div class="field"><label>Address</label>
        <p>${user.address}</p></div>
        <div class="field"><label>Email</label>
        <p>${user.email}</p></div>
        <div class="field"><label>Phone</label>
        <p>${user.phoneNo}</p></div>
      </div>
    </div>
</div>
<%@ include file="/components/footer.jsp" %>
</body>
</html>
