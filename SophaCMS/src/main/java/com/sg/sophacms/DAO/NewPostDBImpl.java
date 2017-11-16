/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import static com.sg.sophacms.DAO.PrepareStatement.SQL_INSERT_INTO_NEW_POST;
import com.sg.sophacms.Model.NewPost;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author ritheenhep
 */
public class NewPostDBImpl implements NewPostDao{
    
        private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addNewPost(NewPost newPost) {
        jdbcTemplate.update(SQL_INSERT_INTO_NEW_POST,
                newPost.getTitle(),
                newPost.getContent(),
                newPost.getImagePath(),
                newPost.getPublishDate(),
                newPost.getExpireDate(),
                newPost.getUser().getUserId());
        newPost.setPostId(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
    }

    @Override
    public void deletePost(int newPostId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updatePost(NewPost newPost) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NewPost getPostById(int newPostId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<NewPost> getAllPost() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
