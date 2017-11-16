/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.User;
import static com.sg.sophacms.DAO.PrepareStatement.*;
import com.sg.sophacms.DAO.RowMappers.UserMapper;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author ritheenhep
 */
public class UserDBImpl implements UserDao{
    
      private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addUser(User user) {
        jdbcTemplate.update(SQL_INSERT_INTO_USER, 
                user.getFirstName(),
                user.getLastName(),
                user.getUserName(),
                user.getEmail(),
                user.getPhone(),
                user.getPassWord()
                );
        user.setUserId(jdbcTemplate.queryForObject("select LAST_INSER_ID()", Integer.class));
        //need  helper method
    }
    

    @Override
    public void deleteUser(int userId) {
        jdbcTemplate.update(SQL_DELETE_USER,  userId);
    }

    @Override
    public void updateUser(User user) {
        jdbcTemplate.update(SQUL_UPDATE_USER,
                user.getFirstName(),
                user.getLastName(),
                user.getUserName(),
                user.getPassWord(),
                user.getEmail(),
                user.getPhone());
    }

//    @Override
//    public User getUserByUserName(User user) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

    @Override
    public User getUserbyId(int userId) {
       try{
           User user = jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_ID, new UserMapper(), userId);
      //need helper method
           return user;
       }catch(EmptyResultDataAccessException ex){
           return null;
       }
    }

    @Override
    public List<User> getAllUsers() {
        List <User> allUsers = jdbcTemplate.query(SQL_SELECT_ALL_USER, new UserMapper());
        return allUsers;
    }
    
    
    
}
