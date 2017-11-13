/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.User;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface UserDao {

    public void addUser();

    public void deleteUser();

    public void updateUser();

    public User getUserByUserName();

    public User getUserbyId(User user);

    public List<User> getAllUser();
}
