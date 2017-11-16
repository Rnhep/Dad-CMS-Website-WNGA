/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

/**
 *
 * @author ritheenhep
 */
public class PrepareStatement {

    //user table
    protected static final String SQL_INSERT_INTO_USER
            = "insert into user "
            + "(FirstName, LastName, Email, Phone, UserName, Password)values(?,?,?,?,?,?)";
    
    protected static final String SQUL_UPDATE_USER
            = "update user set FirstName = ?, LastName = ? , Email = ?, "
            + "Phone = ?, UserName = ?,  Password = ?";
    
    protected static final String SQL_DELETE_USER
            = "delet from user where userId = ?";
    
    protected static final String SQL_SELECT_ALL_USER
            = "select * from user";
    
    protected static final String SQL_SELECT_USER_BY_ID
            = "select * from user "
            + " where userId = ?";
    
    protected static final String SQL_SELECTUSER_BY_NAME
            = "select u.name from user u "
            + "where userId = ?";
    
    //new post
    protected static final String SQL_INSERT_INTO_NEW_POST
            ="insert into NewPost"
            + "(Title, Content, ImagePath, PublishDate, ExpireDate, UseId, StatusId)values(?,?,?,?,?,?,?)";
    
    protected static final String SQL_UPDATE_NEW_POST
            =" update New_Post set Title = ?, Content = ?, "
            + "ImagePath = ?, PublishDate = ?, ExpireDate = ?,"
            + " UserId = ?, StatusId = ?";
    
    protected static final String SQL_DELETE_NEW_POST
            = "delete from New_Post where PostId = ? ";
   
    protected static final String SQL_SELECT_ALL_NEW_POST
            ="select * from New_Post";
    
    protected static final String SQL_SELECT_NEW_POST_BY_ID
            ="select * from New_Post where New_PostId = ?";
    
    
    //news Feed
    
    protected static final String SQL_INSERT_INTO_NEWS_FEED
            ="insert into News_Feed (Content, Date)values(?,?)";
    
    protected static final String SQL_UPDATE_NEWS_FEED
            ="update News_Feed set Content = ?, Date = ?";
    
    protected static final String SQL_DELETE_NEWS_FEED
            ="delete from News_Feeds where NewsFeedId = ?";
    
    protected static final String SQL_SELECT_ALL_NEWS_FEED
            ="select * from News_Feed";
    
}
