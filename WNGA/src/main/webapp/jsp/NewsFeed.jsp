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
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" >
       <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>WNGA News</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div><c:forEach var="user" items="${allUsers}">
                <c:if test="${pageContext.request.userPrincipal.name == user.userName}">
                    <div id="userImg-inNav">
                        <img src="${user.photo}"/>
                        <p>Hello: ${pageContext.request.userPrincipal.name} |
                            <a href="userProfile?userName=${pageContext.request.userPrincipal.name}">Profile</a></p>
                    </div>
                </c:if>
            </c:forEach></div>
        <div id="headerFreeze">
            <div id="header-mobile"></div>
            <div class="logo home logo-hide col-md-12">
            </div>
            <div class="col-md-9" id="header-desktop"></div>
        </div>

        <!------------------------------------------------------------------------------------------------------------------------------>                         

        <div class="to-center col-md-12" id="displayDate">
            <p class="today"> 
                <%
                    out.print("Today News");
                %>
            </p>
            <button class="btn-info backto-Top" id="backto-Top"> back to top</button>
        </div>

        <div class="container displayNews col-md-12">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div class="inner-postform">
                    <sf:form  class="form-horizontal" 
                              role="form"  method="POST" 
                              action="createNewsFeed">
                        <div ><c:out value="${message}"/></div>
                        <textarea class="news-Textarea" type="text" name="content" placeholder="Comment required" required>${commentOut}</textarea> 
                        <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
                        <hr></hr>
                        <input type="submit" id="post-in-btn" class="form-control" value="Submit Post"/>

                    </sf:form> 
                </div>
            </sec:authorize>

            <c:forEach var="news" items="${allNews}">
                <div class="container pre-posts">
                    <p>
                        <span class="grey">
                            <c:out value="${admin}"/>
                            <fmt:parseDate pattern="yyyy-MM-dd" value=" ${news.date}" var="newsDate"/>
                            <fmt:formatDate value="${newsDate}" pattern="E MMM-dd-yyyy"/>
                        </span>
                    </p>

                    <div class="container newsContents">
                        <p>
                            <c:out value="${news.content}"/>
                        </p>
                    </div>

                    <hr></hr>

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <p class="edit-delete grey">
                            | <a class="grey" href="editNewsForm?newsFeedId=${news.newsFeedId}">edit</a> 
                            | <a class="grey" href="deleteNews?newsFeedId=${news.newsFeedId} "id="delete" data-confirm=" WARNING!!!!: Are you sure to delete this comment? CANNOT BE UNDONE!!!">delete</a> |
                        </p>
                    </sec:authorize>
                </div>
            </c:forEach>
        </div>


        <hr class="col-md-10" id="newsFooter"></hr>
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
