<%@ page isELIgnored="false" %>
    <html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/images/main/logo.png" class="logo" alt="logo">
        <div class="divbg">
            <div class="divimg">
                <img src="${pageContext.request.contextPath}/images/main/loginpic.png" alt="LoginPicture">
            </div>
            <div class="divsignin">
                <p class="signinheading">Sign In</p>
                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="labeldiv">
                        <label>Email</label>
                        <input type="text" name="email" placeholder="Name">
                    </div>
                    <div class="labeldiv">
                        <label for="pwd">Password</label>
                        <input type="password" name="pwd"
                            placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;">
                    </div>
                    <div style="margin-top:30px;">
                        <button type="submit">Sign In</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
    </html>