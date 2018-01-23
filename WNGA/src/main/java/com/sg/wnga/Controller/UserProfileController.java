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
   
    @Inject
    public UserProfileController(UserDao userDao, PasswordEncoder encoder) {
        this.userDao = userDao;
        this.encoder = encoder;
    }
    //get username from the principal compare with username in the DB then get the UserId out then put 
    // the current log in user object on the model. 
    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String userProfile(HttpServletRequest rq, Model model) {
        int userId = 0;
        List<User> allUsers = userDao.getAllUsers();
        String logInUserName = rq.getParameter("userName");
        //search allUsers list for match username and then get userID out
        for (User currentUser : allUsers) { 
            boolean findUser = false;
            if (currentUser.getUserName().equalsIgnoreCase(logInUserName)){
                userId = currentUser.getUserId();
                findUser= true;
            }
            
        }
   // put current log in user object in the model once userId found.
        User currentLogInUser = userDao.getUserbyId(userId);
        String pswMessage = "Must contain at least one number and one uppercase "
                + "and lowercase letter, and at least 8 or more characters";
        model.addAttribute("currentLogInUser", currentLogInUser);
        model.addAttribute("pswMessage", pswMessage);
        return "UserProfile";
    }
    
    //custom error endopint
   @RequestMapping(value = "/customError", method = RequestMethod.GET)
    public String customError(HttpServletRequest rq, Model model) {
        String msg="Something went wrong! Check your work and try again.";
        model.addAttribute("msg", msg);
        return "CustomError";
    
    }
    //update profile-form endpoint
    @RequestMapping(value = "/updateProfileForm", method = RequestMethod.GET)
    public String updateProfile(HttpServletRequest rq, Model model){
        String userIdParameter = rq.getParameter("userId");
        int userId = Integer.parseInt(userIdParameter);
        User currentUser = userDao.getUserbyId(userId);
         model.addAttribute("currentUser", currentUser );
         return "UpdateProfile";
    }
    // update profile only
    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public String editProfile(@Valid @ModelAttribute("currentLogInUser") User currentUser,
            BindingResult result) {
        if (result.hasErrors()) {
            return "redirect:customError";
        }
        userDao.updateUser(currentUser);
        return "UserProfile";
    }
    // update password only
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String editPassword(HttpServletRequest rq, @Valid @ModelAttribute("currentLogInUser") User currentUser) {
        String oldPSW = rq.getParameter("oldPSW");
        String newPSW = rq.getParameter("newPSW");
        String confirmNewPSW = rq.getParameter("confirmNewPSW");
        //verify for null input and verify all new password is match
        if(oldPSW == null || oldPSW.trim().length() == 0
                    || newPSW == null || newPSW.trim().length() == 0
                    || !confirmNewPSW.equals(newPSW)){ 
          return "redirect:customError";
        }
        String existingPSW = rq.getParameter("existingPSW");
        if (encoder.matches(oldPSW, existingPSW)) {
            //if everything good we update the password. 
            String hasPw = encoder.encode(newPSW);
            currentUser.setPassWord(hasPw);
            userDao.updateUser(currentUser); 
            return "UserProfile";
        
        } else {
            
             return "redirect:customError";

        }

    }

}
