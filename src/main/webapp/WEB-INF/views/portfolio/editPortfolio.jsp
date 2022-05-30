<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamics/css.jspf" %>

<body>

<!-- ======= Header ======= -->
<%@include file="../dynamics/header.jspf" %>
<!-- End Header -->


<br>
<br>
<br>
<br>
<br>

<div id="portfolio" class="portfolio">
    <div class="container">

        <div class="section-title">
            <h2>Portfolio</h2>
            <p>My Works</p>
        </div>


        <div class="row portfolio-container">
            <c:forEach var="portfolio" items="${portfolios}">
                <div class="col-lg-4 col-md-6 portfolio-item ">
                    <div class="portfolio-wrap">
                        <img src='<c:url value="/files/${portfolio.picture.id}"/>' class="img-fluid" alt="">
                        <div class="portfolio-info">
                            <h4>${portfolio.name}</h4>
                            <div class="portfolio-links">
                                <a href='<c:url value="/files/${portfolio.picture.id}"/>'
                                   data-gallery="portfolioDetailsGallery"
                                   data-glightbox="type: external" class="portfolio-details-lightbox" title="App 1"><i
                                        class="bx bx-plus"></i></a>
                                <a href='<c:url value="${portfolio.git}"/>' target="_blank"
                                ><i class="bx bx-link"></i></a>
                                <form action='<c:url value="/editPortfolio/deletePortfolio/${portfolio.id}"/>' method="post" id="form-portfolio-${portfolio.id}">
                                <a href='#'><i class="bx bi-archive delete-portfolio" id="delete-portfolio-${portfolio.id}"></i></a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <form action='<c:url value="/editPortfolio/uploadImg"/>' method="post"
              enctype="multipart/form-data">
            <div class="row">
                <div class="portfolio-form col-3 field-right">
                    <input type="text" class="form-control" name="portfolio.name" placeholder="name">
                </div>
                <div class="portfolio-form col-3 field-right">
                    <input type="text" class="form-control" name="portfolio.git" placeholder="git">
                </div>

                <div class="portfolio-form col-4 field-right">
                    <input type="file" class="form-control" name="file" accept="image/*" >
                </div>
                <div class="text-center portfolio-form col-2">
                    <button type="submit">Dodaj</button>
                </div>
            </div>
        </form>


        <br>
        <br>
        <br>

    </div>
</div>


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>


<%@include file="../dynamics/javaScript.jspf" %>

</body>

</html>