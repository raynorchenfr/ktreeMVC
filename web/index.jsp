<%-- 
    Document   : index
    Created on : 2014-7-10, 12:53:49
    Author     : Tianyang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Book Table</h1>
        <li><a href="<c:url value="showBook/"/>">Show Table</a></li>
        <li><a href="<c:url value="/form.jsp"/>">Create Book</a></li>
    </body>
</html>
