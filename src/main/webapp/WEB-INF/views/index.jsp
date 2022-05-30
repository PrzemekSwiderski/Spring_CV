<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="dynamics/css.jspf" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>

<!-- ======= Header ======= -->
<!-- End Header -->
<header id="header" >
    <div class="container section-show main">

        <h1><a href='<c:url value="/"/>'>Przemek Świderski</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.jsp" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
        <h2>Jestem <span>Java Developerem</span>  z Polski</h2>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link" href='<c:url value="/"/>'>Home</a></li>
                <li><a class="nav-link" href='<c:url value="/about"/>'>O mnie</a></li>
                <li><a class="nav-link" href='<c:url value="/resume"/>'>CV</a></li>
               <%-- <li><a class="nav-link" href='<c:url value="/services"/>'>Usługi</a></li>--%>
                <li><a class="nav-link" href='<c:url value="/portfolio"/>'>Portfolio</a></li>
                <li><a class="nav-link" href='<c:url value="/contact"/>'>Kontakt</a></li>
                <sec:authorize access="isAnonymous()">
                    <li><a class="nav-link" href='<c:url value="/login"/>'>Zaloguj</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="menu-profile">
                        <li><a id="menu-profile-text">Witaj ${user.getFirstname()}</a></li>

                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" id="menu-profile-box"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profil
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href='<c:url value="/logout"/>'>
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </div>

                </sec:authorize>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

        <div class="social-links">
            <a href='<c:url value="https://www.facebook.com/przemek.swiderski/"/>' target="_blank"><i class="bi bi-facebook"></i></a>
            <a href='<c:url value="https://www.instagram.com/cptcrysis/"/>' target="_blank"><i class="bi bi-instagram"></i></a>
            <a href='<c:url value="https://www.linkedin.com/in/pswiderski/"/>' target="_blank"><i class="bi bi-linkedin"></i></a>
        </div>

    </div>
</header>


<div class="credits">
    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
</div>

<%@include file="dynamics/javaScript.jspf" %>

</body>

</html>