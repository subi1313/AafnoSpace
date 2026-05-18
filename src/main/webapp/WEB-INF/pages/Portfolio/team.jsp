<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About our Team</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/team.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<jsp:include page="/components/header.jsp"/>
<main>

    <!-- ABOUT HERO -->
    <section class="about-section">

<div class="about-content">

    <span class="section-tag">About आफ्नोSpace</span>

    <h1>
        Built with passion,<br>
        shaped by nature
    </h1>

    <p>
        आफ्नोSpace is a creative furniture brand inspired by nature and simplicity.
        We design wooden pieces that bring warmth, comfort, and meaning into your space.

        Our team is a small group of designers and creators who believe in quality,
        sustainability, and thoughtful design.
    </p>

</div>

    </section>


    <!-- TEAM SECTION -->
    <section class="team-section">

        <div class="team-header">
            <h2>Meet Our Team</h2>
            <p>
                The passionate minds behind AafnoSpace's creativity,
                innovation, and craftsmanship.
            </p>
        </div>

        <div class="team-grid">

  <!-- Member -->
<div class="team-card">

    <div class="team-image">
	 <img src="${pageContext.request.contextPath}/images/team/Simranbist.jpeg" alt="Team_Member">
    </div>

    <div class="team-info">
        <h3>Simran Bist</h3>
        <span>Marketing Head</span>
        <a href="${pageContext.request.contextPath}/teamMember?member=simran">
	    View Portfolio
		</a>
    </div>

</div>


            <!-- Member -->
<div class="team-card">

    <div class="team-image">
        <img src="${pageContext.request.contextPath}/images/team/aaki.jpeg" alt="Team_Member">
    </div>

    <div class="team-info">
        <h3>Aaki Prajapati</h3>
        <span>Project Manager</span>
        <a href="${pageContext.request.contextPath}/teamMember?member=aaki">
	    View Portfolio
		</a>
    </div>

</div>

<!-- Member -->
<div class="team-card">

    <div class="team-image">
       <img src="${pageContext.request.contextPath}/images/team/sulav.jpg" alt="Team_Member">
    </div>

    <div class="team-info">
        <h3>Sulav Shrestha</h3>
        <span>Data Analyst</span>

        <a href="${pageContext.request.contextPath}/teamMember?member=sulav">
	    View Portfolio
		</a>
    </div>

</div>

<!-- Member -->
<div class="team-card">

    <div class="team-image">
       <img src="${pageContext.request.contextPath}/images/team/supragya.png" alt="Team_Member">
    </div>
    <div class="team-info">
        <h3>Supragya Singh Sipai</h3>
        <span>UI/UX Designer</span>
        <a href="${pageContext.request.contextPath}/teamMember?member=supragya">
    View Portfolio
</a>
    </div>

</div>
</div>
    </section>

</main>
 <jsp:include page="/components/footer.jsp" />
</body>