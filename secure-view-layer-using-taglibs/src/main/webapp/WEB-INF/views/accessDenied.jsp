<%--
  Created by IntelliJ IDEA.
  User: 0085
  Date: 10/24/2019
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Access Denied</title>
</head>
<body>
    <h1>Dear ${user}, you are not allowed enter this page</h1>
    <<a href="<c:url value="/logout"/>">logout</a>
</body>
</html>
