<%-- 
    Document   : form
    Created on : 2014-7-11, 11:55:18
    Author     : Tianyang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty violations}">
            <span style="color: red;">
                <ul>
                    <c:forEach items="${violations}" var="violation">
                        <li>${violation.message}</li>
                        </c:forEach>
                </ul>
            </span>
        </c:if>


        <form action="<c:url value="/newBook/"/>" method="post">

            <fieldset>
                <c:choose>
                    <c:when test="${not empty book.ISBN}">
                        <h2>Update Book Form</h2>
                    </c:when>
                    <c:otherwise>
                        <h2>New Book Form</h2>
                    </c:otherwise>
                </c:choose>

                <div>
                    <label for="ISBN">Book ISBN:</label>
                    <input type="text" id="ISBN" name="ISBN" value="${book.ISBN}" ${not empty book.ISBN ? 'readonly="readonly"' : ''}>
                </div>
                <div>
                    <label for="Name">Book Name:</label>
                    <input type="text" id="Name" name="Name" value="${book.name}">
                </div>
                <input type="submit" value="submit"/>
                <a href="<c:url value="showBook/"/>">Back to Table</a>
    </body>
</html>
