<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Contact Us</title>
    <%-- Linking external CSS files for header, contact page, and footer styling --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
	<%-- Including reusable header component --%>
	<jsp:include page="../../components/header.jsp" />
    <main>
        <section>
        	<%-- Contact banner section --%>
            <div class="contact-banner">
                <h2> Get in Touch </h2>
                <p>We’re here to help with any questions or inquiries you may have. <br>
                    Reach out to us anytime and our team will respond as soon as possible.</p>
            </div>
        </section>
        <section>
        	<%-- Success and error message displaying --%>
        	<c:if test="${not empty error}">
        		<div class="errorPopup" id="errorPopup">
					${error}
				</div>
			</c:if>
			<c:if test="${not empty success}">
				<div class="successPopup" id="successPopup">
					${success}
				</div>
			</c:if>        	

            <div class="contact-main">
                <div class="contact-img">
                    <img src="${pageContext.request.contextPath}/images/contact/1.png">
                </div>
                <%-- Contact form section --%>
                <form class="contact-info" action="${pageContext.request.contextPath}/contact" method="post">
                    <h3>Reach Out to Us</h3>
                    <p>Your questions and feedback matter to us </p>
                    <div class="contact-form">
                        <label>Name*</label>
                        <input type="text" name="name">
                        <label>Email*</label>
                        <input type="email" name="email">
                        <label>Subject*</label>
                        <input type="text" name="subject">
                        <label>Message*</label>
                        <textarea name="message"></textarea>
                        <button type="submit" class="contact-button">Submit</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    <%-- Including reusable footer component --%>
    <jsp:include page="../../components/footer.jsp" />
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const errorPopup = document.getElementById('errorPopup');
        const successPopup = document.getElementById('successPopup');
        
        if (errorPopup) {
            // Waits for 3 seconds (3000ms)
            setTimeout(() => {
            	//Adds the fade-out class to trigger CSS transitions
                errorPopup.classList.add('fade-out');
            	
                //Remove from DOM entirely after transition finishes (500ms later)
                setTimeout(() => {
                    errorPopup.remove();
                }, 500);
            }, 3000);
        }
    });
	</script>
</body>

</html>