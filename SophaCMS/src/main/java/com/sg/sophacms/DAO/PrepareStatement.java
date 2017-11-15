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
    protected final String SQL_INSERT_INTO_USER
            = "insert into user "
            + "(FirstName, LastName, Email, Phone, UserName, Password)values(?,?,?,?,?,?) ";
    
    protected final String SQUL_UPDATE_USER
            = "update user set FirstName = ?, LastName = ? , Email = ?, "
            + "Phone = ?, UserName = ?,  Password = ? ";
    
    protected final String SQL_DELETE_USER
            = "delet from user where userId = ?";
    
    protected final String SQL_SELECT_ALL_USER
            = "select * from user";
    
    protected final String SQL_SELECT_USER_BY_ID
            = "select * from user "
            + " where userId=?";
    
    protected final String SQL_SELECTUSER_BY_NAME
            = "select u.name from user u "
            + "where userId = ?";
    
    //new post
    protected final String SQL_INSERT_INTO_NEW_POST
            ="insert into NewPost"
            + "(Title, Content, ImagePath, PublishDate,)values(?,?,?,?)";
}
