<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title>Login Page</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderCheckout.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
        </head>

        <body>
            <jsp:include page="/components/header.jsp" />
            <div class="layout">
                <jsp:include page="/components/adminPanel.jsp" />
            </div>
			
        </body>

        </html>