<%@ page isELIgnored="false" %>
<!-- Side panel -->
<div class="admin-panel">
    <h2> <img src="./images/adminPanel/menu.png" alt="Menu Icon">Main menu</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin-profile" class="${activeMenu == 'profile' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/profile.png" alt="Profile Icon">
                Profile</a></li>
                
         
        <li><a href="${pageContext.request.contextPath}/cart" class="${activeMenu == 'user' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/shopping-cart.png" alt="Cart Icon"> Cart</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/order-history" class="${activeMenu == 'order' ? 'active' : ''}"> <img
                    src="${pageContext.request.contextPath}/images/adminPanel/order.png" alt="Order Icon"> Orders</a>
        </li>
    </ul>
    <div class="admin-panel-bottom">
        <h2> <img src="${pageContext.request.contextPath}/images/adminPanel/others.png" alt="Others Icon"> Others
        </h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/logout"> <img src="${pageContext.request.contextPath}/images/adminPanel/logout.png"
                        alt="Log Out Icon"> Log Out</a>
            </li>
        </ul>
    </div>
</div>