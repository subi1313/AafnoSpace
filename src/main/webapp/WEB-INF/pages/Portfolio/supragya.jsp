<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supragya Singh Sipai</title>
    <style>
        body {
        	margin: 0px;
            font-family: 'Inter', sans-serif;
        }

        .hero-section {
            height: 840px;
            background-color: #edc6c8;
            padding: 10px 120px;
            border-radius: 0 0 70px 70px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav img {
            width: 200px;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        nav a {
            letter-spacing: 2px;
            align-items: flex-end;
            color: black;
            opacity: 0.7;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }

        .main-button a {
            background-color: #ffff;
            color: #DE9EA1;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
            border-radius: 10px;
            border: 2px solid #DE9EA1;
        }

        .hero {
            display: flex;
        }

        .hero-image img {
            padding-top: 30px;
            width: 700px;
        }

        .hero-content {
            padding: 120px 200px 100px 100px;
        }

        .hero-content h1 {
            font-size: 70px;
            color: #DE9EA1;
        }

        .hero-content h3 {
            font-size: 30px;
            color: #ffffff;
            font-weight: 100;
        }

        .hero-content p {
            font-size: 18px;
            color: #ffffff;
            font-weight: 100;
        }

        h2 {
            margin-top: 170px;
            font-size: 50px;
            color: #EDC6C8;
            font-weight: 100;
            text-align: center;
        }

        .tools img {
            width: 730px;
            display: block;
            margin: 0 auto;
        }

        .image-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 1300px;
            margin: 0 auto;
        }

        .image-grid img {
            width: 100%;
            height: auto;
            display: block;
            border-radius: 10px;
        }

        .banner img {
            margin-top: 170px;
            width: 1710px;
        }

        footer {
            background-color: #DE9EA1;
            height: 300px;
            margin-top: 70px;
        }

        .projects {
            display: flex;
            gap: 20px;
            padding: 10px;
            box-sizing: border-box;
            justify-content: center;
            margin: 0 auto;
        }

        .projects>div {
            width: 400px;
            box-sizing: border-box;
        }

        .projects img {
            width: 100%;
            height: auto;
            display: block;
        }

        .projects h3 {
            font-size: 30px;
            color: #EDC6C8;
            font-weight: 100;
            margin-bottom: 0;
        }

        .projects p {
            font-size: 20px;
            color: #191110;
            opacity: 0.7;
            font-weight: 100;
        }
    </style>
</head>

<body>
    <div class="hero-section">
        <nav class="navbar">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/logo.png">
            <div class="nav-links">
                <a href="#project">Project</a>
                <div class="main-button">
                    <a href="#footer">Let's connect</a>
                </div>
            </div>
        </nav>
        <div class="hero">
            <div class="hero-content">
                <h1>Hi, <br> it’s Supragya!</h1>
                <h3>-an emerging UI/UX Designer</h3>
                <p>I believe design is a quiet guide - not loud, but clear. Through UI/UX, I’m learning to shape digital
                    experiences that speak gently, solve simply and feel beautifully human.
                </p>
                <p style="color: #000000; opacity: 0.7;">
                    Somewhere between curiosity and creativity, you’ll find me
                </p>
            </div>
            <div class="hero-image">
                <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/portolio pic.png">
            </div>
        </div>
    </div>
    <div class="tools">
        <h2>Tools and Skills</h2>
        <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/tools.png" alt="">
        <h2>UI • UX • Prototyping</h2>
        <p style="font-family: 'Rouge Script', cursive; font-size: 32px; text-align: center;">
            From understanding users to building beautiful, functional and testable designs.
        </p>
        <div class="image-grid">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/UI.png" alt="Photo 1">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/2.png" alt="Photo 2">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/prototype.png" alt="Photo 3">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/1.png" alt="Photo 4">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/UX.png" alt="Photo 5">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/3.png" alt="Photo 6">
        </div>
    </div>
    <div class="banner">
        <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/banner.png" alt="">
    </div>
    <h2 style="position: absolute; left: 900px; top: 2450px;">
        Get to Know Me
    </h2>
    <p
        style="font-size: 18px; color: #000000; font-weight: 100; width: 600px; position: absolute; left: 850px; top: 2750px; opacity: 0.7; line-height: 2;">
        I'm a curious mind with a love for clean interfaces and meaningful experiences. As a budding UI/UX designer, I
        design with empathy, think in wireframes and obsess over the small details that make big differences. I'm not
        just learning design - I'm living it, one pixel at a time.
        Design, to me, isn’t just about how it looks - it’s how it works and how it feels.
    </p>
    <h2 id="project">Project Highlights</h2>
    <p style="font-family: 'Rouge Script', cursive; font-size: 32px; text-align: center;">
        Where each project tells ./ima story of purpose, innovation and impact.
    </p>
    <div class="projects">
        <div class="project1">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/project1.png">
            <h3>Bloom and Ruby</h3>
            <p>
                Bloom & Ruby is an elegant online store specializing in minimalist home décor designed to bring beauty,
                calm, and style into your living spaces.
            </p>
        </div>
        <div class="project2">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/project2.png">
            <h3>Bloom and Ruby</h3>
            <p>
                Bloom & Ruby is an elegant online store specializing in minimalist home décor designed to bring beauty,
                calm, and style into your living spaces.
            </p>
        </div>
        <div class="project3">
            <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/project3.png">
            <h3>Bloom and Ruby</h3>
            <p>
                Bloom & Ruby is an elegant online store specializing in minimalist home décor designed to bring beauty,
                calm, and style into your living spaces.
            </p>
        </div>
    </div>
    <hr style="border: 1px solid #DE9EA1; margin-top: 60px;">
    <h2 style="margin-top: 60px;">Let’s build something amazing together!</h2>
    <div style="text-align: center;">
        <a href="#footer"
            style="background-color: #ffff; color: #DE9EA1; text-decoration: none; padding: 10px 20px; border-radius: 10px; border: 2px solid #DE9EA1;">
            Contact me with the mail below !!
        </a>
    </div>
    <footer id="footer" style="text-align: center; padding-top: 35px;">
        <img src="${pageContext.request.contextPath}/images/portfolio/Supragya/footer.png" height="200px">
    </footer>


</body>

</html>