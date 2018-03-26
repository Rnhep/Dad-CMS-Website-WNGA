/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Model;

import org.hibernate.validator.constraints.NotEmpty;


/**
 *
 * @author ritheenhep
 */
public class Comment {
    
    int relyId;
    @NotEmpty(message ="Must not be empty!")
    String comment;
    private NewPost newPost;

    
    
}
