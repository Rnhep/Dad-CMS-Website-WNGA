/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

import com.sg.wnga.Model.NewsFeed;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface NewsFeedDao {

    public void addNewsFeed(NewsFeed news);

    public void deleteNewsFeed(int newsId);
    
    public NewsFeed getNewsFeedById(int newsId);

    public void updateNewsFeed(NewsFeed newsId);

    public List<NewsFeed> getAllNews();

}
