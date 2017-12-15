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

        <div class="container-fluid nav">
            <!--         <span class="glyphicon glyphicon-home"></span>-->
            <div class="col-sm-2 align-top " id="home">
                <a  href="${pageContext.request.contextPath}/displayAboutUs">About Us</a>
            </div>
            <div class="col-sm-2 align-top " id="news">
                <a  href="${pageContext.request.contextPath}/displayNewsFeed">News</a>
            </div>
            <div class="col-sm-2 align-top " id="blog">
                <a  href="${pageContext.request.contextPath}/">Blog</a>
            </div>
            <div class="col-sm-2 align-top " id="log-in">
                <a  href="${pageContext.request.contextPath}/"><i class="glyphicon glyphicon-log-in">Sign In</i></a>
            </div>
        </div>
            
            <footer class="footer"> copy right 2017</footer>
    </body>
</html>
