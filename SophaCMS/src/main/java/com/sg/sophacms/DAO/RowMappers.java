/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.DAO;

import com.sg.sophacms.Model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author ritheenhep
 */
public class RowMappers {
    
    //user Mapper
    
    protected static final class UserMapper implements RowMapper<User>{

        @Override
        public User mapRow(ResultSet rs, int i) throws SQLException {
            User user = new User();
            user.setFirstName(rs.getString("FirstName"));
            user.setLastName(rs.getString(("LastName")));
            user.setUserName(rs.getString("UserName"));
            user.setPassWord(rs.getString("Password"));
            user.setEmail(rs.getString(("Email")));
            user.setPhone(rs.getString("Phone"));
            user.setUserId(rs.getInt("UserId"));
            return user;
        }   
    }
    
}
