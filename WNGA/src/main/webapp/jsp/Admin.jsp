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
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Admin Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/StyleSheet.css" type="text/css" rel="stylesheet">
                </head>
                <body> 
                    <div id="header"></div>

                    <div class="container">
                        <div class="container admin-note">
                            <h1> Admin </h1>

                        </div>
                        <div class="container admin-note">
                            <p> You have <c:out value="${postCount} Posts | ${newsFeedCount} News Feed | in your database"/></p>

                        </div>
                        <hr></hr>
                        <div class="container">
                            <button class="btn-danger">Delete 100 Posts </button> <button class="btn-danger"> Delete 100 News</button> 
                        </div> 
                        <div class="container admin-note">
                                <p> Home Page Content</p>
                            </div>  
                        <div class="container pre-posts">
                           
                        
                            <p><c:out value="${contentOne.name}"/>
                                <a  href="editContent?newsFeedId=${contentOne.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentOne.content}"/>
                            </p>
                        </div>
                        <div class="container pre-posts">
                            <p><c:out value="${contentTwo.name}"/>
                                <a  href="editContent?newsFeedId=${contentTwo.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentTwo.content}"/>
                            </p>
                        </div>
                        <div class="container pre-posts" >
                            <p> <c:out value="${contentThree.name}"/>
                                <a  href="editContent?newsFeedId=${contentThree.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentThree.content}"/>
                            </p>
                        </div>
                        <div class="container pre-posts">
                            <p> <c:out value="${contentThree.name}"/>
                                <a  href="editContent?newsFeedId=${contentFour.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${contentFour.content}"/>
                            </p>
                        </div>
                        <hr>
                            <div class="container admin-note">
                                <p> Current Events</p>
                            </div>  
                        

                        <div class="container pre-posts">
                            <p><c:out value="${eventOne.name}"/>
                                <a  href="editContent?newsFeedId=${eventOne.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${eventOne.content}"/>
                            </p>
                        </div>
                        <div class="container pre-posts">
                            <p><c:out value="${eventTwo.name}"/>
                                <a  href="editContent?newsFeedId=${eventTwo.newsFeedId}">
                                    <button class="edit-btn btn btn-info" >Edit</button></a>
                            </p>
                            <p>
                                <c:out value="${eventTwo.content}"/>
                            </p>
                        </div>
                        <hr>

                            <div class="container pre-posts">
                               <sf:form role="form" action="updateHomeImg" method="POST" >
                            <div class="form-group">
                                <div class="col-md-8">
                                    <label><c:out value="${message}"/></label>
                                    <input type="text" class="form-control" name="idInput" placeholder="Please enter image number" required/>
                                    <label><c:out value="${linkOut}"/></label>
                                    <input type="text" class="form-control" name="imgLink" placeholder="Link to your Photo"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                            <input type="submit" class="btn btn-info" value="Update"/>
                                </div>
                            </div>
                        </sf:form>
                            </div>
                             <hr>
                            <div class="container admin-note">

                                <p>
                                    Current Users | ${usersCount} | 
                                </p>

                            </div>
                       
                        <!--All users-->
                        <div class="container user-box" id="user-table" >
                            <c:forEach var="currentUser" items="${userList}">
                                <div class="container user-box" > 
                                    <p> ${name}${currentUser.firstName} ${currentUser.lastName} |
                                        ${userName}: ${currentUser.userName}
                                    </p>   
                                    <p>
                                        <c:if test="${currentUser.enable == true}">
                                            User is: Enabled
                                        </c:if>
                                        <c:if test="${currentUser.enable == false}">
                                            User is: Disabled
                                        </c:if> 
                                        <sf:form role="form" action="enabledUser" method="POST" >
                                            <input type="hidden" name="userId" value="${currentUser.userId}"/>
                                            <button type="submit" class="edit-btn btn btn-danger " >Enable</button>
                                        </sf:form>

                                        <sf:form role="form" action="disabledUser" method="POST" >
                                            <input type="hidden" name="userId" value="${currentUser.userId}"/>
                                            <button type="submit" class="btn btn-danger " >Disable</button>
                                        </sf:form>
                                    </p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr> </hr>         
                    <footer id="footer"></footer>
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/Home.js"></script>

                </body>
                </html>
