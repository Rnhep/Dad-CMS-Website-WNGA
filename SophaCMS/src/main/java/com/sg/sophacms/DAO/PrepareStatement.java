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
            + "(FirstName, LastName, UserName, UserPassword, Email, Phone, Enabled)values(?,?,?,?,?,?,?)";

    protected static final String SQUL_UPDATE_USER
            = "update user set FirstName = ?, LastName = ?,"
            + " UserName = ?,  UserPassword = ?, Email = ?, Phone = ?";

    protected static final String SQL_DELETE_USER
            = "delete from user where userName = ?";

    protected static final String SQL_SELECT_ALL_USER
            = "select * from user";

    protected static final String SQL_SELECT_USER_BY_ID
            = "select * from user "
            + " where userId = ?";

    protected static final String SQL_SELECT_NEW_POST_BY_USER_ID
            = "select np.* from New_Post np "
            + "inner join User u on u.userId = np.userId "
            + "where u.userId= ?";
    protected static final String SQL_SELECT_USER_BY_USER_NAME
            = "select * from user "
            + "where UserName = ?";
    protected static final String SQL_INSERT_AUTHORITY
            = "insert into Authority(UserName, Authority)values(?, ? ) ";

    //new post
    protected static final String SQL_INSERT_INTO_NEW_POST
            = "insert into NewPost"
            + "(Title, Content, ImagePath, PublishDate, ExpireDate, UseId)values(?,?,?,?,?,?)";

    protected static final String SQL_UPDATE_NEW_POST
            = " update New_Post set Title = ?, Content = ?, "
            + "ImagePath = ?, PublishDate = ?, ExpireDate = ?,"
            + " UserId = ?, StatusId = ?";

    protected static final String SQL_SELECT_USER_BY_NEW_POST
            = "select u.* from User u "
            + "inner join New_Post np on np.UserId = u.UserId "
            + "where np.PostId = ?";

    protected static final String SQL_DELETE_NEW_POST
            = "delete from New_Post where PostId = ? ";

    protected static final String SQL_SELECT_ALL_NEW_POST
            = "select * from New_Post";

    protected static final String SQL_SELECT_NEW_POST_BY_ID
            = "select * from New_Post where New_PostId = ?";

    //news Feed
    protected static final String SQL_INSERT_INTO_NEWS_FEED
            = "insert into News_Feed (Content, Date)values(?,?)";

    protected static final String SQL_UPDATE_NEWS_FEED
            = "update News_Feed set Content = ?, Date = ?";

    protected static final String SQL_DELETE_NEWS_FEED
            = "delete from News_Feeds where NewsFeedId = ?";

    protected static final String SQL_SELECT_ALL_NEWS_FEED
            = "select * from News_Feed";

    //static page
    protected static final String SQL_INSERT_INTO_STATIC_PAGE
            = "insert into Static_Page (Page, Content, UserId)values(?,?,?)";

    protected static final String SQL_UPDATE_STATIC_PAGE
            = "update Static_page set Page = ?, Content = ?, UserId = ?";

    protected static final String SQL_DELETE_STATIC_PAGE
            = "delete from Static_Page where StaticPageId = ?";

    protected static final String SQL_SELECT_ALL_STATIC_PAGE
            = "select * from Static_Page";

    protected static final String SQL_SELECT_STATIC_PAGE_BY_ID
            = "select * from Static_page where StaticPageId = ?";
}
