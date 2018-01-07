<%-- 
    Document   : Footer
    Created on : Dec 3, 2017, 4:47:43 PM
    Author     : ritheenhep
--%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <div class="col-md-12 logo"> </div>
        <div class="btn-group dropdown" id="nav">
            <sec:authorize access="hasRole('ROLE_USER')">
                <button class="" id="dropdown" type="button" data-toggle="dropdown">&#9776; 
                    </button>
                <ul class="dropdown-menu" id="dropdown">
                    <li>
                        <div class="col-sm-2 align-top " id="home">
                            <a href="${pageContext.request.contextPath}/displayHomePage"><span class="glyphicon glyphicon-home"></span></a>
                        </div>
                    </li>
                    <li>
                        <div class="col-sm-2 align-top " id="home">
                            <a  href="${pageContext.request.contextPath}/displayAboutUsPage"> About Us</a>
                        </div>
                    </li>
                    <li> <div class="col-sm-2 align-top " id="news">
                            <a  href="${pageContext.request.contextPath}/displayNewsFeedPage">News</a>
                        </div></li>
                    <li><div class="col-sm-2 align-top " id="blog">
                            <a  href="${pageContext.request.contextPath}/displayNewPostPage">Posts</a>
                        </div></li>
                    <li>
                        <div class="col-sm-2 align-top " id="home">
                            <a href="${pageContext.request.contextPath}/displayRegistrationForm"><span class="glyphicon glyphicon-user"></span> Sign up</a>
                        </div>
                    </li>
                    <li> <div class="col-sm-2 align-top " id="log-in">
                            <a  href="${pageContext.request.contextPath}/SignInForm"><span class="glyphicon glyphicon-log-in"></span> Sign In</a>
                        </div></a></li>
                    <li> <div class="col-sm-2 align-top " id="log-in">
                            <a  href="${pageContext.request.contextPath}/displayAdminPage">Admin</a>
                        </div></a></li>
                </ul>
            </sec:authorize>
        </div>
        <hr class="hr">


    </body>
</html>
