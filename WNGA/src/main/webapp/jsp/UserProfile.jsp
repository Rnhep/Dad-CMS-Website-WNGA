<%-- 
    Document   : UserPorfile
    Created on : Jan 13, 2018, 4:44:54 PM
    Author     : ritheenhep
--%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>WNGA Your Profile</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header"></div>
                    <div class="container user-info">
                        <div class="container profile">
                            <p> ${msg} </p>
                            <img src="${currentLogInUser.photo}"/>
                            <p><a href="updateProfileForm?userId=${currentLogInUser.userId}">
                                    <input  type="button" class="form-control"  value="Update Profile"/></a></p>
                            <hr></hr>
                            <p> User Name: ${currentLogInUser.userName}</p>
                            <hr></hr>
                            <p> Member Since: 
                                <fmt:parseDate pattern="yyyy-MM-dd" value="${currentLogInUser.joinDate}" var="joindate"/>
                                <fmt:formatDate value="${joindate}" pattern="MMM-dd-yyyy"/></p>
                            <hr></hr>
                            <p>   First Name: ${currentLogInUser.firstName}  </p>
                            <hr></hr>
                            <p>   Last Name: ${currentLogInUser.lastName} </p>
                            <hr></hr>
                            <p>Email:  ${currentLogInUser.email}</p>

                        </div>
                    </div>

                    <hr></hr>
                    <footer id="footer"></footer>
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify-jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                </body>
                </html>
