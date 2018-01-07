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
             <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
     </head>
                <body> 
                    <div id="header"></div>
                    <div id="up"></div>
                    <div class="container">
                        <div class=" container pre-posts">
                            <p class="upcoming"> Upcoming Events: </p>
                            <p><c:out value="${eventOne.title}"/></p>
                            <p><c:out value="${eventOne.content}"/></p>
                            <hr></hr>
                            <p><c:out value="${eventTwo.title}"/></p>
                            <p><c:out value="${eventTwo.content}"/></p>
                        </div>


                        <hr></hr>

                        <c:forEach var="latestPost" items="${displayLatestPost}">
                            <div class=" container post-preview">
                                <p> Posted by|<span class="blue">
                                        <c:out value="${latestPost.user.userName}"/>
                                        | ${latestPost.publishDate}|<br>
                                    </span>
                                    <p>${latestPost.title}<p/>
                                        <p><a href="${pageContext.request.contextPath}/displayNewPostPage"><c:out value="${latestPost.content}"/></a></p>
                                    </p>
                            </div>
                        </c:forEach>

                        <hr>
                            <div class="container-fluid box" id="education">
                                <div class="container">
                                    <p>
                                        <c:out value="${contentOne.title}"/>
                                    </p>
                                    <p>
                                        <c:out value="${contentOne.content}"/>
                                    </p>
                                </div> 
                            </div>

                            <div class="container-fluid box" id="img">
                                <div class="container">
                                    <p>
                                        reserved for image

                                    </p>

                                </div> 
                            </div>

                            <div class="container-fluid box" id="health">

                                <p>
                                    <c:out value="${contentTwo.title}"/>

                                </p>
                                <p>
                                    <c:out value="${contentTwo.content}"/>
                                </p>
                            </div>


                            <div class="container-fluid box" id="img">
                                <div class="container">
                                    <p>
                                        reserved for image

                                    </p>

                                </div> 
                            </div>


                            <div class="container-fluid box" id="humanRight">
                                <p>
                                    <c:out value="${contentThree.title}"/>

                                </p>
                                <p>
                                    <c:out value="${contentThree.content}"/>
                                </p>

                            </div>

                            <div class="container-fluid box" id="ppa">
                                <p>
                                    <c:out value="${contentFour.title}"/>

                                </p>
                                <p>
                                    <c:out value="${contentFour.content}"/>
                                </p>
                            </div>



                            <div class="container-fluid box" id="img">

                                <p>
                                    reserved for image

                                </p>


                            </div>
                    </div>


                    <hr>             
                        <footer id="footer"></footer>

                        <!-- Placed at the end of the document so the pages load faster -->
                        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>

