<%-- 
    Document   : deleteBook
    Created on : 2014-7-11, 17:48:14
    Author     : Tianyang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete Book</h1>
        <sql:update dataSource="jdbc/testSource3" sql="delete from Book where ISBN = ?">
            <sql:param value="${param.ISBN}"></sql:param>
        </sql:update>
        <%--
        
        <sql:update dataSource="jdbc/week2" sql="delete from Customers where customerNumber = ?">
            <sql:param value="${param.customerNumber}"></sql:param>
        </sql:update>
        
        <c:redirect url="/customers.jsp"></c:redirect>
        
        --%>
        <c:redirect url="/showBook/"></c:redirect>
    </body>
</html>
