/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.User;
import static com.sg.sophacms.DAO.PrepareStatement.*;
import com.sg.sophacms.DAO.RowMappers.UserMapper;
import java.util.ArrayList;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ritheenhep
 */
public class UserDaoImpl implements UserDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addUser(User user) {
        jdbcTemplate.update(SQL_INSERT_INTO_USER,
                user.getFirstName(),
                user.getLastName(),
                user.getUserName(),
                user.getPassWord(),
                user.getEmail(),
                user.getPhone(),
                user.isEnable());
        user.setUserId(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));

        ArrayList<String> authorities = user.getAuthorities();
        for (String authority : authorities) {
            jdbcTemplate.update(SQL_INSERT_AUTHORITY,
                    user.getUserName(),
                    authority);
        }

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteUser(String userName) {
        jdbcTemplate.update(SQL_DELETE_USER, userName);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateUser(User user) {
        jdbcTemplate.update(SQUL_UPDATE_USER,
                user.getFirstName(),
                user.getLastName(),
                user.getUserName(),
                user.getPassWord(),
                user.getEmail(),
                user.getPhone());
    }

    @Override
    public User getUserByUserName(String userName) {
        try {
            User user = jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_USER_NAME, new UserMapper(), userName);
            return user;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public User getUserbyId(int userId) {
        try {
            User user = jdbcTemplate.queryForObject(SQL_SELECT_USER_BY_ID, new UserMapper(), userId);
            //need helper method
            return user;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<User> getAllUsers() {
        List<User> allUsers = jdbcTemplate.query(SQL_SELECT_ALL_USER, new UserMapper());
        return allUsers;
    }

}
