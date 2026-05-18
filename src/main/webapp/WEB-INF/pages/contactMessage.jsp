<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Contact Message</title>
    <%-- Linking external CSS files for header, admin panel, contact message page, and footer styling --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contactMessage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
	<%-- Including reusable header component --%>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-contact">
        	<%-- Including reusable admin Panel component --%>
        	<jsp:include page="../../components/adminPanel.jsp" />
        	<div class="message-main">
                <h2>Contact Messages</h2>
			    <table>
			        <tr>
			            <th>ID</th>
			            <th>Name</th>
			            <th>Email</th>
			            <th>Subject</th>
			            <th>Message</th>
			        </tr>
			        <c:forEach var="c" items="${contacts}">
			            <tr>
			                <td>${c.id}</td>
			                <td>${c.name}</td>
			                <td>${c.email}</td>
			                <td>${c.subject}</td>
			                <td>${c.message}</td>
			            </tr>
			        </c:forEach>
			        <c:if test="${empty contacts}">
				        <tr>
				            <td colspan="5" style="text-align:center; padding:20px;">
				                No contact messages found.
				            </td>
				        </tr>
				    </c:if>
			    </table>
            </div>
        </div>
	</section>
	<%-- Including reusable footer component --%>
    <jsp:include page="../../components/footer.jsp" />
</body>

</html>