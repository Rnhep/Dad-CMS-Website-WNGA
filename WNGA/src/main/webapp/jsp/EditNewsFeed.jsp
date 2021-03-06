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
        <title>WNGA Edit News</title>
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
                    <div class="to-center col-md-12" id="displayDate">
                        <p class="today"> 
                            <%
                                out.print("Edit News");
                            %>
                        </p>
                        <button class="btn-info backto-Top" id="backto-Top"> back to top</button>
                    </div>
                  
                    <div class="container col-md-12  displayNews">
                        <div class="inner-postform">
                            <sf:form role="form" action="updateNews" method="POST" modelAttribute="newsFeed">
                                <div class="form-group">
                                    <sf:input  id="registration-from" type="text" class="form-control" path="name" placeholder="Enter your Title here"/>
                                    <sf:errors path="name" cssclass="error"></sf:errors>
                                    </div>
                                    <hr></hr>
                                    <div class="form-group">
                                    <sf:hidden path="date" value="${date}"/>
                                    <sf:textarea type="text" class="news-Textarea" path="content" placeholder="Enter your news Feed here"/>
                                    <sf:errors path="content" cssclass="error"></sf:errors>
                                    <sf:hidden path="newsFeedId"/>
                                    <input id="log-in-btn" type="submit" class="form-control" value="Update Content"/>

                                </div>
                            </sf:form>
                        </div>
                    </div>

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
