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
    <h1>Add a Book to Your Shelf!</h1>
    <hr>
    <form:form method="post" modelAttribute="book" action="/books/new">
        <div>
            <form:label path="title">Title</form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
        </div>
        <div>
            <form:label path="author">Author</form:label>
            <form:errors path="author"/>
            <form:input path="author"/>
        </div>
        <div>
            <form:label path="thoughts">My thoughts</form:label>
            <form:errors path="thoughts"/>
            <form:textarea path="thoughts"/>
        </div>
<%--        <div>--%>
<%--            <form:select path="user">--%>
<%--                <c:forEach items="${users}" var="currentUser">--%>
<%--                    <option value="${currentUser.id}"><c:out value="${currentUser.name}"/></option>--%>
<%--                </c:forEach>--%>
<%--            </form:select>--%>
<%--        </div>--%>
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>