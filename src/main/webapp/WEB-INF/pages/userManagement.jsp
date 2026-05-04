<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<div class="layout">
	<jsp:include page="/components/adminPanel.jsp"/>
  
</div>
<%@ include file="/components/footer.jsp" %>
</body>
</html>
