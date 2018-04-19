/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;

import static com.sg.wnga.Controller.Contents.*;
import com.sg.wnga.DAO.NewPostDao;
import com.sg.wnga.DAO.NewsFeedDao;
import com.sg.wnga.DAO.UserDao;
import com.sg.wnga.Model.NewPost;
import com.sg.wnga.Model.NewsFeed;
import com.sg.wnga.Model.User;
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
public class MainController {
 private final UserDao userDao;
    NewPostDao NPDao;
    NewsFeedDao NFDao;

    @Inject
    public MainController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;
    }

//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public String comingSoon() {
//        return "ComingSoon";
//    }
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) {
        //for home page contents
        NewsFeed contentOne = NFDao.getNewsFeedById(FOR_CONTENT_ONE);
        NewsFeed contentTwo = NFDao.getNewsFeedById(FOR_CONTENT_TWO);
        NewsFeed contentThree = NFDao.getNewsFeedById(FOR_CONTENT_THREE);
        NewsFeed contentFour = NFDao.getNewsFeedById(FOR_CONTENT_FOUR);
        //for events
        NewsFeed eventOne = NFDao.getNewsFeedById(FOR_EVENT_ONE);
        NewsFeed eventTwo = NFDao.getNewsFeedById(FOR_EVENT_TWO);
        model.addAttribute("contentOne", contentOne);
        model.addAttribute("contentTwo", contentTwo);
        model.addAttribute("contentThree", contentThree);
        model.addAttribute("contentFour", contentFour);
        model.addAttribute("eventOne", eventOne);
        model.addAttribute("eventTwo", eventTwo);
        List<NewPost> displayLatestPost = new ArrayList<>();
        displayLatestPost = NPDao.getLatestPost();
        model.addAttribute("displayLatestPost", displayLatestPost);
        String latestPost = "Recent Posts";
        model.addAttribute("latestPost", latestPost);
        List<User> allUsers = userDao.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "Home";
    }

    //display about us page
    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public String aboutUsPage() {
        return "AboutUs";
    }

    //Get lates newsfeed from DB to display in home page.
    @RequestMapping(value = "/newsFeed", method = RequestMethod.GET)
    public String displayNewsFeed(Model model) {
        List<NewsFeed> allNews = NFDao.getAllNews();
        model.addAttribute("allNews", allNews);
        String admin = "(Admin)";
        model.addAttribute("admin", admin);
        
        List<User> allUsers = userDao.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "NewsFeed";
    }
    
    @RequestMapping(value = "/contactUs", method = RequestMethod.GET)
    public String contactUs(Model model) {
        return "ContactUs";
    }
    @RequestMapping(value = "/TermAndCondition", method = RequestMethod.GET)
   public String TermAndCondition(Model model)
    {
        return "TermAndCondition";
    }
    

}
