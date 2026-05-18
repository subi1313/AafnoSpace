<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simran Bist</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/teamMember.css">
    
</head>

<body>
    <header>
        <nav>
            <div class="left">Simran's Portfolio</div>
            <div class="right">
                <ul>
                    <li><a href="#home">About me</a></li>
                    <li><a href="#education">Education</a></li>
                    <li><a href="#skills">Skills</a></li>
                    <li><a href="#projects">Projects</a></li>
                    <li> <a href="#contact">Contact</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <main>
        <!-- About me section -->
        <section class="firstSection" id="home">
            <div class="leftSection">
                Hi, My name is <span class="pink">Simran Bista</span>
                <div>and I am a</div>
                <span id="element"></span>
                <br>
                <a href="/CV Simran Bist.pdf" target="_blank" class="btn-download">
                    View Resume
                </a>
                <a href="https://github.com/Simranbist2005" target="_blank" class="btn-download">
                    View Github
                </a>
            </div>
            <div class="rightSection">
                <img src="${pageContext.request.contextPath}/images/portfolio/Myphoto.jpg" alt="image">
            </div>
        </section>
        <hr>

        <!-- Education Section -->
        <section class="secondSection" id="education">
            <div>
                <h1>Education</h1>
                <div class="edu-item">
                    <h3>Islington College</h3>
                    <p>August 2024 - Present</p>
                    <p>Bachelor's in Computing</p>
                    <a href="https://islington.edu.np/">islington.edu.np</a>
                </div>

                <div class="edu-item">
                    <h3>Radiant Higher Secondary School</h3>
                    <p>High School, GPA: 3.53</p>
                    <a href="https://radiantmnr.edu.np/">radiantmnr.edu.np</a>
                </div>

                <div class="edu-item">
                    <h3>Sunrise Public Higher Secondary School</h3>
                    <p>SEE, GPA: 3.65</p>
                    <a href="https://www.facebook.com/sunrisepublicacademy/about/?_rdr">sunrisepublicacademy</a>
                </div>
            </div>
            <div class="image">
                <img src="${pageContext.request.contextPath}/images/portfolio/VectorImage.png" alt="image">
            </div>
        </section>
        <hr>

        <!-- Skills section -->
        <section class="thirdSection" id="skills">
            <h1>Skills</h1>
            <p>These are the technologies I'm familiar with:</p>
            <div class="skills-container">
                <div class="skill-card">
                    <div class="skill-icon">
                        <img src="${pageContext.request.contextPath}/images/portfolio/HTML.png" alt="HTML">
                    </div>
                    <h3>HTML</h3>
                </div>

                <div class="skill-card">
                    <div class="skill-icon">
                        <img src="${pageContext.request.contextPath}/images/portfolio/CSS.png" alt="CSS">
                    </div>
                    <h3>CSS</h3>
                </div>

                <div class="skill-card">
                    <div class="skill-icon">
                        <img src="${pageContext.request.contextPath}/images/portfolio/javascript.png" alt="JavaScript">
                    </div>
                    <h3>JavaScript</h3>
                </div>

                <div class="skill-card">
                    <div class="skill-icon">
                        <img src="${pageContext.request.contextPath}/images/portfolio/Python.png" alt="Python">
                    </div>
                    <h3>Python</h3>
                </div>

                <div class="skill-card">
                    <div class="skill-icon">
                        <img src="${pageContext.request.contextPath}/images/portfolio/Java.webp" alt="Java">
                    </div>
                    <h3>Java</h3>
                </div>
            </div>
        </section>
        <hr>

        <!-- Projects Section -->
        <section class="fourthSection" id="projects">
            <h1>Projects</h1>
            <div class="projects_container">
                <div class="project_card">
                    <div class="project_image">
                        <img src="${pageContext.request.contextPath}/images/portfolio/IS_project.png" alt="Information_System Project">
                    </div>
                    <h3>Watch E-commerce Website</h3>
                    <p>A fully functional front-end watch e-commerce website which is created using HTML, CSS and
                        JavaScript.</p>
                </div>

                <div class="project_card">
                    <div class="project_image">
                        <img src="${pageContext.request.contextPath}/images/portfolio/Python_project.png" alt="Information_System Project">
                    </div>
                    <h3>Skincare Wholesale System</h3>
                    <p>A fully functional skincare wholesale management system developed in Python using IDLE..</p>
                </div>

                <div class = "project_card">
                    <div class="project_image">
                        <a href="https://rus-woods.vercel.app/index.html" target="_blank">
                        <img src="${pageContext.request.contextPath}/images/portfolio/Screenshot 2026-01-06 085057.png" alt="RusWoods">
                        </a>
                    </div>
                    <h3>RusWoods</h3>
                    <p>A fully functional website developed using HTML, CSS, Javasript.</p>
                </div>
            </div>
        </section>
        <hr>

        <!-- Contact me -->
<section class="contact-section" id="contact">
    <div class="section-header">
        <h1 class="section-title">Contact Me</h1>
    </div>
    
    <div class="contact-container">
        <div class="contact-intro">
            <h2>Have a Project?</h2>
            <p class="contact-description">"Let's bring it to life. Whether near or far, I'm always open to connect and collaborate."</p>
        </div>
        
        <div class="contact-form-wrapper">
            <form class="contact-form">
                <div class="form-group">
                    <input type="text" id="name" name="name" placeholder="Your Name" required>
                </div>

                <div class="form-group">
                    <input type="email" id="email" name="email" placeholder="Your Email" required>
                </div>

                <div class="form-group">
                    <input type="text" id="subject" name="subject" placeholder="Subject">
                </div>

                <div class="form-group">
                    <textarea id="message" name="message" placeholder="Message" required></textarea>
                </div>

                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </div>
</section>
    </main>

    <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
    <script>
        var typed = new Typed('#element', {
            strings: ['Student', 'Frontend Developer', 'Web Designer'],
            typeSpeed: 50,
        });
    </script>
</body>

</html>