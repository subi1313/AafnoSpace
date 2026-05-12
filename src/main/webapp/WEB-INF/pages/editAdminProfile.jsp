<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editProfile.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<div class="editDetailsPanel">
		<h2>Update Details</h2>
		<c:if test="${not empty error}">
        	<div id="errorPopup" class="errordiv">
            	<i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/editAdminProfile" method="post"
         enctype="multipart/form-data">
        	<input type="file" id="profileImage" name="profileImage" accept="image/*" hidden
             onchange="previewFile()">
             <div class="pfpcircle">
                <img id="pfpPreview" src="${pageContext.request.contextPath}/images/main/user.png"
                 alt="profile">
             </div>
             <label for="profileImage" class="button">
             	<i class="fas fa-camera"></i> Change Picture
             </label>
             <div class="textinput">
             <label>First Name</label>
             <input type="text" name="firstName" value="${user.firstName}">
             <label>Last Name</label>
             <input type="text" name="lastName" value="${user.lastName}">
             <label>Address</label>
             <input type="text" name="address" value="${user.address}">
             <label>E-mail</label>
             <input type="text" name="email" value="${user.email}">
             <label>Phone Number</label>
             <input type="text" name="phone" value="${user.phoneNo}">
             </div>
             <button type="submit" class="submitButton">Save Changes</button>
         </form>
         <a href="${pageContext.request.contextPath}/AdminProfile" class="cancelLink">
            <i class="fas fa-arrow-left"></i> Back to profile
        </a>
	</div>
            <script>
                function previewFile() {
                    const preview = document.getElementById("pfpPreview");
                    const file = document.getElementById("profileImage").files[0];

                    if (file) {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                            preview.style.width = "100%";
                            preview.style.height = "100%";
                            preview.style.objectFit = "cover";
                            preview.style.margin = "0";
                        };

                        reader.readAsDataURL(file);
                    }
                }
                document.addEventListener('DOMContentLoaded', function () {
                    const errorPopup = document.getElementById('errorPopup');

                    if (errorPopup) {
                        // Wait for 5 seconds (5000ms)
                        setTimeout(() => {
                            // Add the fade-out class to trigger CSS transitions
                            errorPopup.classList.add('fade-out');

                            // Optional: Remove from DOM entirely after transition finishes (500ms later)
                            setTimeout(() => {
                                errorPopup.remove();
                            }, 500);
                        }, 5000);
                    }
                });
            </script>
 </body>
 </html>