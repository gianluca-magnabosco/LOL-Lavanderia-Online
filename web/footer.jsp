<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer id="footerzera" class="bg-light text-center text-white">
    <div class="container p-4 pb-0">

        <section class="mb-4">
            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #3b5998;"
              href="#!"
              role="button"
            >
                <i class="fab fa-facebook-f"></i>
            </a>


            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #55acee;"
              href="#!"
              role="button"
            >
                <i class="fab fa-twitter"></i>
            </a>

            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #ac2bac;"
              href="#!"
              role="button"
            >
                <i class="fab fa-instagram"></i>
            </a>

            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #0082ca;"
              href="#!"
              role="button"
            >
                <i class="fab fa-linkedin-in"></i>
            </a>

            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #333333;"
              href="https://github.com/gianluca-magnabosco/LOL-Lavanderia-Online/"
              target="_blank"
              role="button"
            >
                <i class="fab fa-github"></i>
            </a>
        </section>
    </div>

    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2023 Copyright:
        <a class="text-white" href="<c:url value='/index'/>">LOL - Lavanderia On-line</a>
        <br/>
        <p>
            Em caso de problemas contactar o administrador: <a href="mailto:${configuracao.email}" target="_blank">${configuracao.email}</a>
        </p>
    </div>
</footer>

<style>
    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    footer {
        margin-top: auto;
    }
</style>
