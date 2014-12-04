<%-- 
    Document   : displayBook
    Created on : 2014-7-10, 12:31:36
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
        <h1>All Books</h1>

        <table>
            <thead>
                <tr>
                    <th>Book ISBN</th>
                    <th>Book Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.books}" var="book">
                    <tr>
                        <c:url value="/deleteBook/" var="deleteURL">
                            <c:param name="ISBN" value="${book.ISBN}"/>
                        </c:url>
                        <c:url value="/updateBook/" var="updateURL">
                            <c:param name="ISBN" value="${book.ISBN}"/>
                        </c:url>
                        <td><em>${book.ISBN}</em></td>
                        <td>${book.name}</td>
                        <td><a href="${updateURL}">Update Book</a></td>
                        <td><a href="${deleteURL}">Delete Book</a></td>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
        <br>
        <a href="<c:url value="/index.jsp"/>">Back to HomePage</a>
    </body>
</html>
