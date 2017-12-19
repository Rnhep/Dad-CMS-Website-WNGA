<%-- 
    Document   : NewPost
    Created on : Nov 13, 2017, 1:49:51 PM
    Author     : ritheenhep
--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Post</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="header">
        </div>
        <div id="add-post" class="col-md-12">
            <form name="location" class="form-horizontal" 
                  role="form"  method="POST" 
                  action="newPost" >
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" name="title" placeholder="title" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" name="photo" placeholder="link to photo"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input class="comment" type="text" class="form-control" name="comment"   placeholder="Comment" required/> 
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-12">
                            <!--<input type="" class="form-control" name="date" value="${timeStamp}"required/>-->
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="submit" id="add"class="btn btn-default" value="Submit Post"/>
                        </div>
                    </div>  
                </div>
            </form>

        </div>

        <c:forEach var="allPosts" items="${displayAllPost}">
            <div class="container-fluid pre-posts">
                <p> Posted by:<span class="blue"><c:out value="${allPosts.user.userName}"/>
                        | ${allPosts.publishDate}<br>
                    </span>
                <p> <c:out value="${allPosts.content}"/></p>
                </p>
            </div> 
        </c:forEach>


        <hr>


        <footer id="footer"></footer>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/Home.js"></script>
</html>
