<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ProductList</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminProductList.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-list">
        	<jsp:include page="../../components/adminPanel.jsp" />
            <div class="list-main">
            	<c:if test="${not empty success}">
					<div class="successPopup" id="successPopup">
						${success}
					</div>
					<c:remove var="success" scope="session"/>
				</c:if>		    
                <div class="list-top">
                    <h2>Product List</h2>
                    <a href="${pageContext.request.contextPath}/add-product">
                        <button>Add Product</button>
                    </a>
                </div>
                <div class="list-table">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="p" items="${products}">

						        <tr>
						            <td>${p.productId}</td>
						            <td>${p.productName}</td>
						            <td>${p.category}</td>
						            <td>${p.quantity}</td>
						            <td>${p.price}</td>
						            <td>${p.description}</td>
						
						            <td>
									    <a href="update-product?id=${p.productId}">
									        <button class="update" type="button">
									            <img src="${pageContext.request.contextPath}/images/productList/update.png"
									                 alt="Update Icon">
									        </button>
									    </a>
									</td>
						
						            <td>
									    <form action="delete-product" method="post" style="display:inline;">
									        <input type="hidden" name="id" value="${p.productId}" />
									
									        <button class="delete" type="submit">
									            <img src="${pageContext.request.contextPath}/images/productList/delete.png"
									                 alt="Delete Icon">
									        </button>
									    </form>
									</td>
						        </tr>
						
						    </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../../components/footer.jsp" />
    <script>
	document.addEventListener('DOMContentLoaded', function () {
	    const popup = document.getElementById('successPopup');
	
	    if (popup) {
	        setTimeout(() => {
	            popup.classList.add('fade-out');
	
	            setTimeout(() => {
	                popup.remove();
	            }, 500);
	        }, 3000);
	    }
	});
	</script>
</body>

</html>