



<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Sign Up</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>
                    <div id="header">
                    </div>
                    <div class="form-group container" id="contain">
                        <div id="add-post" class="col-md-12">
                            <sf:form  class="form-horizontal" 
                                      role="form"  method="POST" 
                                      action="signIn">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <div >${message}</div>
                                            <div class="form-group container">
                                                <input type="text" class="form-control" name="userName" placeholder="User Name" required  />
                                            </div>
                                            <div class="form-group container">
                                                <input  type="text" class="form-control" name="password" placeholder="Pass word" required/> 
                                            </div>
                                            <input type="submit" id="log-in-btn" class="form-control" value="Log In"/>

                                        </div>
                                    </div>
                                </div>
                            </sf:form> 
                            <div class="col-sm-2 align-top " >
                                <a href="${pageContext.request.contextPath}/signUp">${signUp}</a>  <a href="${pageContext.request.contextPath}/signUp">${password}</a>
                            </div>
                        </div>
                    </div>


                    <footer id="footer"></footer>
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>
                    </html>
