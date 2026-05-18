<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Add Product</title>
    <%-- Linking external CSS files for header, admin panel, admin add product page, and footer styling --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminAddProduct.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
	<%-- Including reusable header component --%>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-add">
        	<%-- Including reusable admin Panel component --%>
        	<jsp:include page="../../components/adminPanel.jsp" />
            <div class="add-main">
            	<%-- Display error message if product submission fails --%>
            	<c:if test="${not empty error}">
				    <div class="errorPopup" id="errorPopup">
				        ${error}
				    </div>
				</c:if>
            	<h2>Add Product</h2>
            	<%-- Product submission form with image upload support --%>
                <form action="${pageContext.request.contextPath}/add-product" method="post" enctype="multipart/form-data">
                    <div class="add-info">
                        <div class="add-details">
                            <h3>Product Details </h3>
                            <div class="detail-form">
                                <label>Product Name</label>
                                <input type="text" name="productName" value="${productName}" placeholder="Enter product name">
                                <label>Category</label>
                                <select name="category">
                                    <option>Select product category</option>
                                    <option value="Minimal" ${category == 'Minimal' ? 'selected' : ''}>Minimal</option>
								    <option value="Japandi" ${category == 'Japandi' ? 'selected' : ''}>Japandi</option>
								    <option value="Modern" ${category == 'Modern' ? 'selected' : ''}>Modern</option>
								    <option value="Bohemian(Boho)" ${category == 'Bohemian(Boho)' ? 'selected' : ''}>Bohemian(Boho)</option>
								    <option value="Luxury" ${category == 'Luxury' ? 'selected' : ''}>Luxury</option>
                                </select>
                            </div>
                        </div>
                        <%-- Product image upload section --%>
                        <div class="add-pic" id="imagePreview">
                            <img src="${pageContext.request.contextPath}/images/adminAddProduct/gallery.png">
                            <p>Your product image goes here!!</p>
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
                                    <input type="text" name="price" value="${price}" placeholder="Enter selling price">
                                </div>

                                <div class="form-part">
                                    <label>Quantity</label>
                                    <input type="text" name="quantity" value="${quantity}" placeholder="Enter product quantity">
                                </div>
                            </div>

                            <label>Description</label>
                            <textarea name="description"
                                placeholder="Write a short description highlighting key benefits and features">${description}</textarea>
                        </div>
                    </div>
                    <div class="add-button">
                        <button type="submit">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <%-- Including reusable footer component --%>
    <jsp:include page="../../components/footer.jsp" />
    <script>
 	// Image preview functionality after file selection
    document.getElementById("productImage").addEventListener("change", function(event) {

        const file = event.target.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function(e) {

                const img = document.createElement("img");
                img.src = e.target.result;
                img.style.width = "100%";
                img.style.height = "230px";
                img.style.objectFit = "cover";
                img.style.borderRadius = "8px";
                img.style.margin = "10px 0px";

                const preview = document.getElementById("imagePreview");

                preview.querySelectorAll("img").forEach(i => i.remove());
                const placeholderText = preview.querySelector("p");
                if (placeholderText) placeholderText.style.display = "none";

                preview.appendChild(img);
            };

            reader.readAsDataURL(file);
        }
    });
 
 	// Auto-hide error popup after 3 seconds
    document.addEventListener('DOMContentLoaded', function() {
        const errorPopup = document.getElementById('errorPopup');
        
        if (errorPopup) {
            setTimeout(() => {
                errorPopup.classList.add('fade-out');
            	
                setTimeout(() => {
                    errorPopup.remove();
                }, 500);
            }, 3000);
        }
    });
	</script>
</body>

</html>