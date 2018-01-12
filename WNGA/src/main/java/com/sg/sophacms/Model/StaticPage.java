/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Model;

import java.util.Objects;

/**
 *
 * @author ritheenhep
 */
public class StaticPage {

    private int staticPageId;
    private String page;
    private String content;
    private User user;

    public int getStaticPage() {
        return staticPageId;
    }

    public void setStaticPage(int staticPage) {
        this.staticPageId = staticPage;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
        hash = 97 * hash + this.staticPageId;
        hash = 97 * hash + Objects.hashCode(this.page);
        hash = 97 * hash + Objects.hashCode(this.content);
        hash = 97 * hash + Objects.hashCode(this.user);
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
        final StaticPage other = (StaticPage) obj;
        if (this.staticPageId != other.staticPageId) {
            return false;
        }
        if (!Objects.equals(this.page, other.page)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        return true;
    }

}
