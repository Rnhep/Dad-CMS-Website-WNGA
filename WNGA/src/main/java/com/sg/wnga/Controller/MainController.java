/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;

import static com.sg.wnga.Controller.Contents.*;
import com.sg.wnga.DAO.NewPostDao;
import com.sg.wnga.DAO.NewsFeedDao;
import com.sg.wnga.Model.NewPost;
import com.sg.wnga.Model.NewsFeed;
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
public class MainController{
    
  
    NewPostDao NPDao;
    NewsFeedDao NFDao;
   

    @Inject
    public MainController( NewPostDao NPDao, NewsFeedDao NFDao) {
        this.NPDao = NPDao;
        this.NFDao = NFDao;
    }
  
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
        return "NewsFeed";
    }


    
}