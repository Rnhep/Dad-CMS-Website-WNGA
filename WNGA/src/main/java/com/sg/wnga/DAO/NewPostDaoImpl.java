/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

import static com.sg.wnga.DAO.PrepareStatement.*;
import com.sg.wnga.DAO.RowMappers.*;
import com.sg.wnga.Model.NewPost;
import com.sg.wnga.Model.User;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ritheenhep
 */
public class NewPostDaoImpl implements NewPostDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNewPost(NewPost newPost) {
        jdbcTemplate.update(SQL_INSERT_INTO_NEW_POST,
                newPost.getTitle(),
                newPost.getContent(),
                newPost.getImagePath(),
                newPost.getImagePathTwo(),
                newPost.getPublishDate().toString(),
                newPost.getUser().getUserId());
        newPost.setPostId(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deletePost(int newPostId) {
        jdbcTemplate.update(SQL_DELETE_POST_FROM_COMMENT, newPostId);
        jdbcTemplate.update(SQL_DELETE_NEW_POST, newPostId);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updatePost(NewPost newPost) {
        jdbcTemplate.update(SQL_UPDATE_NEW_POST,
                newPost.getTitle(),
                newPost.getContent(),
                newPost.getImagePath(),
                newPost.getImagePathTwo(),
                newPost.getPublishDate().toString(),
                newPost.getUser().getUserId(),
                newPost.getPostId());
    }

    @Override
    public NewPost getPostById(int newPostId) {
        try {
            NewPost newPost = jdbcTemplate.queryForObject(SQL_SELECT_NEW_POST_BY_ID, 
                    new NewPostMapper(), newPostId);
            newPost.setUser(findUserForPost(newPost));
            return newPost;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public NewPost getUserByPostId(int newPostId) {
        try {

            NewPost newPost = jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_POST_ID, 
                    new NewPostMapper(), newPostId);
            newPost.setUser(findUserForPost(newPost));
            return newPost;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<NewPost> getAllPost() {
        List<NewPost> allPost = jdbcTemplate.query(SQL_SELECT_ALL_NEW_POST, new NewPostMapper());
        return associateUserAndPost(allPost);
    }

    @Override
    public List<NewPost> getLatestPost() {
        List<NewPost> latestPost = jdbcTemplate.query(SLQ_GET_LATEST_POST, new NewPostMapper());
        return associateUserAndPost(latestPost);
    }

    public User findUserForPost(NewPost newPost) {
        return jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_NEW_POST,
                new UserMapper(), newPost.getPostId());
    }

    public List<NewPost> associateUserAndPost(List<NewPost> newPostList) {
        for (NewPost currentPost : newPostList) {
            currentPost.setUser(findUserForPost(currentPost));
        }
        return newPostList;
    }

}
