<%-- 
    Document   : EditContent
    Created on : Dec 23, 2017, 11:35:20 PM
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
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Admin Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 

                    <div id="header"></div>
                    <div class="container-fluid " id="contain">
                        <sf:form role="form" action="updateNewsFeed" method="POST" modelAttribute="newsFeed">
                            <div class="form-group">
                                <div class="col-md-8">
                                    <sf:input type="text" class="form-control" id="title"
                                              path="name" placeholder="Enter your Title here"/>
                                    <sf:errors path="name" cssclass="error"></sf:errors>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-8">
                                    <sf:hidden path="date" value="${date}"/>
                                    <sf:textarea type="text"  id="content"
                                                 path="content" placeholder="Enter your news Feed here"/>
                                    <sf:errors path="content" cssclass="error"></sf:errors>
                                    <sf:hidden path="newsFeedId"/>
                                    <input type="submit" class="btn btn-default" value="Update Content"/>
                                </div>
                            </div>
                        </sf:form>
                    </div>

                    <hr>             
                        <footer id="footer"></footer>
                        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>
