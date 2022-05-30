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

<!-- ======= Contact Section ======= -->
<div id="contact" class="contact">
    <div class="container">

        <div class="section-title">
            <h2>Contact</h2>
            <p>Contact Me</p>
        </div>

        <div class="row mt-2">

            <div class="col-md-6 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-map"></i>
                    <h3>My Address</h3>
                    <p>${about.city}</p>
                </div>
            </div>

            <div class="col-md-6 mt-4 mt-md-0 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-share-alt"></i>
                    <h3>Social Profiles</h3>
                    <div class="social-links">
                        <a href='<c:url value="https://www.facebook.com/przemek.swiderski/"/>' class="facebook"
                           target="_blank"><i class="bi bi-facebook"></i></a>
                        <a href='<c:url value="https://www.instagram.com/cptcrysis/"/>' class="instagram"
                           target="_blank"><i class="bi bi-instagram"></i></a>
                        <a href='<c:url value="https://www.linkedin.com/in/pswiderski/"/>' class="linkedin"
                           target="_blank"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-envelope"></i>
                    <h3>Email Me</h3>
                    <p>${about.email}</p>
                </div>
            </div>
            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-phone-call"></i>
                    <h3>Call Me</h3>
                    <p>${about.phone}</p>
                </div>
            </div>
        </div>

        <form method="post" action='<c:url value="/sendMail"/>'>
            <div class="row">
                <div class="col-md-12 form-group mt-3 mt-md-0">
                    <input type="email" class="form-control" name="mail" id="email" placeholder="Your Email" required>
                </div>
            </div>
            <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
            </div>
            <div class="form-group mt-3">
                <textarea class="form-control" name="text" rows="5" placeholder="Message" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit">Send Message</button>
            </div>
        </form>


    </div>
</div><!-- End Contact Section -->


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>


<%@include file="../dynamics/javaScript.jspf" %>

</body>

</html>