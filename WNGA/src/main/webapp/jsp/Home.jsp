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
                                    <p><c:out value="${eventOne.name}"/></p>
                                    <p><c:out value="${eventOne.content}"/></p>
                                    <hr></hr>
                                    <p><c:out value="${eventTwo.name}"/></p>
                                    <p><c:out value="${eventTwo.content}"/></p>
                                </div>
                            </div>
                            <hr></hr>
                            <div class="container">
                                <c:forEach var="latestPost" items="${displayLatestPost}">
                                    <div class="container post-preview">
                                       <c:out value="${latestPost.title}"/>
                                        <p/>
                                        <p>
                                            <a href="${pageContext.request.contextPath}/post">
                                                <c:out value="${latestPost.content}"/>
                                            </a>
                                        </p>
                                        <span class="grey">
                                            <c:out value="@${latestPost.user.userName}"/>
                                            <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm:ss" value="${latestPost.publishDate}" var="joindate"/>
                                            <fmt:formatDate value="${joindate}" pattern="E MMM-dd-yyyy @hh:mm a"/>
                                        </span>
                                    </div>
                                </c:forEach>
                            </div>
                            <hr>
                                <div class="container-fluid box " id="bg" 
                                     style=" background: linear-gradient(to bottom, 
                                     rgba(0,0,0,0.2) 4%,rgba(0,0,0,0.2) 100%), 
                                     url(${contentOne.link})no-repeat ; background-size:cover" >
                                     <p>
                                        <c:out value="${contentOne.name}"/>
                                    </p>
                                    <p>
                                        <c:out value="${contentOne.content}"/>
                                    </p>
                                </div>
                               
                                <div class="container-fluid  box1 " id="bg" >
                                     <p>
                                        <c:out value="${contentTwo.name}"/>
                                    </p>
                                    <p>
                                        <c:out value="${contentTwo.content}"/>
                                    </p>
                                </div>
                                <div class="container-fluid box" id="bg" 
                                     style=" background: linear-gradient(to bottom, 
                                     rgba(0,0,0,0.2) 4%,rgba(0,0,0,0.2) 100%), 
                                     url(${contentThree.link})no-repeat; background-size:cover" >
                                 <p>
                                        <c:out value="${contentThree.name}"/>

                                    </p>
                                    <p>
                                        <c:out value="${contentThree.content}"/>
                                    </p>
                                </div>
                               
                                <div class="container-fluid box1 " id="bg" >
                                     <p>
                                        <c:out value="${contentFour.name}"/>

                                    </p>
                                    <p>
                                        <c:out value="${contentFour.content}"/>
                                    </p>
                                </div>
                                <hr>             
                                    <footer id="footer"></footer>
                                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                                    </body>
                                    </html>

