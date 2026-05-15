<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    <head>
        <title>Login Page– आफ्नो SPACE</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/images/main/logo.png" class="logo" alt="logo">
        <div class="divbg">
            <div class="divimg">
                <img src="${pageContext.request.contextPath}/images/main/loginpic.png" alt="LoginPicture">
            </div>
            <div class="divsignin">
                <p class="signinheading">Sign In</p>
                <!-- displaying errors/messages -->
                <c:if test="${not empty error}">
                <div id="errorPopup" class="errordiv">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
            </c:if>
                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="labeldiv">
                        <label>Username</label>
                        <input type="text" name="username" value="${typedUser}" placeholder="Name">
                    </div>
                    <div class="labeldiv">
                        <label>Password</label>
                        <input type="password" name="password"
                            placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;">
                    </div>
                    <div style="margin-top:30px;">
                        <button type="submit">Sign In</button>
                    </div>
                    <div class="alreadyaccount">
                    <span>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></span>
                    </div>
                </form>
            </div>
        </div>
        <script>
    // Execute when the page is fully loaded
    document.addEventListener('DOMContentLoaded', function() {
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