<%-- 
    Document   : Footer
    Created on : Dec 3, 2017, 4:47:43 PM
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
        <div class="col-md-12 logo"> 
           
                <c:if test="${!empty pageContext.request.userPrincipal.name}">
                    <small class="username"> 
                        <c:if test="${ pageContext.request.userPrincipal.name != null}">
                            Hello : ${pageContext.request.userPrincipal.name} |
                            <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a>
                        
                    </c:if>
                            </small>
                </c:if>
      
        </div>
        <div class="btn-group dropdown" id="nav">

            <button class="" id="dropdown" type="button" data-toggle="dropdown">&#9776; 
            </button>
            <ul class="dropdown-menu" id="dropdown">
                <li>
                    <div class="col-sm-2 align-top " id="home">
                        <a href="${pageContext.request.contextPath}/home"><span class="glyphicon glyphicon-home"></span></a>
                    </div>
                </li>
                <li>
                    <div class="col-sm-2 align-top " id="home">
                        <a  href="${pageContext.request.contextPath}/aboutUs"> About Us</a>
                    </div>
                </li>
                <li> <div class="col-sm-2 align-top " id="news">
                        <a  href="${pageContext.request.contextPath}/newsFeed">News</a>
                    </div></li>
                <li><div class="col-sm-2 align-top " id="blog">
                        <a  href="${pageContext.request.contextPath}/displayPost">Posts</a>
                    </div></li>
                <li>
                    <div class="col-sm-2 align-top " id="home">
                        <a href="${pageContext.request.contextPath}/signUp"><span class="glyphicon glyphicon-user"></span> Register</a>
                    </div>
                </li>
                <li> <div class="col-sm-2 align-top " id="log-in">
                        <a  href="${pageContext.request.contextPath}/signIn"><span class="glyphicon glyphicon-log-in"></span> Sign In</a>
                    </div></a></li>
                    <c:if test="${ pageContext.request.userPrincipal.name != null}">
                    <li> <div class="col-sm-2 align-top " id="log-in">
                            <a  href="<c:url value="/j_spring_security_logout" />" ><span class="glyphicon glyphicon-log-out"></span> Sign Out</a>
                        </div></a></li>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li> <div class="col-sm-2 align-top " id="log-in">
                            <a  href="${pageContext.request.contextPath}/admin">Admin</a>
                        </div></a></li>
                    </sec:authorize>
            </ul>

        </div>
        <hr class="hr">


    </body>
</html>
