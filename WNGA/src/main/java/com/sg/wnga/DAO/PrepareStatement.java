/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

/**
 *
 * @author ritheenhep
 */
public class PrepareStatement {

    //user table
    protected static final String SQL_INSERT_INTO_USER
            = "insert into User "
            + "(FirstName, LastName, UserName, UserPassword, Email, JointDate, Enabled, Photo)values(?,?,?,?,?,?,?,?)";

    protected static final String SQUL_UPDATE_USER
            = "update User set FirstName = ?, LastName = ?,"
            + " UserName = ?,  UserPassword = ?, Email = ?, JointDate = ?, Enabled = ?, Photo = ? "
            + " where UserId = ? ";

    protected static final String SQL_DELETE_USER
            = "delete from User where userName = ?";

    protected static final String SQL_SELECT_ALL_USER
            = "select * from User";

    protected static final String SQL_SELECT_USER_BY_ID
            = "select * from User "
            + " where userId = ?";

    protected static final String SQL_SELECT_NEW_POST_BY_USER_ID
            = "select np.* from New_Post np "
            + "inner join User u on u.userId = np.userId "
            + "where u.userId= ?";
    protected static final String SQL_SELECT_USER_BY_USER_NAME
            = "select * from User "
            + "where UserName = ?";
    protected static final String SQL_INSERT_AUTHORITY
            = "insert into Authorities(UserName, Authority)values(?, ? ) ";
    protected static final String SQL_DELETE_AUTHORITIES
            = "delete from Authorities where username = ?";

    //new post
    protected static final String SQL_INSERT_INTO_NEW_POST
            = "insert into New_Post "
            + "(Title, Content, ImagePath, ImagePathTwo, PublishDate, UserId)values(?,?,?,?,?,?)";

    protected static final String SQL_UPDATE_NEW_POST
            = " update New_Post set Title = ?, Content = ?, "
            + "ImagePath = ?, ImagePathTwo= ?, PublishDate = ?, UserId = ? "
            + "where postId=?";

    protected static final String SQL_SELECT_USER_BY_NEW_POST
            = "select u.* from User u "
            + "inner join New_Post np on np.UserId = u.UserId "
            + "where np.PostId = ?";

    protected static final String SQL_SELECT_USER_BY_COMMENT
            = "select u.* from User u "
            + "inner join Comment c on c.userId = u.userId "
            + "where c.CommentId=? ";

    protected static final String SQL_DELETE_NEW_POST
            = "delete from New_Post where PostId = ? ";

    protected static final String SQL_SELECT_ALL_NEW_POST
            = "select * from New_Post order by PostId desc";

    protected static final String SLQ_GET_LATEST_POST
            = "select *  from New_Post ORDER BY PostId desc limit 5 ";

    protected static final String SQL_SELECT_USER_BY_POST_ID
            = "select * from New_Post np "
            + "inner join User u on u.userId = np.UserId "
            + "where np.postId = ?";

    protected static final String SQL_SELECT_NEW_POST_BY_ID
            = "select * from New_Post where PostId = ?";

    //news Feed
    protected static final String SQL_INSERT_INTO_NEWS_FEED
            = "insert into News_Feed (Title, Date, Link, Content)values(?,?,?,?)";

    protected static final String SQL_UPDATE_NEWS_FEED
            = "update News_Feed set Title = ?, Date = ?, Link= ?, Content = ? "
            + "where NewsFeedId = ?";

    protected static final String SQL_DELETE_NEWS_FEED
            = "delete from News_Feed where NewsFeedId = ?";

    protected static final String SQL_SELECT_NEWS_FEED_BY_ID
            = "select * from News_Feed "
            + "where NewsFeedId = ?";

    protected static final String SQL_SELECT_ALL_NEWS_FEED
            = "select * from News_Feed where NewsFeedId >=7 order by NewsFeedId desc";

    //static page
    protected static final String SQL_INSERT_INTO_STATIC_PAGE
            = "insert into Static_Page (Page, Content, UserId)values(?,?,?)";

    protected static final String SQL_UPDATE_STATIC_PAGE
            = "update Static_page set Page = ?, Content = ?, UserId = ? "
            + "where Static_pageId = ?";

    protected static final String SQL_DELETE_STATIC_PAGE
            = "delete from Static_Page where StaticPageId = ?";

    protected static final String SQL_SELECT_ALL_STATIC_PAGE
            = "select * from Static_Page";

    protected static final String SQL_SELECT_STATIC_PAGE_BY_ID
            = "select * from Static_page where StaticPageId = ?";
    //count number of row
    protected static final String SQL_GET_COUNT_FROM_USER
            = "select count(*)from User";

    protected static final String SQL_GET_COUNT_FROM_NEWSFEED
            = "select count(*)from News_Feed";

    protected static final String SQL_GET_COUNT_FROM_NEW_POST
            = "select count(*)from New_Post";

    protected static final String SQL_INSERT_INTO_COMMENT
            = "insert into Comment (Comment, PublishDate, UserId, PostId)value(?, ?, ?, ?)";

    protected static final String SQL_UPDATE_COMMENT
            = "update Comment set Comment = ?, PublishDate = ?, UserId = ?, PostId = ? "
            + "where CommentId = ? ";
    protected static final String SQL_DELETE_POST_FROM_COMMENT
            = "delete from Comment where PostId = ? ";

    protected static final String SQL_DELETE_USER_FROM_COMMENT
            = "delete from Comment where UserId = ? ";

    protected static final String SQL_SELECT_COMMENT_BYID
            = "select * from Comment where CommentId=?";

    protected static final String SQL_DELETE_COMMENT
            = "delete from Comment where CommentId = ?";

    protected static final String SQL_SELECT_COMMENT_PER_POST
            = "select u.username, c.comment from comment "
            + "inner join New_Post np on np.postId = c.postid "
            + "inner join user u on u.userId=c.postid "
            + "where np.postId= ? ";

    protected static final String SQL_SELECT_POST_BY_COMMENT
            = "select np.* from New_Post np "
            + "inner join Comment c on c.PostId = np.PostId "
            + "where c.CommentId=?";
    protected static final String SQL_GET_COMMENTS_COUNT
            = "select count(*) from  comment c " 
            + "inner join New_post np on np.postId = c.postId " 
            + "where np.postid= ? ";
    protected static final String SQL_SELECT_ALL_COMMENT
            = "select * from Comment ";
    
    protected static final String SQL_CLEANUP_NEWS
            = "delete from News_Feed where NewsFeedId>=8 limit 100";

    protected static final String SQL_CLEANUP_POSTS
            = "delete from New_Post where PostId order by PostId asc limit 100";

}
