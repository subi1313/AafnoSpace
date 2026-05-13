<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Management – आफ्नो SPACE</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userManagement.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<jsp:include page="/components/header.jsp"/>
  <div class="layout">
                <jsp:include page="/components/adminPanel.jsp" />
            </div>
		<div class=maindiv>
            <div class="main">
                <p class="mgmtheading">User Management</p>
             </div>
             <div class="container">
    <div class="headerdiv">
        <p>User <span>List</span></p>
        <c:if test="${not empty users}">
            <div class="totalusers">
                <i class="fa fa-users"></i> &nbsp; ${fn:length(users)} Users
            </div>
        </c:if>
    </div>
	
	<!-- if no users are available -->
    <div class="tablediv">
        <c:choose>
            <c:when test="${empty users}">
                <div class="emptystate">
                    <i class="fa-regular fa-folder-open fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                    <p>No customer records found.</p>
                </div>
            </c:when>
            
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Email Address</th>
                            <th>Address</th>
                            <th>Phone Number</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${users}">
                            <tr>
                                <td>
                                    <div class="userdiv">
                                        <div class="pfpcircle">
                                            <%-- Start with PNG as default --%>
                                            <!-- using the getter method name in EL -->
                                            <img src="${pageContext.request.contextPath}/getImage?name=${u.userName}" 
                                                 alt="Profile" 
                                                 style="width: 100%; height: 100%; object-fit: cover;"
                                                 onerror="handleImageError(this, '${u.userName}', '${fn:substring(u.firstName, 0, 1)}${fn:substring(u.lastName, 0, 1)}')">
                                         </div>
                                        
                                        <div class="userinfo">
                                            <span class="username">${u.firstName} ${u.lastName}</span>
                                            <span class="userhandle">@${fn:toLowerCase(u.userName)}</span>
                                        </div>
                                    </div>
                                </td>
                                <td>${u.email}</td>
                                <td>${u.address}</td>
                               	<td>${u.phoneNo}</td>
<td>${u.status}</td>
                 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
<script>
function handleImageError(img, username, initials) {
    const parent = img.parentElement;

    img.style.display = "none";

    parent.innerHTML = initials;
}
</script>
          </body>
          </html>