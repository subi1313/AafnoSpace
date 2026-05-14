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
</head>

<body>
    <jsp:include page="../../components/header.jsp" />
    <section>
        <div class="admin-list">
        	<jsp:include page="../../components/adminPanel.jsp" />
            <div class="list-main">
                <div class="list-top">
                    <h2>Product List</h2>
                    <a href="/add-product">
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
                            <tr>
                                <td>1</td>
                                <td>Farmhouse Wooden Table Wall Table Unique Home Decor </td>
                                <td>Bohemian</td>
                                <td>7</td>
                                <td>28500</td>
                                <td>Bring warmth and rustic charm into your space with this beautifully crafted
                                    Farmhouse Wooden ...</td>
                                <td><button class="update"><img src="${pageContext.request.contextPath}/images/productList/update.png"
                                            alt="Update Icon"></button></td>
                                <td><button class="delete"><img src="${pageContext.request.contextPath}/images/productList/delete.png"
                                            alt="Delete Icon"></button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>

</html>