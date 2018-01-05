<%-- 
    Document   : UserRegistrationForm
    Created on : Dec 30, 2017, 2:31:32 PM
    Author     : ritheenhep
--%>

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
        <title>UserRegistrationForm</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 
                    <div id="header"></div>

                    <sf:form role="form" action="createUser" method="POST" >
                        <div class="form-group">
                                <div class="col-md-8">
                                  <c:if test="${!empty message}">  <div class="alert alert-danger"> <c:out value="${message}"/></div>
                                  </c:if>
                                    <input type="text" class="form-control" id="email"
                                           name="email" placeholder="Email" value="${emailField}" />
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="fn"
                                           name="firstName" placeholder="First Name" value="${firstNameField}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">

                                    <input type="text" class="form-control" id="ln"
                                           name="lastName" placeholder="Last Name" value="${lastNameField}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">

                                    <input type="text" class="form-control" id="userName"
                                           name="userName" placeholder="userName" value="${userNameField}"/>
                                </div>
                            </div>
                            
                                <div class="form-group">
                                <div class="col-md-8">

                                    <input type="text" class="form-control" id="password"
                                           name="password" placeholder="password"/>
                                </div>
                            </div><div class="form-group">
                                <div class="col-md-8">

                                    <input type="text" class="form-control" id="password"
                                           name="confirmPassword" placeholder="password" />
                                </div>
                            </div>
                            <input type="submit" class="btn btn-default" value="Submit"/>
                        </div>

                        </div>

                    </sf:form>




                    <hr>             
                        <footer id="footer"></footer>

                        <!-- Placed at the end of the document so the pages load faster -->
                        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>
