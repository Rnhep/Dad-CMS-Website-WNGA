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
           <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <title>Home Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 
                    <div id="header"></div>

                    <div class="container-fluid" id="events">
                        <p> Up coming Events: </p>
                        <p><c:out value="${event.title}"/></p>
                        <p><c:out value="${event.content}"/></p>
                        <hr>
                    </div>

                    <c:forEach var="latestPost" items="${displayLatestPost}">
                        <div class=" container-fluid pre-posts">
                            <p> Posted by|<span class="blue"><c:out value="${latestPost.user.userName}"/>
                                    | ${latestPost.publishDate}|<br>
                                </span>
                                <c:out value="${latestPost.content}"/>
                            </p>
                        </div>
                    </c:forEach>

                    <div class="container-fluid box" id="education">
                        <div class="container">
                            <p><a  href="${pageContext.request.contextPath}/displayContentsPage">
                                    <c:out value="${education.title}"/>
                                </a>
                            </p>
                            <p>
                                <c:out value="${education.content}"/>
                            </p>
                        </div> 
                    </div>

                    <!--            for health section.-->
                    <div class="container-fluid box" id="health">
                        <div class="container">
                            <p><a  href="${pageContext.request.contextPath}/displayContentsPage">
                                    <c:out value="${health.title}"/>
                                </a>
                            </p>
                            <p>
                                <c:out value="${health.content}"/>
                            </p>
                            <p>
                                <a href="${pageContext.request.contextPath}/">
                                    read more
                                </a>
                            </p>
                        </div>
                    </div>

                    <div class="container-fluid box" id="humanRight">
                        <div class="container">
                            <p> <a href="${pageContext.request.contextPath}/displayContentsPage">  
                                    <c:out value="${humanRight.title}"/>
                                </a>
                            </p>


                            <p><c:out value="${humanRight.content}"/></p>

                            <p>
                                <a href="${pageContext.request.contextPath}/">
                                    read more
                                </a>
                            </p>
                        </div>
                    </div>

                    <div class="container-fluid box" id="ppa">
                        <p><a href="${pageContext.request.contextPath}/displayContentsPage">
                                <c:out value="${PPA.title}"/>
                            </a>
                        </p>
                        <p>
                            <c:out value="${PPA.content}"/>
                            <p>
                                <p> <a href="${pageContext.request.contextPath}/">
                                        read more
                                    </a>
                                </p>
                                </div>







                                <hr>             
                                    <footer id="footer"></footer>

                                    <!-- Placed at the end of the document so the pages load faster -->
                                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                                    </body>
                                    </html>

