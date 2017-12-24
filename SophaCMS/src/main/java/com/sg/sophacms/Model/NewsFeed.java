/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Model;

import java.time.LocalDate;

import java.util.Objects;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 *
 * @author ritheenhep
 */
public class NewsFeed {
    
    private int newsFeedId;
    @NotEmpty(message ="Title must not be empty!")
    private String title;
    @NotEmpty(message ="Content must not be empty!")
    private String content;
     @DateTimeFormat(iso = ISO.DATE)
    private LocalDate date;

    public int getNewsFeedId() {
        return newsFeedId;
    }

    public void setNewsFeedId(int newsFeedId) {
        this.newsFeedId = newsFeedId;
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

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 23 * hash + this.newsFeedId;
        hash = 23 * hash + Objects.hashCode(this.title);
        hash = 23 * hash + Objects.hashCode(this.content);
        hash = 23 * hash + Objects.hashCode(this.date);
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
        final NewsFeed other = (NewsFeed) obj;
        if (this.newsFeedId != other.newsFeedId) {
            return false;
        }
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.date, other.date)) {
            return false;
        }
        return true;
    }

 
    
}