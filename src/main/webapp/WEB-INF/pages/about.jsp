<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>About Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
	<jsp:include page="../../components/header.jsp" />
    <main>
        <section>
            <div class="about-hero">
                <span class="main-heading">ABOUT</span>
                <img src="${pageContext.request.contextPath}/images/about/1.jpg" alt="About-hero-image">
                <span class="main-line">Dream it . Design it . Live it</span>
            </div>
        </section>
        <section>
            <div class="about-banner">
                <h2>Our Story, Your Space</h2>
                <p>Because every home deserves to feel personal, warm, and truly yours.</p>
            </div>
        </section>
        <section>
            <div class="about-speciality">
                <h2>What Makes AafnoSpace Different</h2>

                <div class="about-gallery">
                    <div class="gallery-pics">
                        <img src="${pageContext.request.contextPath}/images/about/2.png" alt="Curated Not Crowded">
                        <span>Curated Not Crowded</span>
                    </div>

                    <div class="gallery-pics">
                        <img src="${pageContext.request.contextPath}/images/about/3.png" alt="Design That Lasts">
                        <span>Design That Lasts</span>
                    </div>

                    <div class="gallery-pics">
                        <img src="${pageContext.request.contextPath}/images/about/4.png" alt="Made for Real Homes">
                        <span>Made for Real Homes</span>
                    </div>

                    <div class="gallery-pics">
                        <img src="${pageContext.request.contextPath}/images/about/5.png" alt="Quality Over Cheap Alternatives">
                        <span>Quality Over Cheap Alternatives</span>
                    </div>
                </div>
            </div>

        </section>
        <section>
            <div class="about-story">
                <h2>
                    Our Story: Making Spaces Truly ‘आफ्नो’

                </h2>
                <div class="our-story">
                    <div class="story-pic">
                        <img src="${pageContext.request.contextPath}/images/about/6.png" alt="Story Image">

                    </div>
                    <div class="story">
                        <p>
                            AafnoSpace was born from a simple idea—everyone deserves a space that feels truly आफ्नो. In
                            Nepal, creating a personalized home often means choosing between limited designs or
                            compromising on quality. We set out to change that by offering carefully curated pieces that
                            bring both style and substance into your space.
                        </p>
                        <p>
                            We may not be the cheapest, but we focus on what lasts—designs that feel right, look
                            better over time, and make your space genuinely yours. Because a home isn’t just something
                            you fill, it’s something you build with intention.

                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="transition">
                <h2>
                    From Idea to Reality
                </h2>
                <div class="our-idea">
                    <div class="our-reality">
                        <img src="${pageContext.request.contextPath}/images/about/7.png" alt="Imagine">
                        <p>Imagine</p>
                    </div>

                    <div class="our-reality-center">
                        <img src="${pageContext.request.contextPath}/images/about/8.png" alt="Choose">
                        <p>Choose</p>
                    </div>

                    <div class="our-reality">
                        <img src="${pageContext.request.contextPath}/images/about/9.png" alt="Create">
                        <p>Create</p>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="contact-CTA">
                <h2>Ready to Design Your Space?</h2>
                <a href="${pageContext.request.contextPath}/contact" class="contact-button">Get in Touch</a>
            </div>
            <div class="portfolio-CTA">
                <h2>Meet the People Behind AafnoSpace... </h2>
                <a href="${pageContext.request.contextPath}/portfolio" class="portfolio-button">View Our Team></a>
            </div>
        </section>
    </main>
    <jsp:include page="../../components/footer.jsp" />
</body>

</html>