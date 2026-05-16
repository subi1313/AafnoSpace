<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminUpdateProduct.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-update">
        	<jsp:include page="../../components/adminPanel.jsp" />
        	<div class="update-main">
                <form action="${pageContext.request.contextPath}/update-product" method="post" enctype="multipart/form-data">
                	<!-- Error -->
	            	<c:if test="${not empty error}">
					    <div class="errorPopup" id="errorPopup">
					        ${error}
					    </div>
					</c:if>
                    <h2>Update Product</h2>
                    <div class="update-info">
                        <div class="update-details">
                            <h3>Product Details </h3>

                            <div class="detail-form">
                                <label>Product ID</label>
                                <input type="hidden" name="productId" value="${product.productId}">
                                <input type="text" id="product-id" value="${product.productId}" readonly>
                                <label>Product Name</label>
                                <input type="text" id="product-name" name="productName" value="${product.productName}">
                                <label>Category</label>
                                <select id="category" name="category">
                                    <option value="Minimal" ${product.category=='Minimal' ? 'selected' : '' }>Minimal
                                    </option>
                                    <option value="Japandi" ${product.category=='Japandi' ? 'selected' : '' }>Japandi
                                    </option>
                                    <option value="Modern" ${product.category=='Modern' ? 'selected' : '' }>Modern
                                    </option>
                                    <option value="Bohemian" ${product.category=='Bohemian' ? 'selected' : '' }>Bohemian
                                    </option>
                                    <option value="Luxury" ${product.category=='Luxury' ? 'selected' : '' }>Luxury
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="update-pic" id="imagePreview">
                            <img src="${pageContext.request.contextPath}/product-image?name=${product.imageName}" alt="Product Image">
                            <label for="productImage" class="pic-upload-btn">
                                Choose Image
                            </label>
                            <input type="file" name="productImage" id="productImage">
                        </div>
                    </div>
                    <div class="inventory">
                        <h3>Inventory and Pricing</h3>

                        <div class="inventory-form">
                            <div class="inv-form-part">
                                <div class="form-part">
                                    <label>Selling Price</label>
                                    <input type="text" id="price" name="price" value="${product.price}">
                                </div>

                                <div class="form-part">
                                    <label>Quantity</label>
                                    <input type="text" id="quantity" name="quantity" value="${product.quantity}">
                                </div>
                            </div>

                            <label>Description</label>
                            <textarea id="description" name="description">${product.description}</textarea>
                        </div>
                    </div>
                    <div class="update-button">
                        <button type="submit">Update Product</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <jsp:include page="../../components/footer.jsp" />
    <script>
    document.getElementById("productImage").addEventListener("change", function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.createElement("img");
                img.src = e.target.result;
                img.style.width = "100%";
                img.style.height = "340px";
                img.style.objectFit = "cover";
                img.style.borderRadius = "8px";
                img.style.margin = "20px 0px";

                const preview = document.getElementById("imagePreview");
                preview.querySelectorAll("img").forEach(i => i.remove());
                preview.appendChild(img);
            };
            reader.readAsDataURL(file);
        }
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        const errorPopup = document.getElementById('errorPopup');
        
        if (errorPopup) {
            // Wait for 5 seconds (5000ms)
            setTimeout(() => {
            	// Add the fade-out class to trigger CSS transitions
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