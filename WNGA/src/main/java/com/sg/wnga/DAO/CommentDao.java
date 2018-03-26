/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;
import com.sg.wnga.Model.Comment;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface CommentDao {
    
    public void addComment(Comment comment);
    
    public void deleteComment(int commentId);
    
    public void getCommentById(int commentId);
    
    public List<Comment> getAllComment();
}
