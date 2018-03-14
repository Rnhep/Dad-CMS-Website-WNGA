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
       <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
    </head>
    <body> 
        

        <div class="flex-container ">
            <div>  <a href="${pageContext.request.contextPath}/home">Home</a></div>
            <div>  <a  href="${pageContext.request.contextPath}/aboutUs"> About Us</a></div>
            <div>  <a  href="${pageContext.request.contextPath}/newsFeed">News</a></div> 
            <div>  <a  href="${pageContext.request.contextPath}/displayPost">Posts</a></div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div >
                    <a  href="${pageContext.request.contextPath}/admin">Admin</a>
                </div>
            </sec:authorize>
        </div>
        <div class="flex-signIn ">
          <c:if test="${empty pageContext.request.userPrincipal.name }">
            <div>  <a  href="${pageContext.request.contextPath}/signIn">Sign In</a></div>
          
            <div>  <a  href="${pageContext.request.contextPath}/signUp">Sing Up</a></div>
          </c:if>
            <c:if test="${ pageContext.request.userPrincipal.name != null}">
            <div> <a  href="<c:url value="/j_spring_security_logout"/>"> Sign Out</a> </div>
            </c:if>
            
            <c:if test="${!empty pageContext.request.userPrincipal.name}">
            <small class="username"> 
                <c:if test="${ pageContext.request.userPrincipal.name != null}">
                    Hello : ${pageContext.request.userPrincipal.name} |
                    <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a>

                </c:if>
            </small>
           
        </c:if>
        </div>

        

    </body>
</html>
