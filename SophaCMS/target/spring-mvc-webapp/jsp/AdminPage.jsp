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
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Admin Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 
                    <div id="header"></div>
                    
                    
                    
                    
                 
                    <div class="container pre-posts">
                            <p><c:out value="${contentOne.title}"/>
                                    <a  href="displayEditPostForm?newsFeedId=${contentOne.newsFeedId}">
                                        <button class="btn-sm" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentOne.content}"/>
                            </p>
                    </div>

                    <div class="container pre-posts">
                            <p><c:out value="${contentTwo.title}"/>
                                <a  href="displayEditPostForm?newsFeedId=${contentTwo.newsFeedId}">
                                        <button class="btn-sm" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentTwo.content}"/>
                            </p>
                    </div>
                    <div class="container pre-posts" >
                            <p> <c:out value="${contentThree.title}"/>
                               <a  href="displayEditPostForm?newsFeedId=${contentThree.newsFeedId}">
                                        <button class="btn-sm" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentThree.content}"/>
                            </p>
                    </div>
                   <div class="container pre-posts">
                            <p> <c:out value="${contentThree.title}"/>
                               <a  href="displayEditPostForm?newsFeedId=${contentFour.newsFeedId}">
                                        <button class="btn-sm" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentFour.content}"/>
                            </p>
                    </div>





                    <hr>             
                        <footer id="footer"></footer>

                        <!-- Placed at the end of the document so the pages load faster -->
                        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/Home.js"></script>

    </body>
</html>