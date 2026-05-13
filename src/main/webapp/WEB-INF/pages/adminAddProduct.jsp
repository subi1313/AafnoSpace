<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Add Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminAddProduct.css">
</head>

<body>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-add">
        	<jsp:include page="../../components/adminPanel.jsp" />
            <div class="add-main">
                <h2>Add Product</h2>
                <form action="add-product-pic" method="post" enctype="multipart/form-data">
                    <div class="add-info">
                        <div class="add-details">
                            <h3>Product Details </h3>

                            <div class="detail-form">
                                <label>Product Name</label>
                                <input type="text" name="productName" placeholder="Enter product name">
                                <label>Category</label>
                                <select name="category">
                                    <option>Select product category</option>
                                    <option>Minimal</option>
                                    <option>Japandi</option>
                                    <option>Modern</option>
                                    <option>Bohemian(Boho)</option>
                                    <option>Luxury</option>
                                </select>
                            </div>

                        </div>
                        <div class="add-pic">
                            <img src="./images/adminAddProduct/gallery.png" alt="">
                            <p>Your product image goes here!!</p>
                            <label class="pic-upload-btn">
                                Choose Image
                                <input type="file" name="productImage" accept="image/*">
                            </label>
                        </div>
                    </div>
                    <div class="inventory">
                        <h3>Inventory and Pricing</h3>

                        <div class="inventory-form">
                            <div class="inv-form-part">
                                <div class="form-part">
                                    <label>Selling Price</label>
                                    <input type="text" name="price" placeholder="Enter selling price">
                                </div>

                                <div class="form-part">
                                    <label>Quantity</label>
                                    <input type="text" name="quantity" placeholder="Enter product quantity">
                                </div>
                            </div>

                            <label>Description</label>
                            <textarea name="description"
                                placeholder="Write a short description highlighting key benefits and features"></textarea>
                        </div>
                    </div>
                    <div class="add-button">
                        <button type="submit">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

</html>