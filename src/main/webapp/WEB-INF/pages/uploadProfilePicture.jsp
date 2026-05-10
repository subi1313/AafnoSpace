<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>

    <head>
        <title>Upload Profile Picture</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/uploadProfilePicture.css">
    </head>

    <body>
        <img src="${pageContext.request.contextPath}/images/main/logo.png" class="logo" alt="logo">
        <div class="divbg">
            <div class="divimg">
                <img src="${pageContext.request.contextPath}/images/main/Uploadpfppic.png" alt="UploadPicture">
            </div>
            <div class="divpersonalize">
                <p class="uploadheading">Personalize Your Account</p>
				<!-- displaying errors/messages -->
				 <c:if test="${not empty error}">
                <div id="errorPopup" class="errordiv">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
            </c:if>
                <form action="${pageContext.request.contextPath}/uploadpfp" method="post" enctype="multipart/form-data">
                <input type="file" id="profileImage" name="profileImage" accept="image/*" hidden onchange="previewFile()">
    <div class="divpfp">
    <div class="pfpcircle">
            <img id="pfpPreview" src="${pageContext.request.contextPath}/images/main/user.png" alt="profile">
        </div>
    </div>
    <div style="display: flex; justify-content: center;">
 <label for="profileImage" class="uploadbutton">
         Upload Profile Picture
    </label>
    </div>
    <button type="submit" class="createbutton">Create Account</button>
</form>
            </div>
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