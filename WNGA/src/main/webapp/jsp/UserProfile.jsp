<%-- 
    Document   : UserPorfile
    Created on : Jan 13, 2018, 4:44:54 PM
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
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>update profile</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header"></div>
                    <div class="container-fluid user-info">
                        <div class="container">
                            <p> ${message} </p>
                            User Name: ${currentLogInUser.userName}
                            | Join Date: ${currentLogInUser.jointDate}
                            | First Name: ${currentLogInUser.firstName}   
                            | Last Name: ${currentLogInUser.lastName} | Email: ${currentLogInUser.email}
                        </div>
                    </div>

                    <div class="container-fluid">

                        <sf:form role="form" modelAttribute="currentLogInUser" action="updateProfile" method="POST" >
                            ${updateProfileMessage}
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label>Email</label>
                                    <sf:input type="email" class="form-control" path="email" name="email" placeholder="email" />
                                    <sf:errors path="email" cssClass="error"></sf:errors>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <label>First Name</label>
                                    <sf:input type="text" class="form-control" path="firstName" name="firstName" placeholder="First Name" />
                                    <sf:errors path="firstName" cssClass="error"></sf:errors>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <label>Last Name</label>
                                    <sf:input type="text" class="form-control" path="lastName" name="lastName" placeholder="Last Name" />
                                    <sf:errors path="lastName" cssClass="error"></sf:errors>
                                    </div>
                                </div>
                                    <div class="form-group">
                                <div class="col-md-8">
                                 <sf:hidden path="userId"/>
                                 <sf:hidden path="userName"/>
                                 <sf:hidden path="jointDate"/>
                                 <sf:hidden path="passWord"/>
                                    <input type="submit" id="log-in-btn" class="form-control" value="Update Profile"/>
                                </div>
                                    </div>
                        </sf:form>
                         
                        <sf:form role="form" modelAttribute="currentUser" action="updatePassword" method="POST"> 
                          
                            <div class="form-group">
                                <div class="col-md-8">
                                    ${passwordField}
                                    <label>Enter Old Password</label>
                                    <input type="password" class="form-control" id="password"
                                           name="oldPassword" placeholder="password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                          title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required  />

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    ${passwordField}
                                    <label> Enter New Password</label>
                                    <input type="password" class="form-control" id="password"
                                           name="password" placeholder="Password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                          title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required  />

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label> Confirm New Password</label>
                                    <input type="password" class="form-control" id="password"
                                           name="confirmPassword" placeholder="Confirm Password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                           title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>

                                    ${pswMessage}
                                </div>
                            </div>
                            <div class="col-md-8">
                                <input type="submit" id="log-in-btn" class="form-control" value="Update Password"/>
                            </div>
                        </sf:form>

                    </div>

                        <hr></hr>
                    <footer id="footer"></footer>
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>
