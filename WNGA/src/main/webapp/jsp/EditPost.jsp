<%-- 
    Document   : EditPost
    Created on : Feb 13, 2018, 2:45:06 PM
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
        <title>WNGA Edit Post</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 

                    <div id="header-mobile"></div>

                    <div class="logo logo-hide col-md-12">
                    </div>
                    <div class="col-md-12" id="header-desktop"></div>
                    <div id="up"></div> 
                    <c:forEach var="user" items="${allUsers}">
                        <c:if test="${pageContext.request.userPrincipal.name == user.userName}">
                            <div id="userImg-inNav">
                                <img src="${user.photo}"/>
                                <p>Hello: ${pageContext.request.userPrincipal.name}</p>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="to-center col-md-12" id="displayDate">
                        <p class="today">
                            <%
                                out.print("Most recent posts");
                            %>
                        </p>
                        <button class="backto-Top"> back to top</button>
                    </div>

                    <div class="container col-md-12  displayNews">
                        <div class="inner-postform">
                            <sf:form role="form" action="updatePost" method="POST" modelAttribute="newPost">                           
                                <div class="form-group">       
                                    <sf:input path="imagePath" id="registration-from" type="text" class="form-control" placeholder="Link to photo"/>                               
                                </div>
                                <div class="form-group">
                                    <sf:input path="imagePathTwo" id="registration-from" type="text" class="form-control" placeholder="Link to photo"/>                             
                                </div>
                                <hr></hr>
                                <div class="form-group">
                                    <sf:textarea type="text" class="news-Textarea"  name="content"
                                                 path="content" placeholder="Enter your comment here" />
                                    <sf:errors path="content" cssclass="error"></sf:errors>
                                    <sf:input name="date" type="hidden" path="publishDate"/>
                                    <input type="hidden" name="userId" value="${newPost.user.userId}"reqiured/>
                                    <sf:hidden path="postId"/>
                                    <sf:hidden path="title"/>
                                </div>
                                <div class="form-group">
                                    <input id="log-in-btn" type="submit" class="form-control" value="Update"/>
                                </div>
                            </sf:form>
                        </div>
                    </div>

                    <section id="">
                        <hr class="col-md-10 signInFooterLine"></hr> 
                    </section>           
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
