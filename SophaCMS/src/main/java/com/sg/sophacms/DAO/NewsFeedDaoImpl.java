/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import static com.sg.sophacms.DAO.PrepareStatement.*;
import com.sg.sophacms.DAO.RowMappers.NewsFeedMapper;
import com.sg.sophacms.Model.NewsFeed;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ritheenhep
 */
public class NewsFeedDaoImpl implements NewsFeedDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNewsFeed(NewsFeed news) {
        jdbcTemplate.update(SQL_INSERT_INTO_NEWS_FEED,
                news.getTitle(),
                news.getDate().toString(),
                news.getContent());
        news.setNewsFeedId(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteNewsFeed(int newsId) {
      jdbcTemplate.update(SQL_DELETE_NEWS_FEED, newsId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateNewsFeed(NewsFeed newsFeed) {
        jdbcTemplate.update(SQL_UPDATE_NEWS_FEED,
                newsFeed.getTitle(),
                newsFeed.getDate().toString(),
                newsFeed.getContent(),
                newsFeed.getNewsFeedId());
    }

    @Override
    public List<NewsFeed> getAllNews() {
        List<NewsFeed> allNews= jdbcTemplate.query(SQL_SELECT_ALL_NEWS_FEED, new NewsFeedMapper());
        return allNews;
    }

    @Override
    public NewsFeed getNewsFeedById(int newsId) {
        try{
            NewsFeed news = jdbcTemplate.queryForObject(SQL_SELECT_NEWS_FEED_BY_ID, new NewsFeedMapper(), newsId);
            return news;
        }catch(EmptyResultDataAccessException ex){
            return null;
        }
    }

}
