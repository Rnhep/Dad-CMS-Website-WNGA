/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.NewPost;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface NewPostDao {

    public void addNewPost();

    public void deletePost();

    public void updatePost();

    public NewPost getPostById();

    public NewPost getPostByUser();

    public List<NewPost> getAllPost();

}
