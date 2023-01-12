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
    <title>Book Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <a href="/dashboard">back to the shelves</a>
    <hr>
    <h1>Change your Entry</h1>
    <form:form method="put" action="/books/${book.id}/edit" modelAttribute="book">
        <div>
            <form:label path="title">Title</form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
        </div>
        <div>
            <form:label path="author">Author</form:label>
            <form:errors path="author"/>
            <form:input path="author"/>
        </div>        <div>
        <form:label path="thoughts">My thoughts</form:label>
        <form:errors path="thoughts"/>
        <form:input path="thoughts" type="textarea"/>
    </div>
        <input type="submit" value="Submit">
    </form:form>
    <hr>
    <form:form action="/delete/${book.id}" method="delete">
        <input type="submit" value="Delete">
    </form:form>
</body>
</html>