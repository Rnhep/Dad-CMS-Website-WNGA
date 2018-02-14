<%-- 
    Document   : CustomError
    Created on : Jan 22, 2018, 2:29:28 PM
    Author     : ritheenhep
--%>

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
        <meta name="viewport" content="width=device-width" />
        <title>Error</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body>

                    <div id="header"></div>
                    <div class="container-fluid">
                        <div class="container">
                            <h3>AN ERROR HAS OCCURRED!!!!....PLEASE CHECK YOUR UPDATE</h3>
                            <p>
                               <c:out value="${errorMSG1}"/>
                            </p>
                            <p>
                                <c:out value="${errorMSG2}"/>
                            </p>
                                <h3><c:out value="${errorMessage}"/></h3>
                            
                        </div>
                    </div>

                    <hr></hr>
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>
