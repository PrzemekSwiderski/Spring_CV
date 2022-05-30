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

        <form action='<c:url value="/editAbout"/>' method="post" class="about-form">
            <input type="number" name="id" value="${aboutMe.getId()}" class="visually-hidden"/>
            <div class="row">
                <div class="col-lg-4" data-aos="fade-right">
                    <img src='<c:url value="/resources/img/me.jpg"/>' class="img-fluid" alt="">
                </div>
                <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
                    <div class="about-form mt-9">
                        <label>Specjalizacja</label>
                        <input type="text" class="form-control" name="jobSpecialization"
                               value="${aboutMe.getJobSpecialization()}">
                    </div>
                    <br>
                    <div class="about-form mt-9">
                        <label>Coś o mnie</label>
                        <textarea class="col-12" name="shortInfo">${aboutMe.getShortInfo()}</textarea>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-6 ">
                            <ul>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right col-sm"></i>
                                        <strong class="col-sm">Birthday:</strong>
                                    </div>
                                    <div class="about-form col-sm">
                                        <input type="text" class="form-control" name="birthday"
                                               value="${aboutMe.getBirthday()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableBirthday" type="checkbox"
                                        <c:if test='${aboutMe.getEnableBirthday() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>

                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right col-sm"></i>
                                        <strong class="col-sm">Website:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="website"
                                               value="${aboutMe.getWebsite()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableWebsite" type="checkbox"
                                        <c:if test='${aboutMe.getEnableWebsite() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>

                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right col-sm"></i>
                                        <strong class="col-sm">Phone:</strong>
                                    </div>
                                    <div class="about-form col-7">

                                        <input type="text" class="form-control" name="phone"
                                               value="${aboutMe.getPhone()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enablePhone" type="checkbox"
                                        <c:if test='${aboutMe.getEnablePhone() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right col-sm"></i>
                                        <strong class="col-sm">City:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="city"
                                               value="${aboutMe.getCity()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableCity" type="checkbox"
                                        <c:if test='${aboutMe.getEnableCity() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right"></i>
                                        <strong>Age:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="age"
                                               value="${aboutMe.getAge()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableAge" type="checkbox"
                                        <c:if test='${aboutMe.getEnableAge() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right"></i>
                                        <strong>Degree:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="degree"
                                               value="${aboutMe.getDegree()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableDegree" type="checkbox"
                                        <c:if test='${aboutMe.getEnableDegree() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right"></i>
                                        <strong>Email:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="email"
                                               value="${aboutMe.getEmail()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableEmail" type="checkbox"
                                        <c:if test='${aboutMe.getEnableEmail() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                                <li class="row">
                                    <div class="col-4">
                                        <i class="bi bi-chevron-right"></i>
                                        <strong>Freelance:</strong>
                                    </div>
                                    <div class="about-form col-sm field-right">
                                        <input type="text" class="form-control" name="freelance"
                                               value="${aboutMe.getFreelance()}">
                                    </div>
                                    <div class="col-1">
                                        <input name="enableFreelance" type="checkbox"
                                        <c:if test='${aboutMe.getEnableFreelance() eq "true"}'>
                                               checked
                                        </c:if>>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="about-form mt-9">
                        <label>Coś dłuższego o mnie</label>
                        <textarea class="col-12" name="longInfo">${aboutMe.getLongInfo()}</textarea>
                    </div>
                </div>
            </div>
            <br>
            <div class="text-center">
                <button type="submit">Zaktualizuj</button>
            </div>
        </form>

    </div><!-- End About Me -->

    <!-- ======= Skills  ======= -->
    <div class="skills container">

        <div class="section-title">
            <h2>Skills</h2>
        </div>
        <br>
        <form method="post" action='<c:url value="/addSkill"/>' class="about-form">
            <input type="number" name="aboutMe" value="${aboutMe.getId()}" class="visually-hidden"/>
            <div class="row col-12">
                <div class="col-2">
                    <i class="bi bi-chevron-right"></i>
                    <strong>Nowy Skill</strong>
                </div>
                <div class="about-form col-sm field-right">
                    <input type="text" class="form-control" name="name" placeholder="Nazwa" required>
                </div>
                <div class="about-form col-2 field-right">
                    <input type="number" class="form-control" name="level" placeholder="Poziom" required>
                </div>
                <div class="text-center col-2">
                    <button type="submit">Dodaj</button>
                </div>
            </div>
        </form>
        <br>

        <div class="row skills-content">

            <div class="col-lg-6">
                <c:forEach items="${leftSkills}" var="skill">

                    <div class="progress">
                        <span class="skill">${skill.name} <i class="val">${skill.level}%</i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${skill.level}"
                                 aria-valuemin="0"
                                 aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="row">
                        <form method="post" action='<c:url value="/addSkill"/>' class="about-form col-9">
                            <input type="number" name="id" value="${skill.id}" class="visually-hidden"/>
                            <input type="number" name="aboutMe" value="${aboutMe.id}" class="visually-hidden"/>
                            <div class="row">
                                <div class="about-form col-sm field-right">
                                    <input type="text" class="form-control" name="name" value="${skill.name}">
                                </div>
                                <div class="about-form col-2 field-right">
                                    <input type="number" class="form-control" name="level" value="${skill.level}">
                                </div>
                                <div class="text-center col-2">
                                    <button type="submit">Upd</button>
                                </div>
                            </div>
                        </form>
                        <form method="post" action='<c:url value="/editAbout/${skill.id}"/>' class="about-form col-3">
                            <div class="text-center">
                                <button type="submit" class="delete">
                                    Del
                                </button>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>


            <div class="col-lg-6">

                <c:forEach items="${rightSkills}" var="skill">
                    <div class="progress">
                        <span class="skill">${skill.name} <i class="val">${skill.level}%</i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${skill.level}"
                                 aria-valuemin="0"
                                 aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="row">
                        <form method="post" action='<c:url value="/addSkill"/>' class="about-form col-9">
                            <input type="number" name="id" value="${skill.id}" class="visually-hidden"/>
                            <input type="number" name="aboutMe" value="${aboutMe.id}" class="visually-hidden"/>
                            <div class="row">
                                <div class="about-form col-sm field-right">
                                    <input type="text" class="form-control" name="name" value="${skill.name}">
                                </div>
                                <div class="about-form col-2 field-right">
                                    <input type="number" class="form-control" name="level" value="${skill.level}">
                                </div>
                                <div class="text-center col-2">
                                    <button type="submit">Upd</button>
                                </div>
                            </div>
                        </form>
                        <form method="post" action='<c:url value="/editAbout/${skill.id}"/>' class="about-form col-3">
                            <div class="text-center">
                                <button type="submit" class="delete">
                                    Del
                                </button>
                            </div>
                        </form>
                    </div>

                </c:forEach>

            </div>


        </div>


    </div><!-- End Skills -->


</div><!-- End About Section -->


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>


<%@include file="../dynamics/javaScript.jspf" %>

</body>

</html>