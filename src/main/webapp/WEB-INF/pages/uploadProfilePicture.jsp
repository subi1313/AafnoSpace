<%@ page isELIgnored="false" %>
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

                <form action="${pageContext.request.contextPath}/uploadpfp" method="post" enctype="multipart/form-data">
    <div class="divpfp">
        <label for="profileImage" class="pfpcircle">
            <img id="pfpPreview" src="${pageContext.request.contextPath}/images/main/user.png" alt="profile">
        </label>
    </div>

    <label for="profileImage" class="custom-file-upload">
        <i class="fas fa-camera"></i> Change Photo
    </label>

    <!-- ONE input only -->
    <input type="file" id="profileImage" name="profileImage" accept="image/*" hidden onchange="previewFile()">

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
                    };

                    reader.readAsDataURL(file);
                }
            }
        </script>
    </body>

    </html>