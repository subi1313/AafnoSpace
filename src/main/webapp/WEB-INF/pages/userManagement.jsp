<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Management – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userManagement.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>
  <div class="layout">
                <jsp:include page="/components/userPanel.jsp" />
            </div>

            <div class="main">
                <p class="mgmtheading">User Management</p>
             </div>
          </body>
          </html>