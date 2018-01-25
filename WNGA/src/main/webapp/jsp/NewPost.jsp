<%-- 
    Document   : NewPost
    Created on : Nov 13, 2017, 1:49:51 PM
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
        <title>New Post</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header">
                    </div>
                    <div class="container">
                        <!--Add post form for user/admin role-->
                        <sec:authorize access="isAuthenticated()">
                            <div id="add-post" class="col-md-12">
                                <sf:form  class="form-horizontal" 
                                          role="form"  method="POST" 
                                          action="newPost">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <div >${message}</div>
                                                <div class="form-group container">
                                                    <input type="text" class="form-control" name="title" placeholder="Title required" value="${titleField}" required/>
                                                </div>
                                                <div class="form-group container">
                                                    <input type="text" class="form-control" name="photo" placeholder="Link to a photo only"  />
                                                </div>
                                                <div class="form-group container">
                                                    <input type="text" class="form-control" name="photoTwo" placeholder="Link to a photo only"  />
                                                </div>
                                                <textarea  type="text" class="commentbox" name="comment"   placeholder="Comment required" required>${commentOut}</textarea> 
                                                <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
                                                <input type="submit" id="log-in-btn" class="form-control" value="Submit Post"/>
                                            </div>
                                        </div>
                                    </div>
                                </sf:form> 
                            </div>
                        </sec:authorize>
                        <!------------------------------------------------------------------------------------------------------------------------------>                         
                        <div class="container ">
                            <!--To display all of the posts-->
                            <c:forEach var="allPosts" items="${displayAllPost}">
                                <div class="container pre-posts">
                                    <div class="container member-Detail" <p> Posted by:<span class="blue">
                                                <c:out value="${allPosts.user.userName}"/>
                                                |<br>
                                                    <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm:ss" value=" ${allPosts.publishDate}" var="joindate"/>
                                                    <fmt:formatDate value="${joindate}" pattern="E MMM-dd-yyyy @ hh:mm a"/>
                                            </span>
                                    </div>
                                    <p><c:out value="${allPosts.title}"/></p>
                                    <p><c:out value="${allPosts.content}"/></p>
                                    <div class="container img-center">
                                        <c:if test="${!empty allPosts.imagePath}">
                                            <a href="${allPosts.imagePath}"><img src="${allPosts.imagePath}"/></a>
                                            <c:if test="${!empty allPosts.imagePathTwo}">
                                                <a href="${allPosts.imagePathTwo}"> <img src="${allPosts.imagePathTwo}"/></a>
                                            </c:if>
                                        </c:if>                 
                                    </div>

                                </div> 

                            </c:forEach>
                        </div>
                    </div>
                    <hr>


                        <footer id="footer"></footer>
                        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                </body>
                </html>
