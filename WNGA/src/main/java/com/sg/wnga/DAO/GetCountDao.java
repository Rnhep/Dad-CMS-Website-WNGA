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
public interface GetCountDao {
    
    public long getNewsFeedCount();
    
    public long getNewPostCount();
    
    public long getUserCount();
    
    public void cleanUpNews();
    
    public void cleanUpPosts();
    
   
}
