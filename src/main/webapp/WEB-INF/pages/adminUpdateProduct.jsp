<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminUpdateProduct.css">
</head>

<body>
	<jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-update">

            <div class="admin-panel">

            </div>
            <div class="update-main">
                <h2>Update Product</h2>
                <div class="update-info">
                    <div class="update-details">
                        <h3>Product Details </h3>

                        <div class="detail-form">
                            <label>Product Name</label>
                            <input type="text" id="product-name" value="${product.name}">
                            <label>Product ID</label>
                            <input type="text" id="product-id" value="${product.id}">
                            <label>Category</label>
                            <select id="category">
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
                    <div class="update-pic">
                        <img src="${pageContext.request.contextPath}/images/adminUpdateProduct/product.png" alt="Product Image">
                        <p>Wanna add another image?</p>
                        <span>Click to browse</span>
                    </div>
                </div>
                <div class="inventory">
                    <h3>Inventory and Pricing</h3>

                    <div class="inventory-form">
                        <div class="inv-form-part">
                            <div class="form-part">
                                <label>Selling Price</label>
                                <input type="text" id="price" value="${product.price}">
                            </div>

                            <div class="form-part">
                                <label>Quantity</label>
                                <input type="text" id="quantity" value="${product.quantity}">
                            </div>
                        </div>

                        <label>Description</label>
                        <textarea id="description">${product.description}</textarea>
                    </div>
                </div>
                <div class="update-button">
                    <button type="submit">Update Product</button>
                </div>
            </div>
        </div>
    </section>
</body>

</html>