<%--
  Created by IntelliJ IDEA.
  User: 0085
  Date: 10/24/2019
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hello World Page</title>
    <link href="<c:url value="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>" rel="stylesheet"/>
</head>
<body class="text-center">
    <h1>Welcome</h1>
    <p class="mb-0">${greeting}</p>
    <a href="<c:url value="/logout"/>" class="mt-0">logout</a>
    <br>
    <br>
    <div>
        <h3>View All Informations</h3>
        <p>This parts is visible for everyone</p>
    </div>
    <br>
    <div>
        <sec:authorize access="hasRole('ADMIN')">
            <a href="#" class="btn btn-success">Edit this page</a>
            <p class="ml-1">Only visible role with ADMIN</p>
        </sec:authorize>
    </div>
    <br>
    <div>
        <sec:authorize access="hasRole('ADMIN') and hasRole('DBA')">
            <a href="#" class="btn btn-danger">Start backup</a>
            <p class="ml-1">Visible both ADMIN and DBA role</p>
        </sec:authorize>
    </div>


    <script src="<c:url value="/webjars/jquery/3.3.1-1/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/popper.js/1.14.3/popper.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"/>"></script>
</body>
</html>
