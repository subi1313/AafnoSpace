<%@ page isELIgnored="false" %>
<!-- Side panel -->
<div class="admin-panel">
    <h2> <img src="./images/adminPanel/menu.png" alt="Menu Icon">Main menu</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin-dashboard" class="${activeMenu == 'dashboard' ? 'active' : ''}">
                <img src="${pageContext.request.contextPath}/images/adminPanel/dashboard.png" alt="Dashboard Icon">
                Dashboard</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/admin-profile" class="${activeMenu == 'profile' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/profile.png" alt="Profile Icon">
                Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/userManagement" class="${activeMenu == 'user' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/user.png" alt="User Icon"> User
                Management</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/product-list" class="${activeMenu == 'product' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/product.png" alt="Product Icon">
                Product Management</a></li>
        <li><a href="${pageContext.request.contextPath}/admin" class="${activeMenu == 'order' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/order.png" alt="Order Icon"> Order
                Management</a>
        </li>
    </ul>
    <div class="admin-panel-bottom">
        <h2> <img src="${pageContext.request.contextPath}/images/adminPanel/others.png" alt="Others Icon"> Others
        </h2>
        <ul>
            <li><a href="#"> <img src="${pageContext.request.contextPath}/images/adminPanel/logout.png"
                        alt="Log Out Icon"> Log Out</a>
            </li>
        </ul>
    </div>
</div>