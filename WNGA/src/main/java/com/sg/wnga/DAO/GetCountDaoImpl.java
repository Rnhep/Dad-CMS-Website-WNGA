/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

import static com.sg.wnga.DAO.PrepareStatement.*;
import javax.sql.DataSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author ritheenhep
 */
public class GetCountDaoImpl implements GetCountDao {

    private JdbcTemplate jdbcTemplate;
    private DataSource dataSource;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public long getNewsFeedCount() {
        try {
            long newsFeedCount = jdbcTemplate.queryForObject(SQL_GET_COUNT_FROM_NEWSFEED, Integer.class);
            return newsFeedCount;
        } catch (EmptyResultDataAccessException ex) {
            return 0;
        }
    }

    @Override
    public long getNewPostCount() {
        try {
            long newPostCount = jdbcTemplate.queryForObject(SQL_GET_COUNT_FROM_NEW_POST, Integer.class);
            return newPostCount;
        } catch (EmptyResultDataAccessException ex) {
            return 0;
        }
    }

    @Override
    public long getUserCount() {
        try {
            long userCount = jdbcTemplate.queryForObject(SQL_GET_COUNT_FROM_USER, Integer.class);
            return userCount;
        } catch (EmptyResultDataAccessException ex) {
            return 0;
        }

    }

    @Override
    public void cleanUpNews() {
    jdbcTemplate.update(SQL_CLEANUP_NEWS);
    }

    @Override
    public void cleanUpPosts() {
    jdbcTemplate.update(SQL_CLEANUP_POSTS);
    }

}
