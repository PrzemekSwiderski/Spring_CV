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

<div id="resume" class="resume">
    <div class="container">

        <div class="section-title">
            <h2>CV</h2>

            <p>Sprawdź moje Curriculum Vitae</p>
            <sec:authorize access="hasAnyAuthority('ADMIN')">
                <span class="about-edit" style="margin-left: 660px"><a href='<c:url value="/editResume/resume"/>'>(edit) </a> </span>
            </sec:authorize>

        </div>

        <div class="row">
            <div class="col-lg-6">
                <h3 class="resume-title">Sumary</h3>
                <div class="resume-item pb-0">
                    <h4>Przemysław Świderski</h4>
                    <p><em>${cv.summary}</em></p>
                    <p>
                    <ul>
                        <li>${aboutMe.city}</li>
                        <li>${aboutMe.phone}</li>
                        <li>${aboutMe.email}</li>
                    </ul>
                    </p>
                </div>
                <h3 class="resume-title">Education</h3>
                <c:forEach items="${education}" var="edu">
                    <div class="resume-item">
                        <h4>${edu.name}</h4>
                        <h5>${edu.begin} - ${edu.finished}</h5>
                        <p><em>${edu.nameOfSchool}</em></p>
                        <p>${edu.description}</p>
                    </div>
                </c:forEach>

            </div>
            <div class="col-lg-6">
                <h3 class="resume-title">Professional Experience</h3>
                <c:forEach items="${experience}" var="exp">
                    <div class="resume-item">
                        <h4>${exp.jobName} </h4>
                        <h5>${exp.begin} - ${exp.finished} <c:if test="${exp.finished eq null || exp.finished eq ''}"> Obecnie</c:if></h5>
                        <p><em>${exp.firm} </em></p>
                        <p>
                        <ul>
                            <c:forEach items="${exp.tasks}" var="task">
                                <li>${task.description}</li>
                            </c:forEach>
                        </ul>
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div><!-- End Resume Section -->


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>


<%@include file="../dynamics/javaScript.jspf" %>

</body>

</html>