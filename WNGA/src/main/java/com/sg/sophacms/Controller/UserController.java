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
public class UserController {

    UserDao userDao;
    // private PasswordEncoder encoder;
    String emailField;
    String firstNameField;
    String lastNameField;
    String userNameField;
    String passWordField;

    @Inject
    public UserController(UserDao userDao) {
        this.userDao = userDao;
    }

    //display registration Form
    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String registrationform(Model model) {
        String registration = "Sign Up";
         model.addAttribute("registration", registration);
        return "UserRegistrationForm";
    }

    //resubmit form
    @RequestMapping(value = "/resubmitForm", method = RequestMethod.GET)
    public String reSubmitForm(Model model) {
        String message = "One or more required field is missing value or password not match or user name was taken";
        model.addAttribute("emailField", emailField);
        model.addAttribute("firstNameField", firstNameField);
        model.addAttribute("lastNameField", lastNameField);
        model.addAttribute("userNameField", userNameField);
        model.addAttribute("passWordField", passWordField);
        model.addAttribute("message", message);
        return "UserRegistrationForm";
    }

    //add user
    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser(HttpServletRequest rq) {
        List<User> allUsers = new ArrayList<>();
        List<User> userFromDB = userDao.getAllUsers();
        User newUser = new User();
        String email = rq.getParameter("email");
        String firstName = rq.getParameter("firstName");
        String lastName = rq.getParameter("lastName");
        String userName = rq.getParameter("userName");
        String password = rq.getParameter("password");
        String confirmPassword = rq.getParameter("confirmPassword");
        //check to see if any of the field is empty
        if (email == null || email.trim().length() == 0
                || firstName == null || firstName.trim().length() == 0
                || lastName == null || lastName.trim().length() == 0
                || userName == null || userName.trim().length() == 0 
                || password == null || password.trim().length() == 0
                || !confirmPassword.equals(password)) {
        //redirect to resubmitForm with value entered. 
            emailField = email;
            firstNameField = firstName;
            lastNameField = lastName;
            userNameField = userName;
            passWordField = password;
            return "redirect:resubmitForm";
        }
        // check if user name was taken loop through all of users from database and check again new user. 
        for(User currentUser: userFromDB){
        if(currentUser.getUserName().equalsIgnoreCase(userName)){
            emailField = email;
            firstNameField = firstName;
            lastNameField = lastName;
            userNameField = "USER NAME WAS TAKEN";
            passWordField = password;
            return "redirect:resubmitForm"; 
        }
    }
        //Other wise we good to go
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setUserName(userName);
        newUser.setPassWord(password);
        newUser.setEmail(email);
        userDao.addUser(newUser);
        return "redirect:signIn";

    }
    
   
    
    
    
}
