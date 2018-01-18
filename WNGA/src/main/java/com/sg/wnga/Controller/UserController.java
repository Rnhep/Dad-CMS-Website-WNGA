/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;
import com.sg.wnga.DAO.UserDao;
import com.sg.wnga.Model.User;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
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

    private final UserDao userDao;
    private final PasswordEncoder encoder;
    private String emailField;
    private String firstNameField;
    private String lastNameField;
    private String userNameField;
    private String passWordField;

    @Inject
    public UserController(UserDao userDao, PasswordEncoder encoder) {
        this.userDao = userDao;
        this.encoder = encoder;
    }

    //display registration Form
    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String registrationform(Model model) {
        String registration = "Sign Up";
        String pswmessage= "Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters";
         model.addAttribute("registration", registration);
         model.addAttribute("pswmessage", pswmessage);
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
        String firstName = rq.getParameter("firstName");
        String lastName = rq.getParameter("lastName");
        String userName = rq.getParameter("userName");
        String password = rq.getParameter("password");
        String email = rq.getParameter("email");
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
        LocalDateTime timeStamp = LocalDateTime.now();
       
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setUserName(userName);
        String hasPw = encoder.encode(password);
        newUser.setPassWord(hasPw);
        newUser.setEmail(email);
        newUser.setJointDate(LocalDate.now());
        newUser.setEnable(Boolean.TRUE);
         newUser.addAuthority("ROLE_USER");
//        if (null != rq.getParameter("isAdmin")) {
//            newUser.addAuthority("ROLE_ADMIN");
//        }
        userDao.addUser(newUser);
        return "redirect:signIn";

    }
    
   
    
    
    
}
