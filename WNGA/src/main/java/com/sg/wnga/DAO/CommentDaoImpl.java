/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

import static com.sg.wnga.DAO.PrepareStatement.*;
import com.sg.wnga.DAO.RowMappers.CommentMapper;
import com.sg.wnga.DAO.RowMappers.NewPostMapper;
import com.sg.wnga.DAO.RowMappers.UserMapper;
import com.sg.wnga.Model.Comment;
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
public class CommentDaoImpl implements CommentDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addComment(Comment comment) {
        jdbcTemplate.update(SQL_INSERT_INTO_COMMENT,
                comment.getComment(),
                comment.getPublishDate().toString(),
                comment.getUser().getUserId(),
                comment.getNewPost().getPostId());
        comment.setCommentId(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteComment(int commentId) {
        jdbcTemplate.update(SQL_DELETE_COMMENT, commentId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateComment(Comment comment) {
        jdbcTemplate.update(SQL_UPDATE_COMMENT,
                comment.getComment(),
                comment.getPublishDate().toString(),
                comment.getUser().getUserId(),
                comment.getNewPost().getPostId(),
                comment.getCommentId());
    }

    @Override
    public Comment getCommentById(int commentId) {
        try {
            Comment comment = jdbcTemplate.queryForObject(SQL_SELECT_COMMENT_BYID,
                    new CommentMapper(), commentId);
            comment.setUser(findUserForComment(comment));
            comment.setNewPost(findPostForComment(comment));
            return comment;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Comment> getAllComment() {
        List<Comment> allComments = jdbcTemplate.query(SQL_SELECT_ALL_COMMENT, new CommentMapper());
        return associateUserCommentAndPost(allComments);
    }

    //NEEDS QUERY USER FROM COMMENT
    public User findUserForComment(Comment comment) {
        return jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_COMMENT,
                new UserMapper(), comment.getCommentId());
    }

    //NEEDS QUERY POST FROM COMMNET
    public NewPost findPostForComment(Comment comment) {
        return jdbcTemplate.queryForObject(SQL_SELECT_POST_BY_COMMENT,
                new NewPostMapper(), comment.getCommentId());
    }

    public List<Comment> associateUserCommentAndPost(List<Comment> commentList) {
        for (Comment currentComment : commentList) {
            currentComment.setUser(findUserForComment(currentComment));
            currentComment.setNewPost(findPostForComment(currentComment));
        }
        return commentList;
    }

}
