<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfile.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<div class="layout">
	<jsp:include page="/components/userPanel.jsp"/>
  </div>
  <!--Customer main information card-->
  <div class="main">
    <p class="pageTitle">My Profile</p>
    <div class="profileHero">
      <div class="profilePicture">
        <img src="${pageContext.request.contextPath}/images/main/avatar.png">
        <a href="${pageContext.request.contextPath}/admin/profile/edit" class="profilePictureEdit">Edit</a>
      </div>
      <div class="field">
        <p>${customer.firstName} ${customer.lastName}</p>
        <p>Customer</p>
        <p>${customer.address}</p>
      </div>
    </div>
    <!-- Customer personal information card -->
    <div class="detailPanel">
      <div class="panelHeader">
        <p class="panelTitle">Personal Information</p>
        <a href="${pageContext.request.contextPath}/admin/profile/edit?section=personal" class="editLink">Edit Details</a>
      </div>
      <div class="fieldsGrid">
        <div class="field"><p>First Name</p>
        <p>${customer.firstName}</p></div>
        <div class="field"><p>Last Name</p>
        <p>${customer.lastName}</p></div>
        <div class="field"><p>Address</p>
        <p>${customer.address}</p></div>
        <div class="field"><p>Email</p>
        <p>${customer.email}</p></div>
        <div class="field"><p>Phone</p>
        <p>${customer.phone}</p></div>
      </div>
    </div>
</div>
<%@ include file="/components/footer.jsp" %>
</body>
</html>