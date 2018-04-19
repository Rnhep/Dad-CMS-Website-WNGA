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
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>WNGA Registration </title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <main>
                        <div id="header-mobile"></div>
                        <div class="logo home logo-hide col-md-12">
                        </div>
                        <div class="col-md-10" id="header-desktop"></div>

                        <section class="col-md-12" id="registration">

                            <div class="container col-md-12 register">

                                <sf:form role="form" action="createUser" method="POST" >

                                    <h2>${registration}</h2>
                                    <div class="alert-danger">
                                        <c:out value=" ${termBox}"/>
                                        <c:if test="${!empty message}"> 
                                            ${message}
                                        </c:if>

                                    </div>
                                    <div class="form-group">
                                        <input type="checkbox" name="agreement" value="true"/> ${iAgree}
                                        <a href="${pageContext.request.contextPath}/termandcondition">${termAndCondition}</a>
                                        <input id="registration-from" type="email" class="form-control" id="email"
                                               name="email" placeholder="Email" value="${emailField}" required/>
                                    </div>

                                    <div class="form-group">
                                        ${userName}
                                        <input id="registration-from" type="text" class="form-control" id="userName"
                                               name="userName" placeholder="User Name" value="${userNameField}" required/>
                                    </div>

                                    <div class="form-group">
                                        <input id="registration-from" ype="text" class="form-control" id="fn"
                                               name="firstName" placeholder="First Name" value="${firstNameField}" required/>
                                    </div>

                                    <div class="form-group">
                                        <input id="registration-from" type="text" class="form-control" id="ln"
                                               name="lastName" placeholder="Last Name" value="${lastNameField}" required/>
                                    </div>

                                    <div class="form-group">
                                        <input id="registration-from" type="password" class="form-control" id="password"
                                               name="password" placeholder="password" 
                                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required />
                                    </div>

                                    <div class="form-group">
                                        <input id="registration-from" type="password" class="form-control" id="password"
                                               name="confirmPassword" placeholder="password" 
                                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                               title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                                        <p> ${pswmessage}</p>
                                    </div>

                                    <div class="form-group">
                                        <input id="registration-from" type="submit" class="form-control" class="btn btn-info"   value="Submit"/>
                                    </div>

                                </sf:form>
                            </div>

                            <div class="container col-md-12 policy">

                                <strong> Objectives: </strong><br>
                                    <p> • To establish educational and cultural exchange programs;</p>
                                    <p> • To create local, national, and international youth leadership programs;</p>
                                    <p> • To help the disadvantaged persons to meet their basic rights and needs;</p>
                                    <p> • To work with individual youth, families, communities, governments, 
                                        and countries to promote human rights, democracy, economic security and system 
                                        of justice that is consistent with international standard and international humanitarian laws;</p>
                                    <p> • To work with individual youth and families, communities, governments 
                                        and countries to strengthen and propel a peaceful bilateral relationship 
                                        between the people of Cambodia and of abroad based on the 1991 Paris Peace 
                                        Agreement on Cambodia and the principles of international laws;</p>
                                    <p> • To seek support from members of Congress and of Parliaments, 
                                        Executive Branch, and Prime Minister Office, Policymakers, news, media, 
                                        academics, non-governmental organizations, private businesses, and individuals 
                                        who share and support WNGA’s principles of human rights, democracy, economic security, 
                                        system of justice and free market enterprise for Cambodia. </p>
                                    <p> • To seek support from members of Congress and of Parliaments, 
                                        Executive Branch, and Prime Minister Office, Policymakers, news, media, 
                                        academics, non-governmental organizations, private businesses, and individuals 
                                        who share and support WNGA’s principles of human rights, democracy, economic security, 
                                        system of justice and free market enterprise for Cambodia. </p>
                            </div>
                        </section>

                    </main>

                    <hr class=" container col-md-10 footerLine"></hr>
                    <footer id="footer" class="col-md-12"></footer>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>                  
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify-jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                    <script src="${pageContext.request.contextPath}/js/linkify.js"></script>
                </body>
                </html>
