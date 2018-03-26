<%-- 
    Document   : NewPost
    Created on : Nov 13, 2017, 1:49:51 PM
    Author     : ritheenhep
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title> WNGA Posts</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header-mobile"></div>
                    <div class="logo logo-hide col-md-12">
                    </div>
                    <div class="col-md-10" id="header-desktop"></div>
                    

                    <sec:authorize access="isAuthenticated()">
                        <div class="container col-md-12 postForm ">
                            <sf:form role="form"  method="POST" class="form-horizontal"
                                     action="creatNewPost">
                                <div ><c:out value="${message}"/></div>
                                <div class="form-group">
                                    <input id="registration-from" type="text" class="form-control" name="photo" placeholder="Link to a photo only" value="${fn:escapeXml(param.photo)}" />
                                </div>
                                <div class="form-group">
                                    <input id="registration-from" type="text" class="form-control" name="photoTwo" placeholder="Link to a photo only"  />
                                </div>
                                <textarea  type="text" name="comment"   placeholder="Comment required" value="${fn:escapeXml(comment)}" required>${commentOut}</textarea> 
                                <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
                                <div class="form-group">
                                    <input type="submit" id="log-in-btn" class="form-control" value="Submit Post"/>
                                </div>
                            </sf:form> 
                        </div>
                    </sec:authorize>


                    <!------------------------------------------------------------------------------------------------------------------------------>                         


                    <div class="to-center col-md-12" id="displayDate">
                        <p class="today">
                            <%
                                LocalDateTime date = LocalDateTime.now();
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E MMM-dd-yyyy HH:mma  ");
                                String dates = formatter.format(date);
                                out.print("Today is " + dates);
                            %>
                        </p>

                    </div>


                    <div class="container display-post col-md-12">
                        <c:forEach var="allPosts" items="${displayAllPost}">
                            <div class="container pre-posts">
                                <p>
                                    <span class="grey">
                                        <c:if test="${!empty allPosts.user.photo}">
                                            <img  id="user-img" 
                                                  src="${allPosts.user.photo}"/>
                                        </c:if>
                                        <c:out value="${allPosts.user.userName}..."/>
                                        <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm:ss" value=" ${allPosts.publishDate}" var="Postdate"/>
                                        <fmt:formatDate value="${Postdate}" pattern=" MMM-dd-yyyy @hh:mma"/>
                                    </span>
                                </p>
                                <div class="container postContents">
                                    <p>
                                        <c:out value="${allPosts.content}"/>
                                    </p>
                                </div>
                                <div class="container img-center">
                                    <c:if test="${!empty allPosts.imagePath}">
                                        <a href="${allPosts.imagePath}">
                                            <img src="${allPosts.imagePath}"/>
                                        </a>
                                        <c:if test="${!empty allPosts.imagePathTwo}">
                                            <a href="${allPosts.imagePathTwo}"> 
                                                <img src="${allPosts.imagePathTwo}"/>
                                            </a>
                                        </c:if>
                                    </c:if>                 
                                </div>
                                <c:if test="${pageContext.request.userPrincipal.name == allPosts.user.userName}">
                                    <p class="edit-delete">
                                        <a class="grey " href="editPostForm?postId=${allPosts.postId}">edit</a> 
                                        <a class="grey" href="deletePost?postId=${allPosts.postId}"  id="delete" data-confirm=" WARNING!!!!: Are you sure to delete this comment? CANNOT BE UNDONE!!!">delete</a>
                                    </p>
                                </c:if>
                            </div> 
                        </c:forEach>
                    </div>

                    <hr class="col-md-10 footerLine"></hr>
                    <footer class="col-md-12" id="footer"></footer>
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
