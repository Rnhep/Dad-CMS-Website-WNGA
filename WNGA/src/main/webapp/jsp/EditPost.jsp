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


                    <div class="container col-md-12 postForm">
                        <sf:form role="form" action="updatePost" method="POST" modelAttribute="newPost">

                            <div class="form-group">
                                <div class="col-md-8">
                                    <sf:input path="imagePath" class="form-control photo-link" placeholder="Link to photo"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <sf:input path="imagePathTwo" class="form-control photo-link" placeholder="Link to photo"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <sf:textarea type="text" class="photo-link"  name="content"
                                                 path="content" placeholder="Enter your comment here" />
                                    <sf:errors path="content" cssclass="error"></sf:errors>
                                    <sf:input name="date" type="hidden" path="publishDate"/>
                                    <input type="hidden" name="userId" value="${newPost.user.userId}"reqiured/>
                                    <sf:hidden path="postId"/>
                                    <sf:hidden path="title"/>
                                    <input class="photo-link" type="submit" class="btn btn-default" value="Update"/>
                                </div>
                            </div>
                        </sf:form>
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
