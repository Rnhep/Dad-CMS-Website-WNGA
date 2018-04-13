<%-- 
    Document   : TermAndCondition
    Created on : Feb 19, 2018, 12:58:29 PM
    Author     : ritheenhep
--%>
<%-- 
    Document   : About
    Created on : Nov 13, 2017, 1:44:07 PM
    Author     : ritheenhep
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
       <head>
     <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>About us</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet"/>
                </head>
                <body>
              <div id="header-mobile"></div>
                    <div class="logo logo-hide col-md-12">
                    </div>
                    <div class="col-md-9" id="header-desktop"></div>
                    
                    <div class="container col-md-12 aboutUs">
                <div id="strong">    
                    <p>
                        WHAT IS WNGA?      
                    </p>
                    <p>• Legal Organization with State and Federal.</p>
                    <p>• A Non-Profit Organization 501(C)4.</p>
                    <p>• Not a Tax Exemption.</p>
                </div>
            </div>
                <div class="container col-md-12 aboutUs">
                <p>
                    <strong> Overview: </strong><br>

                    WNGA is established to promote social welfare and fair political process 
                    for Khmer people of all ages through educational and cultural exchanges;
                    to advocate for disadvantaged persons to achieve their basic rights;
                    and to voice the concerns of Khmer people around the world about the issues 
                    regarding human rights, democracy, economic, security, peace, 
                    freedom and stability with the meaning of section 501(c)(4)of 
                    the Internal Revenue Code as amended, or the corresponding section of any 
                    future federal tax code. 
                </p>
                </div>
         
             <div class="container col-md-12 aboutUs">

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

                
            </div>
      
         <hr class="col-md-10 aboutUsFooterLine"></hr>
        <footer class="col-md-12" id="footer"></footer>
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
