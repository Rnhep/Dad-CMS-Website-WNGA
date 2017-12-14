<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0">

        <title>Home Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
    </head>
    <body> 
        <div class="col-md-12 logo" >   
        </div>

        <div class="container-fluid nav">
            <!--         <span class="glyphicon glyphicon-home"></span>-->
            <div class="col-sm-2 align-top " id="home">
                <a  href="${pageContext.request.contextPath}/">Photos</a>
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
        <h1> WNGA.MN.US.OG </h1>

        <div class="container-fluid box" id="education">
            <p><a  href="${pageContext.request.contextPath}/">
                    <c:out value="${education.title}"/>
                </a></p>
        </div>

        <div class="education-content" >
            <p><c:out value="${education.content}"/></p>
            <p><a href="${pageContext.request.contextPath}/">read more</a></p>
        </div>



        <!--            for health section.-->
        <div class="container-fluid box" id="health">
            <p><a  href="${pageContext.request.contextPath}/">
                    <c:out value="${health.title}"/>
                </a></p>
        </div>
        <div class="education-content" >
            <p><c:out value="${health.content}"/></p>
            <p><a href="${pageContext.request.contextPath}/">
                    read more
                </a></p>
        </div>

        <div class="container-fluid box" id="humanRight">
            <p> <a href="${pageContext.request.contextPath}/">  
                    <c:out value="${humanRight.title}"/>
                </a></p>
        </div>
        <div class="education-content" >
            <p><c:out value="${humanRight.content}"/></p>
            <p>
                <a href="${pageContext.request.contextPath}/">
                    read more
                </a>
            </p>
        </div>

        <div class="container-fluid box" id="ppa">
            <p><a href="${pageContext.request.contextPath}/">
                    <c:out value="${PPA.title}"/>
                </a>
            </p>

        </div>
        <div>
            <p >
                <c:out value="${PPA.content}"/>
            <p>
                <a href="${pageContext.request.contextPath}/">
                    read more
                </a>
                    
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/home.js"></script>

    </body>
</html>

