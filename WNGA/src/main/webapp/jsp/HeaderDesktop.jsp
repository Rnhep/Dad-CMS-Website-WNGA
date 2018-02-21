<%-- 
    Document   : HeaderDesktop
    Created on : Feb 19, 2018, 2:44:04 PM
    Author     : ritheenhep
--%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
    </head>
    <body>  <c:if test="${!empty pageContext.request.userPrincipal.name}">
            <small class="username"> 
                <c:if test="${ pageContext.request.userPrincipal.name != null}">
                    Hello : ${pageContext.request.userPrincipal.name} |
                    <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a>

                </c:if>
            </small>
        </c:if>

        <div class="flex-container col-md-6">
            <div>  <a href="${pageContext.request.contextPath}/home">Home</a></div>
            <div>  <a  href="${pageContext.request.contextPath}/aboutUs"> About Us</a></div>
            <div>  <a  href="${pageContext.request.contextPath}/newsFeed">News</a></div> 
            <div>  <a  href="${pageContext.request.contextPath}/displayPost">Posts</a></a></div>
        </div>
        <div class="flex-signIn col-md-">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div >
                    <a  href="${pageContext.request.contextPath}/admin">Admin</a>
                </div>
            </sec:authorize>
            <div>  <a  href="${pageContext.request.contextPath}/newsFeed">Sign In</a></div> 
            <div>  <a  href="${pageContext.request.contextPath}/displayPost">Sing Up</a></a></div>
        </div>



    </body>
</html>
