<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamics/css.jspf" %>

<body>

<!-- ======= Header ======= -->
<%@include file="../dynamics/header.jspf" %>
<!-- End Header -->

<!-- ======= About Section ======= -->
<br>
<br>
<br>
<br>
<br>

<div id="about" class="about">

    <!-- ======= About Me ======= -->
    <div class="about-me container">

        <div class="section-title">
            <h2>O mnie</h2>
            <p>Dowiedz się czegoś o mnie</p>
        </div>
        <sec:authorize access="hasAnyAuthority('ADMIN')">
            <span class="about-edit"><a href='<c:url value="/editAbout"/>'>(edit) </a> </span>
        </sec:authorize>
        <div class="row">
            <div class="col-lg-4" data-aos="fade-right">
                <img src='<c:url value="/resources/img/me.jpg"/>' class="img-fluid" alt="">
            </div>
            <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
                <h3>${aboutMe.getJobSpecialization()}</h3>
                <p class="fst-italic">
                    ${aboutMe.getShortInfo()}
                </p>
                <div class="row">
                    <div class="col-lg-6">
                        <ul>
                            <c:if test='${aboutMe.getEnableBirthday() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Birthday:</strong>
                                    <span>${aboutMe.getBirthday()}</span>
                                </li>
                            </c:if>
                            <c:if test='${aboutMe.getEnableWebsite() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Website:</strong>
                                    <span>${aboutMe.getWebsite()}</span></li>
                            </c:if>
                            <c:if test='${aboutMe.getEnablePhone() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong>
                                    <span>${aboutMe.getPhone()}</span>
                                </li>
                            </c:if>
                            <c:if test='${aboutMe.getEnableCity() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>City:</strong>
                                    <span>${aboutMe.getCity()}</span>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <c:if test='${aboutMe.getEnableAge() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Age:</strong>
                                    <span>${aboutMe.getAge()}</span></li>
                            </c:if>
                            <c:if test='${aboutMe.getEnableDegree() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Degree:</strong>
                                    <span>${aboutMe.getDegree()}</span></li>
                            </c:if>
                            <c:if test='${aboutMe.getEnableEmail() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Email:</strong>
                                    <span>${aboutMe.getEmail()}</span></li>
                            </c:if>
                            <c:if test='${aboutMe.getEnableFreelance() eq "true"}'>
                                <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong>
                                    <span>${aboutMe.getFreelance()}</span>
                                </li>
                            </c:if>

                        </ul>
                    </div>

                </div>
                <p> ${aboutMe.getLongInfo()} </p>
            </div>
        </div>

    </div><!-- End About Me -->

    <!-- ======= Skills ======= -->
    <div class="skills container">

        <div class="section-title">
            <h2>Skills</h2>
        </div>

        <div class="row skills-content">

            <div class="col-lg-6">
                <c:forEach items="${leftSkills}" var="skill">
                    <div class="progress">
                        <span class="skill">${skill.name} <i class="val">${skill.level}%</i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${skill.level}" aria-valuemin="0"
                                 aria-valuemax="100"></div>
                        </div>
                    </div>

                </c:forEach>


            </div>

            <div class="col-lg-6">

                <c:forEach items="${rightSkills}" var="skill">
                    <div class="progress">
                        <span class="skill">${skill.name} <i class="val">${skill.level}%</i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${skill.level}" aria-valuemin="0"
                                 aria-valuemax="100"></div>
                        </div>
                    </div>


                </c:forEach>

            </div>

        </div>

    </div><!-- End Skills -->

    <!-- ======= Interests ======= -->
    <div class="interests container">

        <div class="section-title">
            <h2>Interests</h2>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-4">
                <div class="icon-box">
                    <i class="ri-store-line" style="color: #ffbb2c;"></i>
                    <h3>Lorem Ipsum</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                <div class="icon-box">
                    <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                    <h3>Dolor Sitema</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                <div class="icon-box">
                    <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                    <h3>Sed perspiciatis</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
                <div class="icon-box">
                    <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                    <h3>Magni Dolores</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-database-2-line" style="color: #47aeff;"></i>
                    <h3>Nemo Enim</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                    <h3>Eiusmod Tempor</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
                    <h3>Midela Teren</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
                    <h3>Pira Neve</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-anchor-line" style="color: #b2904f;"></i>
                    <h3>Dirada Pack</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-disc-line" style="color: #b20969;"></i>
                    <h3>Moton Ideal</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-base-station-line" style="color: #ff5828;"></i>
                    <h3>Verdo Park</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
                <div class="icon-box">
                    <i class="ri-fingerprint-line" style="color: #29cc61;"></i>
                    <h3>Flavor Nivelanda</h3>
                </div>
            </div>
        </div>

    </div><!-- End Interests -->



</div><!-- End About Section -->


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>


<%@include file="../dynamics/javaScript.jspf" %>

</body>

</html>