/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Controller;

import com.sg.sophacms.DAO.UserDao;
import com.sg.sophacms.Model.User;
import java.util.ArrayList;
import java.util.List;
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
public class LogIncontroller {
    
       UserDao userDao;
       String message;
  

    @Inject
    public LogIncontroller(UserDao userDao) {
        this.userDao = userDao;
    
    }
     //log in
    @RequestMapping(value = "/signIn", method = RequestMethod.GET)
    public String signinform(Model model) {
        String signUp = "| Sign Up";
        String password = "| Forgot User Name or Password?";
        model.addAttribute("signUp", signUp);
        model.addAttribute("password", password);
        return "SignInPage";
    }
    
     //log in
    @RequestMapping(value = "/signInVerification", method = RequestMethod.POST)
    public String signInVerification(HttpServletRequest rq) {
        List<User> allUsers = new ArrayList<>();
        allUsers = userDao.getAllUsers();
        String userName = rq.getParameter("userName");
        String password = rq.getParameter("password");
        for(User currentUser: allUsers){
            if(!currentUser.getUserName().equals(userName) ||
                    !currentUser.getPassWord().equals(password)){
                message = "User Name or Password incorrect";
                return "redirect:/";
            }
        }
        
        
        return "SignInPage";
    }
    
}
