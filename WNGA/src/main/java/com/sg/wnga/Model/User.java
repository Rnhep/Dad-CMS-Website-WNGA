/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Objects;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 *
 * @author ritheenhep
 */
public class User {

    private int userId;
    @NotEmpty(message = "First Name is empty")
    private String firstName;
    @NotEmpty(message = "Last Name is empty")
    private String lastName;
    @Email(message = "Email is empty")
    private String email;
    @NotEmpty(message = "User Name is empty")
    private String userName;
    @NotEmpty(message = "Password is empty")
    private String passWord;
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate joinDate;
    private boolean enable;
    private String photo;
    private ArrayList<String> authorities = new ArrayList<>();

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate jointDate) {
        this.joinDate = jointDate;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public ArrayList<String> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(ArrayList<String> authorities) {
        this.authorities = authorities;
    }

    public void addAuthority(String authority) {
        authorities.add(authority);

    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + this.userId;
        hash = 37 * hash + Objects.hashCode(this.firstName);
        hash = 37 * hash + Objects.hashCode(this.lastName);
        hash = 37 * hash + Objects.hashCode(this.email);
        hash = 37 * hash + Objects.hashCode(this.userName);
        hash = 37 * hash + Objects.hashCode(this.passWord);
        hash = 37 * hash + Objects.hashCode(this.joinDate);
        hash = 37 * hash + (this.enable ? 1 : 0);
        hash = 37 * hash + Objects.hashCode(this.photo);
        hash = 37 * hash + Objects.hashCode(this.authorities);
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
        final User other = (User) obj;
        if (this.userId != other.userId) {
            return false;
        }
        if (this.enable != other.enable) {
            return false;
        }
        if (!Objects.equals(this.firstName, other.firstName)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.userName, other.userName)) {
            return false;
        }
        if (!Objects.equals(this.passWord, other.passWord)) {
            return false;
        }
        if (!Objects.equals(this.photo, other.photo)) {
            return false;
        }
        if (!Objects.equals(this.joinDate, other.joinDate)) {
            return false;
        }
        if (!Objects.equals(this.authorities, other.authorities)) {
            return false;
        }
        return true;
    }

}
