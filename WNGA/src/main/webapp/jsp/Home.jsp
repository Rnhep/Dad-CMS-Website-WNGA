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
                <title>WNGA Home</title>
                <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
                    <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                        </head>
                        <body> 
                          
                            <div id="header-mobile"></div>
                            
                            <div class="logo logo-hide col-md-12">
                            </div>
                            <div class="col-md-9" id="header-desktop"></div>
                            <div id="up"></div> 
                            
                            
                            
                            
                            <div class="container col-md-12">
                                <div class=" container pre-posts">
                                    <p class="upcoming"> Upcoming Events:</p>
                                    <pre><c:out value="${eventOne.name}"/>
                                        <c:out value="${eventOne.content}"/></pre>
                                    <hr></hr>
                                    <pre><c:out value="${eventTwo.name}"/>
                                        <c:out value="${eventTwo.content}"/></pre>
                                </div>
                                <hr></hr>
                            </div>
                            
                            <div class="container col-md-12">
                                <div class="container  pre-posts to-center"> 
                                    <p id="recent-post"> <c:out value="${latestPost}"/>
                                    </p>
                                </div>
                                <c:forEach var="latestPost" items="${displayLatestPost}">
                                    <div class="container post-preview">
                                        <c:out value="${latestPost.title}"/>
                                        <p/>
                                        <p>
                                            <a href="${pageContext.request.contextPath}/displayPost">
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
                                    <hr></hr>
                            </div>
                       
                               
                                <div class="col-md-12 container-fluid img-conainter " id="bg" 
                                     style=" background: linear-gradient(to bottom, 
                                     rgba(0,0,0,0.2) 4%,rgba(0,0,0,0.2) 100%), 
                                     url(${contentOne.link})no-repeat center; background-size:cover" >
                                    <p>
                                        <c:out value="${contentOne.name}"/>
                                    </p>
                                    <p>
                                        <c:out value="${contentOne.content}"/>
                                    </p>
                                </div>
                                    
                                <div class="col-md-12 container-fluid to-center plainText-content" id="bg" >
                                    <p>
                                        <c:out value="${contentTwo.name}"/>
                                    </p>
                                    <p>
                                        <c:out value="${contentTwo.content}"/>
                                    </p>
                                </div>
                                <div class=" col-md-12 container-fluid img-conainter" id="bg" 
                                     style=" background: linear-gradient(to bottom, 
                                     rgba(0,0,0,0.4) 4%,rgba(0,0,0,0.4) 100%), 
                                     url(${contentThree.link})no-repeat center; background-size:cover" >
                                    <p>
                                        <c:out value="${contentThree.name}"/>

                                    </p>
                                    <p>
                                        <c:out value="${contentThree.content}"/>
                                    </p>
                                </div>

                                <div class="col-md-12 container-fluid to-center " id="bg" >
                                    <p>
                                        <c:out value="${contentFour.name}"/>

                                    </p>
                                    <p>
                                        <c:out value="${contentFour.content}"/>
                                    </p>
                                <hr></hr>
                                </div>
                                    
                                       
                                    <footer  id="footer"></footer>
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

