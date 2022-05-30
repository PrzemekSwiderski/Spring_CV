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
        </div>

        <div class="row">
            <div class="col-lg-6">
                <h3 class="resume-title">Sumary</h3>
                <div class="resume-item pb-0">
                    <h4>Przemysław Świderski</h4>
                    <form action='<c:url value="/editResume/editSummary"/>' method="post" class="resume-form">
                        <input type="number" name="id" value="${cv.getId()}" class="visually-hidden"/>
                        <div class="resume-form mt-9">
                            <label>Edytuj podsumowanie</label>
                            <textarea class="col-12" name="summary" required>${cv.summary}</textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit">Zaktualizuj</button>
                        </div>
                    </form>
                </div>
                <h3 class="resume-title">Education</h3>
                <form method="post" action='<c:url value="/editResume/addEducation"/>' class="resume-form">
                    <input type="number" name="curriculum" value="${cv.getId()}" class="visually-hidden"/>

                    <div class="resume-item">
                        <h4>Nowy wpis o edukacji</h4>
                        <div class="resume-form col-sm field-right">
                            <label class="col-12"> Nazwa wpisu o edukacji
                                <input type="text" class="form-control" name="name" placeholder="Nazwa" required>
                            </label>
                        </div>
                        <div class="row">
                            <div class="resume-form col-6 field-right">
                                <label class="col-12">Data rozpoczęcia
                                    <input type="date" class="form-control" name="begin" placeholder="Rozpoczęcie nauki"
                                           required>
                                </label>
                            </div>
                            <div class="resume-form col-6 field-right">
                                <label class="col-12"> Data zakończenia
                                    <input type="date" class="form-control" name="finished"
                                           placeholder="Zakończenie nauki">
                                </label>
                            </div>
                        </div>
                        <div class="resume-form col-sm field-right">
                            <label class="col-12"> Nazwa szkoły
                                <input type="text" class="form-control" name="nameOfSchool" placeholder="Nazwa szkoły"
                                       required>
                            </label>
                        </div>
                        <div class="resume-form mt-9">
                            <label>Opis kursu/wykształcenia</label>
                            <textarea class="col-12" name="description" placeholder="Opis kursu/wykształcenia"
                                      required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit">Dodaj</button>
                        </div>
                        <br>
                    </div>

                </form>

                <h3 class="resume-title">Edytuj Edukacje</h3>

                <c:forEach items="${education}" var="edu">
                    <form method="post" action='<c:url value="/editResume/addEducation"/>' class="resume-form"
                          id="form-${edu.id}">
                        <div class="resume-item">
                            <input type="number" name="id" value="${edu.id}" class="visually-hidden"/>
                            <input type="number" name="curriculum" value="${edu.curriculum.id}"
                                   class="visually-hidden"/>

                            <div class="resume-form col-sm field-right">
                                <label class="col-12"> Nazwa wpisu o edukacji
                                    <input type="text" class="form-control" name="name" value="${edu.name}" required>
                                </label>
                            </div>

                            <div class="row">
                                <div class="resume-form col-6 field-right">
                                    <label class="col-12"> Nazwa wpisu o edukacji
                                        <input type="date" class="form-control" name="begin" value="${edu.begin}"
                                               required>
                                    </label>
                                </div>
                                <div class="resume-form col-6 field-right">
                                    <label class="col-12"> Nazwa wpisu o edukacji
                                        <input type="date" class="form-control" name="finished" value="${edu.finished}"
                                               required>
                                    </label>
                                </div>
                            </div>

                            <div class="resume-form col-sm field-right">
                                <label class="col-12"> Nazwa wpisu o edukacji
                                    <input type="text" class="form-control" name="nameOfSchool"
                                           value="${edu.nameOfSchool}" required>
                                </label>
                            </div>

                            <div class="resume-form mt-9">
                                <label>Opis kursu/wykształcenia</label>
                                <textarea class="col-12" name="description"
                                          required>${edu.description}</textarea>
                            </div>
                        </div>
                    </form>
                    <div class="row resume-form">
                        <div class="text-center col">
                            <button type="submit" form="form-${edu.id}">Zaktualizuj</button>
                        </div>

                        <form method="post" action='<c:url value="/editResume/deleteEducation/${edu.id}"/>'
                              class="resume-form col">
                            <input type="number" name="id" value="${edu.id}" class="visually-hidden"/>
                            <div class="text-center">
                                <button type="submit" class="delete">
                                    Usuń
                                </button>
                            </div>
                        </form>
                    </div>
                </c:forEach>
                <br>
                <br>

            </div>
            <div class="col-lg-6">
                <h3 class="resume-title">Professional Experience</h3>

                <form action='<c:url value="/editResume/addExperience"/>' method="post" class="resume-form">
                    <input type="number" name="curriculum" value="${cv.id}" class="visually-hidden"/>
                    <div class="resume-item">
                        <div class="resume-form col-sm field-right">
                            <label class="col-12"> Nazwa stanowiska
                                <input type="text" class="form-control" name="jobName" placeholder="Nazwa stanowiska"
                                       required>
                            </label>
                        </div>
                        <div class="row">
                            <div class="resume-form col-6 field-right">
                                <label class="col-12">Data rozpoczęcia
                                    <input type="date" class="form-control" name="begin" placeholder="Rozpoczęcie pracy"
                                           required>
                                </label>
                            </div>
                            <div class="resume-form col-6 field-right">
                                <label class="col-12"> Data zakończenia
                                    <input type="date" class="form-control" name="finished"
                                           placeholder="Zakończenie pracy" id="expFinished"/>
                                </label>
                            </div>
                        </div>
                        <div class="resume-form col-sm field-right">
                            <label class="col-12"> Nazwa firmy
                                <input type="text" class="form-control" name="firm" placeholder="Nazwa firmy" required>
                            </label>
                        </div>
                           <div class="text-center">
                            <button type="submit" id="expButton">Dodaj</button>
                        </div>
                    </div>
                </form>


                <h3 class="resume-title">Professional Experience</h3>
                <c:forEach items="${experience}" var="exp">
                    <div class="resume-item">
                        <form method="post" action='<c:url value="/editResume/addExperience"/>' class="resume-form"
                              id="exp-${exp.id}">
                            <input type="number" name="id" value="${exp.id}" class="visually-hidden"/>
                            <input type="number" name="curriculum" value="${exp.curriculum.id}"
                                   class="visually-hidden"/>
                            <div class="resume-form col-sm field-right">
                                <label class="col-12">Nazwa stanowiska
                                    <input type="text" class="form-control" name="jobName"
                                           value="${exp.jobName}" required>
                                </label>
                            </div>
                            <div class="row">
                                <div class="resume-form col-6 field-right">
                                    <label class="col-12">Data rozpoczęcia
                                        <input type="date" class="form-control" name="begin" value="${exp.begin}"
                                               required>
                                    </label>
                                </div>
                                <div class="resume-form col-6 field-right">
                                    <label class="col-12"> Data zakończenia
                                        <input type="date" class="form-control" name="finished"
                                               value='<c:out value="${exp.finished}" default="null"/>'>
                                    </label>
                                </div>
                            </div>
                            <div class="resume-form col-sm field-right">
                                <label class="col-12">Nazwa stanowiska
                                    <input type="text" class="form-control" name="firm"
                                           value="${exp.firm}" required>
                                </label>
                            </div>
                        </form>
                        <br>
                        <form method="post" action='<c:url value="/editResume/addTask"/>' class="resume-form">
                            <div class="row">
                                <div class="resume-form col-9">
                                    <input type="number" name="experience" value="${exp.id}" class="visually-hidden"/>
                                    <textarea class="col-12" name="description"
                                              placeholder="Nowe zadanie jakie wykonywałem"
                                              required></textarea>
                                </div>
                                <div class="text-center col-3">
                                    <button type="submit">Dodaj</button>
                                </div>
                            </div>
                        </form>
                        <p>
                        <ul>
                            <c:forEach items="${exp.tasks}" var="task">
                                <li>
                                    <div class="row">
                                        <form action='<c:url value="/editResume/addTask"/>' method="post"
                                              class="resume-form col-10 row">
                                            <input type="number" name="id" value="${task.id}" class="visually-hidden"/>
                                            <input type="number" name="experience" value="${task.experience.id}"
                                                   class="visually-hidden"/>
                                            <textarea class="col-9" name="description"
                                                      required>${task.description}</textarea>
                                            <div class="text-center col-3">
                                                <button type="submit">Upd</button>
                                            </div>
                                        </form>
                                        <form action='<c:url value="/editResume/deleteTask/${task.id}"/>' method="post"
                                              class="resume-form col-2">
                                            <div class="text-center col-2">
                                                <button type="submit" class="delete">
                                                    Usuń
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        </p>

                        <div class="row resume-form">
                            <div class="text-center col-sm">
                                <button type="submit" form="exp-${exp.id}">Zaktualizuj doświadczenie</button>
                            </div>
                            <div class="text-center col-sm">
                                <form method="post" action='<c:url value="/editResume/deleteExperience/${exp.id}"/>'>
                                    <button type="submit" class="delete">
                                        Usuń
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <br>
                <br>
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