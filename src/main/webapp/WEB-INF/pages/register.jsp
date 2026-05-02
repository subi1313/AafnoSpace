<%@ page isELIgnored="false" %>
    <html>
    <head>
        <title>Registration Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/images/main/logo.png" class="logo" alt="logo">
        <div class="divbg">
            <div class="divimg">
                <img src="${pageContext.request.contextPath}/images/main/Registerpic.png" alt="RegisterPicture">
            </div>
          <div class="divregister">
                <p class="registerheading">Create an Account</p>  
                <form action="${pageContext.request.contextPath}/register" method="POST">
                <div class="divrow">
                	<div class="labeldiv">
                		<label>First Name</label>
                        <input type="text" name="firstname" placeholder="First Name">
                	</div>
                	<div class="labeldiv">
                		<label>Last Name</label>
                        <input type="text" name="lastname" placeholder="Last Name">
                	</div>
                </div>
                 <div class="divrow">
                	<div class="labeldiv">
                		<label>Email</label>
                        <input type="text" name="email" placeholder="Email">
                	</div>
                	<div class="labeldiv">
                		<label>Phone Number</label>
                        <input type="text" name="phoneno" placeholder="Phone Number">
                	</div>
                </div>
                 <div class="divrow">
                	<div class="labeldiv">
                		<label>Address</label>
                        <input type="text" name="address" placeholder="Address">
                	</div>
                	<div class="labeldiv">
                		<label>Username</label>
                        <input type="text" name="username" placeholder="Username">
                	</div>
                </div>
                <div class="labeldiv" style="margin-left:60px; margin-right:92px;">
                		<label>Password</label>
                        <input type="password" name="pwd" placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;">
                </div>
                 <div class="checkboxdiv">
    				<label class="checkboxlabel">
        				<input type="checkbox">
       						 <span>I agree to the Terms & Conditions</span>
   					</label>
				</div>
				<div style="margin-top:30px;">
                        <button type="submit">Next</button>
                    </div>
			</form>
        </div>
    </body>
    </html>