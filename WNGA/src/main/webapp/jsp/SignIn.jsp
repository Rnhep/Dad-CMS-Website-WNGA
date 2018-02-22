



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
        <title>WNGA Sign in</title>

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header-mobile"></div>

                    <div class="logo logo-hide col-md-12"></div>
                    <div class="col-md-12" id="header-desktop"></div>
                    <div id="up"></div> 


                    <div class="form-group container" id="expand">
                        <div id="add-post" class="col-md-12">
                            <div class="container text-danger" id="passwordHelp" ><c:if test="${param.login_error == 1}">
                                    <small>Wrong id or password!</small>
                                </c:if>
                            </div>
                            <sf:form  class="form-horizontal" 
                                      role="form"  method="POST" 
                                      action="j_spring_security_check">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-md-6">

                                            <div>
                                            </div>
                                            <div class="form-group container">

                                                <input type="text" class="form-control" name="j_username" placeholder="UserName" required  />
                                            </div>
                                            <div class="form-group container">
                                                <input  type="password" class="form-control" name="j_password" placeholder="Password" required/> 
                                            </div>
                                            <input type="submit" id="log-in-btn" class="form-control" value="Log In"/>

                                        </div>
                                    </div>
                                </div>
                            </sf:form> 
                            <div class="col-sm-2 align-top " >
                                <a href="${pageContext.request.contextPath}/signUp">${signUp}</a> 
                            </div>
                            <hr></hr>
                        </div>
                    </div>

                    <footer id="footer" ></footer>
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
