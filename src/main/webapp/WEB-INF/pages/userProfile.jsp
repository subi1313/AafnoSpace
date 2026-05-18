<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

	<head>
	    <title>My Profile – आफ्नो SPACE</title>
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfile.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
	</head>
	
	<body>
	    <jsp:include page="/components/header.jsp" />
	    <div class="admin-profile">
	        <jsp:include page="/components/userPanel.jsp" />
	        <!--Customer main information card-->
	        <div class="main">
	            <p class="pageTitle">My Profile</p>
	            <div class="profileHero">
	                <div class="profilePictureWrapper">
	                    <div class="profilePicture">
	                        <img src="${pageContext.request.contextPath}/getImage?name=${user.userName}" alt="Profile"
	                            style="width: 100%; height: 100%; object-fit: cover;"
	                            onerror="handleImageError(this, '${user.userName}', '${fn:substring(user.firstName, 0, 1)}${fn:substring(user.lastName, 0, 1)}')">
	                    </div>
	                    <a href="${pageContext.request.contextPath}/editUserProfile" class="profilePictureEdit">Edit</a>
	                </div>
	                <div class="generalinfo">
	                    <p>${user.firstName} ${user.lastName}</p>
	                    <p>Customer</p>
	                    <p>${user.address}</p>
	                </div>
	            </div>
	            <!-- Customer personal information card -->
	            <div class="detailPanel">
	                <div class="panelHeader">
	                    <p class="panelTitle">Personal Information</p>
	                    <a href="${pageContext.request.contextPath}/editUserProfile" class="editLink">Edit Details</a>
	                </div>
	                <div class="fieldsGrid">
	                    <div class="field"><label>First Name</label>
	                        <p>${user.firstName}</p>
	                    </div>
	                    <div class="field"><label>Last Name</label>
	                        <p>${user.lastName}</p>
	                    </div>
	                    <div class="field"><label>Address</label>
	                        <p>${user.address}</p>
	                    </div>
	                    <div class="field"><label>Email</label>
	                        <p>${user.email}</p>
	                    </div>
	                    <div class="field"><label>Phone</label>
	                        <p>${user.phoneNo}</p>
	                    </div>
	                    <div class="field"><label>Last Login</label>
	                        <p>${last_login}</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <script>
	        function handleImageWrror(img, username, initials) {
	            const parent = img.parentElement;
	            img.style.display = "none";
	            parent.innerHTML = initials;
	        }
	    </script>
	    <jsp:include page="/components/footer.jsp" />
	</body>

</html>