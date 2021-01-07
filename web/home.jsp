<%-- 
    Document   : home
    Created on : Jan 7, 2021, 10:27:53 AM
    Author     : thaid
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:set var="accountValue" value="${sessionScope.ACCOUNT}"/>
        <c:if test="${not empty accountValue}">
            <c:out value="${sessionScope.ACCOUNT}"/>
        </c:if>
        <c:if test="${empty accountValue}">
            <h2>xxx</h2>
        </c:if>
    </body>
</html>
