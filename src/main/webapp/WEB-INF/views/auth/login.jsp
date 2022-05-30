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
<div id="login" class="login">
    <div class="container">

        <div class="section-title">
            <h2>Autoryzacja</h2>
            <p>Zaloguj się</p>
        </div>

        <form action='<c:url value="/login"/>' method="post" class="login-form mt-4">

            <div class="form-group mt-3">
                <label for="log-mail">Email</label>
                <input type="text" name="email" class="form-control" id="log-mail" placeholder="adres email" required>
            </div>
            <div class="form-group mt-3">
                <label for="log-password">Hasło</label>
                <input type="password" class="form-control" name="password" id="log-password" placeholder="hasło"
                       required>
            </div>

            <br>
            <div class="d-flex justify-content-center">
                <label>
                    <input name="remember-me" type="checkbox">
                    Zapamiętaj mnie
                </label>
            </div>
            <br>


            <div class="text-center">
                <button type="submit">Zaloguj</button>
                <button type="button"><a class="register" href='<c:url value="/register"/>'>Rejestracja</a></button>
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