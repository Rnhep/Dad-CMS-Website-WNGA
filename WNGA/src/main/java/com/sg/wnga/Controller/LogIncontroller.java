/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;
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
    
      
       String message;
  

   
     //log in
    @RequestMapping(value = "/signIn", method = RequestMethod.GET)
    public String signinform(Model model) {
        String signUp = "| New User |";
        String password = "| Forgot User Name or Password?";
        model.addAttribute("signUp", signUp);
        model.addAttribute("password", password);
        return "SignIn";
    }
    

}
