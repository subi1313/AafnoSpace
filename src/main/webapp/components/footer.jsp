<%@ page isELIgnored="false" %>

<%-- Website footer section --%>
<footer>
    <div class="footer-main">
    
    	<%-- Footer logo section --%>
        <div class="footer-section">
            <img src="${pageContext.request.contextPath}/images/main/logo.webp" alt="Aafno Space Logo" class="footer-logo">
        </div>
        
        <%-- Footer navigation links --%>
        <div class="footer-section">
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/product">Products</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
            </ul>
        </div>
        
        <%-- Contact information section --%>
        <div class="footer-section">
            <p>For further queries, contact us at:</p>
            <p>+977 9841784529</p>
            <p>info@aafnospace.com</p>
            <p>Kathmandu, Nepal</p>
        </div>
    </div>
    <hr class="footer-line">
    <p class="footer-bottom">
        &copy; 2026 AafnoSpace. All Rights Reserved
    </p>
</footer>