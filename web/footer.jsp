<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">

<footer id="footerzera" class="bg-light text-center text-white">
    <div class="container p-4 pb-0">
        <section class="mb-4">
            <a class="btn btn-primary btn-floating m-1 facebook" href="#" role="button">
                <i class="fab fa-facebook-f"></i>
            </a>

            <a class="btn btn-primary btn-floating m-1 twitter" href="#" role="button">
                <i class="fab fa-twitter"></i>
            </a>

            <a class="btn btn-primary btn-floating m-1 instagram" href="#!" role="button">
                <i class="fab fa-instagram"></i>
            </a>

            <a class="btn btn-primary btn-floating m-1 linkedin" href="#" role="button">
                <i class="fab fa-linkedin-in"></i>
            </a>

            <a class="btn btn-primary btn-floating m-1 github" href="https://github.com/gianluca-magnabosco/LOL-Lavanderia-Online/" target="_blank" role="button">
                <i class="fab fa-github"></i>
            </a>
        </section>
    </div>

    <div class="text-center p-3 footerText">
        © 2023 Copyright:
        <a class="text-white" href="<c:url value='/index'/>">LOL - Lavanderia On-line</a>
        <br/>
        <p>
            Em caso de problemas contactar o administrador: <a href="mailto:${configuracao.email}" target="_blank">${configuracao.email}</a>
        </p>
    </div>
</footer>
