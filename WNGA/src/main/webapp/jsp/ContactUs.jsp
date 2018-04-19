<%-- 
    Document   : UserRegistrationForm
    Created on : Dec 30, 2017, 2:31:32 PM
    Author     : ritheenhep
--%>

<%-- 
    Document   : EditContent
    Created on : Dec 23, 2017, 11:35:20 PM
    Author     : ritheenhep
--%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Contact Us </title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body > 
                    <div id="header-mobile"></div>
                    <div class="logo logo-hide col-md-12">
                    </div>
                    <div class="col-md-10" id="header-desktop"></div>
                    <c:forEach var="user" items="${allUsers}">
                                <c:if test="${pageContext.request.userPrincipal.name == user.userName}">
                                    <div id="userImg-inNav">
                                        <img src="${user.photo}"/>
                                        <p>Hello: ${pageContext.request.userPrincipal.name} |
                                            <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a></p>
                                    </div>
                                </c:if>
                            </c:forEach>
                    
                    <div class="container col-md-12 contactUs-Section">

                        <h1> If you have any queries, or wants to help please contact one of the following members 
                        </h1>
                        <h1>
                            password forgotten please contact one of the following members 
                        </h1>
                        <h1>**Please allows 24 to 48 hrs for admins to reset your password. </h1>

                        <div class=" contact0">
                            <h1>Site Related: contact</h1>
                            <h1> ritheenhep@gmail.com</h1>
                        </div>

                        <div class="contact1">
                            <h1> Information about the organization </h1>
                            <h1> Sopha Nhep: sophanhep@hotmail.com</h1>
                            <h1>Sothea Pouch:  ssek71@gmail.com</h1>
                            <h1>Leoung Khi: lkangkor@gmail.com</h1> 
                        </div>

                    </div>
                    <hr class="col-md-10 footerLine"></hr>

                    <footer class="col-md-12" id="footer"></footer>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>                  
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify-jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                </body>
                </html>
