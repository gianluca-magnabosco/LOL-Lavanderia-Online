<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
    if (session.getAttribute("user") == null) {
        response.sendRedirect("/index.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
</head>
<body>
    <div style="text-align: center">
        <h1>Página Principal</h1>
        <b>${user.fullName} (${user.email})</b>
        <br/><br/>
        <a href="logout">Logout</a>
    </div>
</body>
</html>