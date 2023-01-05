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
    <div class="container">
        <h1 class="text-primary">Book Club</h1>
        <hr>
        <p>A place for friends to share thoughts on books.</p>
        <hr>
        <div class="d-flex justify-content-center align-items-center flex-column">
            <div class="d-flex flex-column ">
                <form:form action="/register" method="post" modelAttribute="newUser" >
                    <div>
                        <form:label path="name">Name: </form:label>
                        <form:errors path="name"/>
                        <form:input path="name"/>
                    </div>
                    <div>
                        <form:label path="email">Email: </form:label>
                        <form:errors path="email"/>
                        <form:input path="email"/>
                    </div>
                    <div>
                        <form:label path="password">Password: </form:label>
                        <form:errors path="password"/>
                        <form:input path="password" type="password"/>
                    </div>
                    <div>
                        <form:label path="confirm">Confirm: </form:label>
                        <form:errors path="confirm"/>
                        <form:input path="confirm" type="password"/>
                    </div>
                    <input type="submit" value="Submit">
                </form:form>
            </div>
            <hr>
            <div class="d-flex flex-column justify-content-center align-items-center ">
                <form:form method="post" modelAttribute="newLogin" action="/login">
                    <div>
                        <form:label path="email">Email: </form:label>
                        <form:errors path="email"/>
                        <form:input path="email"/>
                    </div>
                    <div>
                        <form:label path="password">Password: </form:label>
                        <form:errors path="password"/>
                        <form:input path="password" type="password"/>
                    </div>
                    <input type="submit" value="Submit">
                </form:form>
            </div>
        </div>
    </div>

</body>
</html>