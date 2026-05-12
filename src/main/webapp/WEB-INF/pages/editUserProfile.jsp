<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editProfile.css">
</head>
<body>
	<div class="editDetailsPanel">
		<h2>Update Details</h2>
		<form action="userProfile" method="post" enctype="multipart/form-data">
			<div class="profilePicture">
		        <img src="${pageContext.request.contextPath}/images/main/avatar.png">
		        <a href="${pageContext.request.contextPath}/admin/profile/edit" class="profilePictureEdit">Edit</a>
		    </div>
		</form>
	</div>
 </body>
 </html>