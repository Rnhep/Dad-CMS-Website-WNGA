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
    <body>


        <div class="logo"></div>

    <div class="flex-container">
        <div>  <a href="${pageContext.request.contextPath}/home">Home</a></div>
        <div>  <a  href="${pageContext.request.contextPath}/aboutUs"> About Us</a></div>
        <div>  <a  href="${pageContext.request.contextPath}/newsFeed">News</a></div> 
        <div>  <a  href="${pageContext.request.contextPath}/displayPost">Posts</a></a></div>
    </div>
    <div class="flex-signIn">
        
        <div>  <a  href="${pageContext.request.contextPath}/newsFeed">Sign In</a></div> 
        <div>  <a  href="${pageContext.request.contextPath}/displayPost">Sing Up</a></a></div>
    </div>
    <hr class="header-Hr">


</body>
</html>
