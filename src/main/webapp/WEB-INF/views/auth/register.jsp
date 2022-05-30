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
<div id="register" class="login">
    <div class="container">

        <div class="section-title">
            <h2>Autoryzacja</h2>
            <p>Zarejestruj się</p>
        </div>

        <form action='<c:url value="/register"/>' method="post" class="login-form mt-4">

            <div class="form-group mt-3">
                <label >Adres email*</label>
                <input type="text" name="mail" class="form-control" id="reg-mail" placeholder="adres email" required>
            </div>
            <div class="form-group mt-3">
                <label>Hasło*</label>
                <input type="password" class="form-control reg-password" name="password" id="reg-password" placeholder="hasło" required>
            </div>

            <div class="form-group mt-3">
                <label >Powtórz hasło*</label>
                <input type="password" class="form-control" id="reg-repeat-password" placeholder="hasło" required>
            </div>
           <span id="reg-message"></span>
            <div class="form-group mt-3">
                <label>Imię*</label>
                <input type="text" class="form-control" name="firstname" id="reg-firstname" placeholder="Imię" required>
            </div>
            <div class="form-group mt-3">
                <label>Nazwisko</label>
                <input type="password" class="form-control" name="lastname" id="reg-lastname" placeholder="Nazwisko">
            </div>
            <br>
            <span>* - wymagane pola</span>
<%--            <div class="form-group mt-3">
                <label>Zdjęcie</label>
                <input type="file" class="form-control" name="image"  placeholder="Nazwisko">
            </div>--%>
            <br>
            <div class="text-center">
                <button class="reg-hide-disable" type="submit" id="reg-button">Zarejestruj się</button>
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