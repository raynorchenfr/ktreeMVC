<%-- 
    Document   : updateform
    Created on : 2014-7-14, 16:43:18
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
        <c:if test="${not empty violations}">
            <span style="color: red;">
                <ul>
                    <c:forEach items="${violations}" var="violation">
                        <li>${violation.message}</li>
                        </c:forEach>
                </ul>
            </span>
        </c:if>


        <form action="<c:url value="/updateBook/"/>" method="post">
        <c:set var="isbn" value="${param.ISBN}"/> 
            <fieldset>
                <c:choose>
                    <c:when test="${not empty isbn}">
                        <h2>Update Book Form</h2>
                    </c:when>
                </c:choose>

                <div>
                    <label for="ISBN">Book ISBN:</label>
                    <input type="text" id="ISBN" name="ISBN" value="${isbn}" ${not empty isbn ? 'readonly="readonly"' : ''}>
                </div>
                <div>
                    <label for="Name">Book Name:</label>
                    <input type="text" id="Name" name="Name" value="${book.name}">
                </div>
                <input type="submit" value="submit"/>
                <a href="<c:url value="showBook/"/>">Back to Table</a>
    </body>
</html>
