<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Read Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <a href="/dashboard">back to the shelves</a>
    <h1><c:out value="${book.title}"/></h1>
    <h2><c:out value="${book.postedBy}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/>. </h2>
    <h3>Here are <c:out value="${book.postedBy}"/>'s thoughts:</h3>
    <p><c:out value="${creator}"/></p>
    <hr>
    <p><c:out value="${book.thoughts}"/></p>
    <hr>
</body>
</html>
