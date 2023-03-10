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
    <div class="d-flex flex-row align-items-center justify-content-center">
        <div class="p-5">
            <h1>Welcome, <c:out value="${user.getName()}"/></h1>
            <p>Books from everyone's shelves: </p>
        </div>
        <div class="p-5">
            <a href="/logout">logout</a>
            <a href="/books/new">+ Add a book to my shelf</a>
        </div>
    </div>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Title</th>
                <th scope="col">Author Name</th>
                <th scope="col">Posted By</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td><c:out value="${book.id}"/></td>
                    <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                    <td><c:out value="${book.author}"/></td>
                    <td><c:out value="${book.postedBy}"/></td>
                    <c:if test="${user.equals(book.user)}"><td> <a href="/books/${book.id}/edit">edit</a> <form:form action="/delete/${book.id}" method="delete"><input type="submit" value="Delete"></form:form></c:if>
                    <c:if test="${!user.equals(book.user) && !user.equals(book.borrower)}"><td><a href="/books/borrow/${book.id}">borrow</a> </td></c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <hr>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Title</th>
            <th scope="col">Author Name</th>
            <th scope="col">Posted By</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${user.borrowedBooks}" var="book">
            <tr>
                <td><c:out value="${book.id}"/></td>
                <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                <td><c:out value="${book.author}"/></td>
                <td><c:out value="${book.postedBy}"/></td>
                <td><a href="/books/return/${book.id}">return</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>