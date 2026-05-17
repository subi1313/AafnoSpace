<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    <head>
        <title>Registration Page– आफ्नो SPACE</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/images/main/logo.png" class="logo" alt="logo">
            
        <div class="divbg">
            <div class="divimg">
                <img src="${pageContext.request.contextPath}/images/main/Registerpic.png" alt="RegisterPicture">
            </div>
          <div class="divregister">
                <p class="registerheading">Create an Account</p>
                <c:if test="${not empty error}">
                <div id="errorPopup" class="errordiv">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
            </c:if>  
                <form action="${pageContext.request.contextPath}/register" method="POST">
                <div class="divrow">
                	<div class="labeldiv">
                		<label>First Name</label>
                        <input type="text" name="firstname" placeholder="First Name" value="${firstname}">
                	</div>
                	<div class="labeldiv">
                		<label>Last Name</label>
                        <input type="text" name="lastname" placeholder="Last Name" value="${lastname}">
                	</div>
                </div>
                 <div class="divrow">
                	<div class="labeldiv">
                		<label>Email</label>
                        <input type="text" name="email" placeholder="Email" value="${email}">
                	</div>
                	<div class="labeldiv">
                		<label>Phone Number</label>
                        <input type="text" name="phoneNo" placeholder="Phone Number" value="${phone}">
                	</div>
                </div>
                 <div class="divrow">
                	<div class="labeldiv">
                		<label>Address</label>
                        <input type="text" name="address" placeholder="Address" value="${address}">
                	</div>
                	<div class="labeldiv">
                		<label>Username</label>
                        <input type="text" name="username" placeholder="Username" value="${typedUser}">
                	</div>
                </div>
                <div class="labeldiv" style="margin-left:60px; margin-right:92px;">
                		<label>Password</label>
                        <input type="password" name="password" placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;">
                </div>
                 <div class="checkboxdiv">
                 <label class="checkboxlabel">
        			<input type="checkbox" required>
        		<span>I agree to the Terms & Conditions</span>
        		</label>
				</div>
				<div style="margin-top:30px;">
                        <button type="submit">Next</button>
                    </div>
                                        <div class="alreadyaccount">
                    <span>Already have an account? <a href="${pageContext.request.contextPath}/login">Log in</a></span>
                    </div>
                    </form>

			</div>
        </div>
        <script>
    document.addEventListener('DOMContentLoaded', function() {
        const errorPopup = document.getElementById('errorPopup');
        if (errorPopup) {
            setTimeout(() => {
                errorPopup.classList.add('fade-out');
                setTimeout(() => { errorPopup.remove(); }, 500);
            }, 5000);
        }
    });
</script>
    </body>
    </html>