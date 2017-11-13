/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Controller;

import com.sg.sophacms.DAO.NewPostDao;
import com.sg.sophacms.DAO.UserDao;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ritheenhep
 */
@Controller
public class MainController {

    UserDao userDao;
    NewPostDao NPDao;
        
    @Inject
    public MainController(UserDao userDao, NewPostDao NPDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
    }

    
     @RequestMapping(value = "/", method = RequestMethod.GET)
     public String home(HttpServletRequest request, Model model){
        return "index"; 
     }
}
