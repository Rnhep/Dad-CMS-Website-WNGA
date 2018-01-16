/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.DAO;

import com.sg.wnga.Model.User;
import java.util.List;

/**
 *
 * @author ritheenhep
 */
public interface UserDao {

    public void addUser(User user);

    public void deleteUser(String userName);

    public void updateUser(User user);
    
    public User getUserByUserName(String user);

    public User getUserbyId(int userId);

    public List<User> getAllUsers();
}
