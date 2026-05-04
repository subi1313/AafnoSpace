<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact.css">
</head>

<body>
	<jsp:include page="../../components/header.jsp" />
    <main>
        <section>
            <div class="contact-banner">
                <h2> Get in Touch </h2>
                <p>We’re here to help with any questions or inquiries you may have. <br>
                    Reach out to us anytime and our team will respond as soon as possible.</p>
            </div>
        </section>
        <section>
            <div class="contact-main">
                <div class="contact-img">
                    <img src="${pageContext.request.contextPath}/images/contact/1.png" alt="">
                </div>
                <div class="contact-info">
                    <h3>Reach Out to Us</h3>
                    <p>Your questions and feedback matter to us </p>
                    <div class="contact-form">
                        <label>Name*</label>
                        <input type="text">
                        <label>Email*</label>
                        <input type="email">
                        <label>Subject*</label>
                        <input type="text">
                        <label>Message*</label>
                        <textarea></textarea>
                        <button class="contact-button">Submit</button>
                    </div>
                </div>

            </div>
        </section>
    </main>
</body>

</html>