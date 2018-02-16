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
        <title>WNGA Registration </title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 
                    <div id="header"></div>
                    <c:if test="${!empty message}"> 
                        <div class="container">
                            <div class=" alert alert-danger">
                                ${message}
                            </div>
                        </div>
                    </c:if>
                    <div class="container-fluid" id="contain-one">

                        <sf:form role="form" action="createUser" method="POST" >
                            <div class="form-group">
                                <div class="col-md-8">
                                    <h2>${registration}</h2>
                                    <div class="alert-danger">${termBox}</div>
                                    <input type="checkbox" name="agreement" value="true"/> ${iAgree} <a href="${pageContext.request.contextPath}/termandcondition">${termAndCondition}</a>
                                    <input type="email" class="form-control" id="email"
                                           name="email" placeholder="Email" value="${emailField}" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    ${userName}
                                    <input type="text" class="form-control" id="userName"
                                           name="userName" placeholder="User Name" value="${userNameField}" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="fn"
                                           name="firstName" placeholder="First Name" value="${firstNameField}" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="ln"
                                           name="lastName" placeholder="Last Name" value="${lastNameField}" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <input type="password" class="form-control" id="password"
                                           name="password" placeholder="password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required />

                                </div>
                            </div><div class="form-group">
                                <div class="col-md-8">
                                    <input type="password" class="form-control" id="password"
                                           name="confirmPassword" placeholder="password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                           title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                                    ${pswmessage}
                                </div>
                            </div>
                            <div class="col-md-8">
                                <input type="submit" id="log-in-btn" class="form-control" value="Submit"/>
                            </div>
                        </sf:form>
                    </div>
                    <hr>             
                        <footer id="footer"></footer>
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
