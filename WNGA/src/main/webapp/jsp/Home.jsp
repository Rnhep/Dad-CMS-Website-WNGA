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
        <title>WNGA Home</title>
        <link rel="icon" href="../favico.ico" type="image/x-icon">

            <link rel="shortcut icon" href="../favico.ico" type="image/x-icon"> 
                <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
                    <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                        </head>
                        <body> 
                            <main>
                                <div><c:forEach var="user" items="${allUsers}">
                                        <c:if test="${pageContext.request.userPrincipal.name == user.userName}">
                                            <div id="userImg-inNav">
                                                <img src="${user.photo}"/>
                                                <p>Hello: ${pageContext.request.userPrincipal.name} |
                                                    <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a></p>
                                            </div>
                                        </c:if>
                                    </c:forEach></div>
                                <section id="fade-out" class="grid">
                                    <div id="headerFreeze">

                                        <div id="header-mobile"></div>
                                        <div class="logo home logo-hide col-md-12">
                                        </div>
                                        <div class="col-md-9" id="header-desktop">
                                        </div>
                                    </div>

                                    <div class="col-md-12 upComing-outterDiv">
                                        <div class="latestPost  "> 
                                            <p id="upComing"> Upcoming Events</p>
                                        </div>
                                    </div>

                                </section>
                                <div class="col-md-12" id="latestPost-ContentHolding" >
                                    <div class="events latestPost-Content ">
                                        <c:out value="${eventOne.name}"/>
                                        <c:out value="${eventOne.content}"/>
                                    </div>

                                    <div class="events latestPost-Content">
                                        <c:out value="${eventTwo.name}"/>
                                        <c:out value="${eventTwo.content}"/>
                                    </div>
                                </div>


                                <section id="fade-out" class="grid">
                                    <div class="col-md-12 upComing-outterDiv">
                                        <div class="latestPost"> 
                                            <p id="latestPost">
                                                <c:out value="${latestPost}"/>
                                            </p>
                                        </div>
                                    </div>

                                    <div class=" col-md-12" id="latestPost-ContentHolding">
                                        <c:forEach var="latestPost" items="${displayLatestPost}">

                                            <div class="latestPost-Content">
                                                <p class="latestestPost-Text">
                                                    <c:out value="@${latestPost.user.userName}"/>
                                                    <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm:ss" value="${latestPost.publishDate}" var="joindate"/>
                                                    <fmt:formatDate value="${joindate}" pattern="E MMM-dd-yyyy @hh:mm a"/>
                                                </p>
                                                <p class="latestestPost-Text">
                                                    <a href="${pageContext.request.contextPath}/displayPost">
                                                        <c:out value="${latestPost.content}"/>
                                                    </a> 
                                                </p>
                                            </div>

                                        </c:forEach>

                                    </div>
                                </section>

                                <div id="fade-out" class="grid">
                                    <div class=" col-md-12 container-fluid img-container " id="homepage-containerbg" 
                                         style=" background: linear-gradient(to bottom, 
                                         rgba(0,0,0,0.4) 4%,rgba(0,0,0,0.4) 100%), 
                                         url(${contentOne.link})no-repeat center; background-size:cover" >
                                        <h3 class="card-title">
                                            <c:out value="${contentOne.name}"/>
                                        </h3>
                                        <p>
                                            <c:out value="${contentOne.content}"/>
                                        </p>
                                    </div>

                                    <div class="col-md-12 container-fluid to-center plainText-content" id="homepage-containerbg" >
                                        <p>
                                            <c:out value="${contentTwo.name}"/>
                                        </p>
                                        <p>
                                            <c:out value="${contentTwo.content}"/>
                                        </p>
                                    </div>
                                </div>
                                <div id="fade-out" class="grid">     
                                    <div class=" col-md-12 container-fluid img-container" id="homepage-containerbg" 
                                         style=" background: linear-gradient(to bottom, 
                                         rgba(0,0,0,0.4) 4%,rgba(0,0,0,0.4) 100%), 
                                         url(${contentThree.link})no-repeat center; background-size:cover" >
                                        <h3>
                                            <c:out value="${contentThree.name}"/>

                                        </h3>
                                        <p>
                                            <c:out value="${contentThree.content}"/>
                                        </p>
                                    </div>

                                    <div class="col-md-12 container-fluid plainText-content to-center " id="homepage-containerbg" >
                                        <p>
                                            <c:out value="${contentFour.name}"/>

                                        </p>
                                        <p>
                                            <c:out value="${contentFour.content}"/>
                                        </p>

                                    </div>
                                </div>
                            </main>

                            <hr class="col-md-10 homeFooterLine"></hr>
                            <footer  class="col-md-12" id="footer"></footer>
                            <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                            <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                            <script src="${pageContext.request.contextPath}/js/linkify.min.js"></script>
                            <script src="${pageContext.request.contextPath}/js/linkify-jquery.min.js"></script>
                            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                            <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                            <script src="${pageContext.request.contextPath}/js/linkify.js"></script>

                        </body>
                        </html>

