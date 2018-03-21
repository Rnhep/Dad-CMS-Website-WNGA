<%-- 
    Document   : UpdatePasswordForm
    Created on : Jan 21, 2018, 12:26:40 AM
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
        <title>WNGA Profile Update</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header-mobile"></div>

                    <div class="logo logo-hide col-md-12"> </div>
                    <div class="col-md-12" id="header-desktop"></div>
                    <div id="up"></div> 


                    <div class="container-fluid">
                        <sf:form role="form" modelAttribute="currentUser" action="updateProfile" method="POST" >
                            ${updateProfileMessage}
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label>Please enter link to your photo for your profile picture: WARNING!: file upload is not available</label>
                                    <label>Profile Photo</label>
                                    <sf:input type="text" class="form-control" path="photo" name="email" placeholder="Enter link to your photo" />
                                    <sf:errors path="photo" cssClass="error"></sf:errors>
                                    </div>
                                </div>
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
                                    <sf:hidden path="enable"/>
                                    <sf:hidden path="userName"/>
                                    <sf:hidden path="joinDate"/>
                                    <sf:hidden  path="passWord"/>
                                    <input type="submit" id="log-in-btn" class="form-control" value="Update Profile"/>
                                </div>
                            </div>
                        </sf:form>
                        <sf:form role="form"  modelAttribute="currentUser"  action="updatePassword" method="POST" >

                            <div class="form-group">
                                <div class="col-md-8">
                                    <label>Enter old password</label>
                                    <input type="password" class="form-control" name="oldPSW" placeholder="Old Password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label>Enter new password</label>
                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" name="newPSW" placeholder="New Password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label>Confirm new password</label>
                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" name="confirmNewPSW" placeholder="Confirm New Password"/>
                                    ${pswMessage}
                                </div>
                            </div>
                            <input type="hidden" name="existingPSW" value="${currentUser.passWord}"/>
                            <sf:hidden path="userId"/>
                            <sf:hidden path="firstName"/>
                            <sf:hidden path="lastName"/>
                            <sf:hidden path="enable"/>
                            <sf:hidden path="userName"/>
                            <sf:hidden path="joinDate"/>
                            <sf:hidden  path="passWord"/>
                            <input type="submit" id="log-in-btn" class="form-control" value="Update Password"/>
                        </sf:form>
                    </div>

                    <hr></hr>
                    <footer id="footer"></footer>
                    <!-- Placed at the end of the document so the pages load faster -->
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
