<%-- 
    Document   : Comment
    Created on : Mar 29, 2018, 1:40:49 PM
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
        <div id="header-mobile"></div>
        <div class="logo logo-hide col-md-12">
        </div>
        <div class="col-md-12" id="header-desktop"></div>
        <!--Add post form for user/admin role-->
        <div class="container col-md-12 postForm">
            <sf:form role="form" action="createComment" method="POST" >
                <div class="form-group">
                    <div class="col-md-8">
                        <p><c:out value="${newPost.content}"/></p>
                    </div>
                </div>
                <textarea type="text" class="photo-link"  name="comment"
                          placeholder="Enter your comment here">

                </textarea>
                <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
                <input type="hidden" name="postId" value="${newPost.postId}"/>
                <div class="form-group ">
                    <input type="submit" id="log-in-btn" class="form-control" value="Submit Post"/>
                </div>
            </sf:form>
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
