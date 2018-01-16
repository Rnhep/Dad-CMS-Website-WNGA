/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;
import com.sg.wnga.DAO.UserDao;
import com.sg.wnga.Model.User;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ritheenhep
 */
@Controller
public class UserProfileController {
    
   private final UserDao userDao;
       private final PasswordEncoder encoder;
   String passwordField;
   
   @Inject
   public UserProfileController(UserDao userDao, PasswordEncoder encoder){
       this.userDao = userDao;
       this.encoder = encoder;
   }
   @RequestMapping(value = "/userProfile", method = RequestMethod.GET)  
   public String userProfile(HttpServletRequest rq, Model model){
   int userId=0;
        List<User> allUsers = userDao.getAllUsers();
        for (User currentUser : allUsers) {
            boolean findUser = false;
            String userName = rq.getParameter("userName");
            if(currentUser.getUserName().equalsIgnoreCase(userName))
                    userId = currentUser.getUserId();
            findUser= true;
        } 
        User currentUser = userDao.getUserbyId(userId);
        String message ="Current User Profile";
        String currentPsw ="Current Password";
        String pswMessage = "Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters";
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("message", message);
        model.addAttribute("currentPsw", currentPsw);
        model.addAttribute("pswMessage", pswMessage);
        model.addAttribute("passwordField", passwordField);
       return "UserProfile";
   }
  
    
   @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
   public String editProfile(@Valid @ModelAttribute("currentUser")User currentUser, BindingResult result){
       if(result.hasErrors()){
       return "redirect:userProfile";
       }
       userDao.updateUser(currentUser);
       return "UserProfile";
   }
   
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
   public String editPassword(@Valid @ModelAttribute("currentUser")User currentUser, BindingResult result, HttpServletRequest rq){
       String password = rq.getParameter("password");
       String confirmPassword = rq.getParameter("confirmPassword");
       if(result.hasErrors()){
       return "redirect:userProfile";
       }
        if ( password == null || password.trim().length() == 0
                || !confirmPassword.equals(password)) {
        //redirect to resubmitForm with value entered. 
            
            passwordField = "Something wrong with your update. Please check your Password again";
            return "redirect:resubmitForm";
        }
        User updatePsw = new User();
         String hasPw = encoder.encode(password);

        updatePsw.setPassWord(hasPw);
       userDao.updateUser(updatePsw);
       
       
       return "UserProfile";
   }
   
}
