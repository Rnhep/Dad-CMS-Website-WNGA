/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Model;


import java.time.LocalDate;
import java.util.Objects;

/**
 *
 * @author ritheenhep
 */
public class NewPost {
    private int postId;
    private String title;
    private String content;
    private String imagePath;
    private LocalDate publishDate;
    private LocalDate expireDate;
    private User user;

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public LocalDate getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(LocalDate publishDate) {
        this.publishDate = publishDate;
    }

    public LocalDate getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(LocalDate expireDate) {
        this.expireDate = expireDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.postId;
        hash = 29 * hash + Objects.hashCode(this.title);
        hash = 29 * hash + Objects.hashCode(this.content);
        hash = 29 * hash + Objects.hashCode(this.imagePath);
        hash = 29 * hash + Objects.hashCode(this.publishDate);
        hash = 29 * hash + Objects.hashCode(this.expireDate);
        hash = 29 * hash + Objects.hashCode(this.user);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final NewPost other = (NewPost) obj;
        if (this.postId != other.postId) {
            return false;
        }
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.imagePath, other.imagePath)) {
            return false;
        }
        if (!Objects.equals(this.publishDate, other.publishDate)) {
            return false;
        }
        if (!Objects.equals(this.expireDate, other.expireDate)) {
            return false;
        }
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        return true;
    }

    
}
