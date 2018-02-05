<%-- 
    Document   : NewsFeed
    Created on : Nov 13, 2017, 4:29:23 PM
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
                    <div id="header"> </div>
                    <div class="container-fluid">
                        <!--Add post form for user/admin role-->
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <sf:form  class="form-horizontal" 
                                      role="form"  method="POST" 
                                      action="newsFeed">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-md-9">
                                            <div ><c:out value="${message}"/></div>
                                            <div class="form-group container-fluid">
                                                <input type="text" class="form-control" name="name" placeholder="Your Name"  required/>
                                            </div>
                                            <div class="form-group container-fluid">
                                                <input type="text" class="form-control" name="link" placeholder="Link" />
                                            </div>
                                            <textarea  type="text" class="commentbox" name="content"   placeholder="Comment required" required>${commentOut}</textarea> 
                                            <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
                                            <input type="submit" id="log-in-btn" class="form-control" value="Submit Post"/>
                                        </div>
                                    </div>
                                </div>
                            </sf:form> 

                        </sec:authorize>
                        <!------------------------------------------------------------------------------------------------------------------------------>                         
                       <div class="col-md-12 ">
                            <div class="form-group">
                                <div  class="form-control box1 pre-posts">
                                    <p>  
                                        <%
                                            out.print("Today News");
                                        %>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="news" items="${allNews}">
                            <div class="container pre-posts">
                                <p class="grey">
                                    <c:out value="${news.name} ${admin}"/>
                                    <fmt:parseDate pattern="yyyy-MM-dd" value=" ${news.date}" var="newsDate"/>
                                    <fmt:formatDate value="${newsDate}" pattern="E MMM-dd-yyyy"/>

                                </p>
                                <p>
                                    <a href="${news.link}"><c:out value="${news.link}"/></a>
                                </p>
                                <p>
                                    <c:out value="${news.content}"/>
                                </p>
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <p>

                                        <a class="grey" href="editNewsForm?newsFeedId=${news.newsFeedId}">edit</a> <a class="grey" href="">delete</a>

                                    </p>
                                </sec:authorize>
                            </div>
                        </c:forEach>
                    </div>

                    <hr></hr>
                    <footer id="footer"></footer>
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                </body>
                </html>
