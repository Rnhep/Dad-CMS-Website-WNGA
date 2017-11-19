/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.NewPost;
import com.sg.sophacms.Model.User;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface NewPostDao {

    public void addNewPost(NewPost newPost);

    public void deletePost(int newPostId);

    public void updatePost(NewPost newPost);

    public NewPost getPostById(int newPostId);

    public NewPost getUserByPostId(int newPostId);

    public List<NewPost> getAllPost();

}
