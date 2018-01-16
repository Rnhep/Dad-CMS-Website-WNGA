/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;

import static com.sg.wnga.Controller.Contents.*;
import static com.sg.wnga.Controller.Contents.FOR_CONTENT_ONE;
import com.sg.wnga.DAO.GetCountDao;
import com.sg.wnga.DAO.NewPostDao;
import com.sg.wnga.DAO.NewsFeedDao;
import com.sg.wnga.DAO.UserDao;
import com.sg.wnga.Model.NewsFeed;
import com.sg.wnga.Model.User;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
public class AdminController {

    UserDao userDao;
    NewPostDao NPDao;
    NewsFeedDao NFDao;
    GetCountDao getCountDao;
    String titleField;
    String commentOut;

    @Inject
    public AdminController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao, GetCountDao getCountDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;
        this.getCountDao = getCountDao;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String editForm(HttpServletRequest rq, Model model) {
        NewsFeed contentOne = NFDao.getNewsFeedById(FOR_CONTENT_ONE);
        NewsFeed contentTwo = NFDao.getNewsFeedById(FOR_CONTENT_TWO);
        NewsFeed contentThree = NFDao.getNewsFeedById(FOR_CONTENT_THREE);
        NewsFeed contentFour = NFDao.getNewsFeedById(FOR_CONTENT_FOUR);
        model.addAttribute("contentOne", contentOne);
        model.addAttribute("contentTwo", contentTwo);
        model.addAttribute("contentThree", contentThree);
        model.addAttribute("contentFour", contentFour);
        //for events
        NewsFeed eventOne = NFDao.getNewsFeedById(FOR_EVENT_ONE);
        NewsFeed eventTwo = NFDao.getNewsFeedById(FOR_EVENT_TWO);
        model.addAttribute("eventOne", eventOne);
        model.addAttribute("eventTwo", eventTwo);
         //Post count
        Long postCount = getCountDao.getNewPostCount();
       
        Long usersCount = getCountDao.getUserCount();
        model.addAttribute("postCount", postCount);
        //news count
         Long newsFeedCount = getCountDao.getNewsFeedCount();
        model.addAttribute("newsFeedCount", newsFeedCount);
        model.addAttribute("usersCount", usersCount);
        //user count
        List <User> userList = new ArrayList<>();
        userList = userDao.getAllUsers();
        model.addAttribute("userList", userList);
        return "Admin";
    }

    @RequestMapping(value = "/editPostForm", method = RequestMethod.GET)
    public String updateNewsFeed(HttpServletRequest rq, Model model) {
        String contentOneIdParameter = rq.getParameter("newsFeedId");
        int newsfeedId = Integer.parseInt(contentOneIdParameter);
        NewsFeed newsFeed = NFDao.getNewsFeedById(newsfeedId);
        model.addAttribute("newsFeed", newsFeed);
        LocalDate date = LocalDate.now();
        model.addAttribute("date", date);
        
        return "EditContent";
    }
    
        @RequestMapping(value = "/editNewsFeed", method = RequestMethod.POST)
         public String editSuperPerson( @Valid @ModelAttribute("newsFeed") NewsFeed newsFeed,
            BindingResult result) {
             if(result.hasErrors()){
                 return "EditContent";
             }
             NFDao.updateNewsFeed(newsFeed);
             return "redirect:admin";
         }
    
}