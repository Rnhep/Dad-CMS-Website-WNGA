<%-- 
    Document   : Footer
    Created on : Dec 3, 2017, 4:47:43 PM
    Author     : ritheenhep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header & Footer</title>
    </head>
    <body>
        <div class="col-md-12 logo" >   
        </div>
        <div class="col-sm-2" id="nav">
            <sec:authorize access="hasRole('ROLE_USER')">
                <a class="dropdown-toggle" id="dropdown" type="button" data-toggle="dropdown">&#9776; 
                    <span class="caret"></span></a>
                <ul class="dropdown-menu" id="dropdown">
                    <li>
                        <div class="col-sm-2 align-top " id="home">
                            <a href="${pageContext.request.contextPath}/displayHomePage"><span class="glyphicon glyphicon-home"></span></a>
                        </div>
                    </li>
                    <li>
                        <div class="col-sm-2 align-top " id="home">
                            <a href="${pageContext.request.contextPath}/displayAboutUsPage">  About Us</a>
                        </div>
                    </li>
                    <li> <div class="col-sm-2 align-top " id="news">
                            <a  href="${pageContext.request.contextPath}/displayNewsFeedPage">News</a>
                        </div></li>
                    <li><div class="col-sm-2 align-top " id="blog">
                            <a  href="${pageContext.request.contextPath}/displayBlogPage">Blog</a>
                        </div></li>
                    <li> <div class="col-sm-2 align-top " id="log-in">
                            <a  href="${pageContext.request.contextPath}/">Sign In</a>
                        </div></a></li>
                </ul>
            </sec:authorize>
        </div>
                        <hr class="hr">


    </body>
</html>
