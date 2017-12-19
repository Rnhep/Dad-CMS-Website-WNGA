/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Controller;

import static com.sg.sophacms.Controller.NewsId.*;
import com.sg.sophacms.DAO.NewPostDao;
import com.sg.sophacms.DAO.NewsFeedDao;
import com.sg.sophacms.DAO.UserDao;
import com.sg.sophacms.Model.NewPost;
import com.sg.sophacms.Model.NewsFeed;
import com.sg.sophacms.Model.User;
import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    NewsFeedDao NFDao;
    
    @Inject
    public MainController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;
    }
    //first 4 IDs from news feed are uses for education, health, humandright,PPA.
    //ID 5 to 6 reserved for events
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) {
        NewsFeed education = NFDao.getNewsFeedById(FOR_EDUCATION);
        NewsFeed health = NFDao.getNewsFeedById(FOR_HEALTH);
        NewsFeed humanRight = NFDao.getNewsFeedById(FOR_HUMAN_RIGHT);
        NewsFeed PPA = NFDao.getNewsFeedById(FOR_PARIS_PEACE_AGREEMENT);
        NewsFeed eventOne = NFDao.getNewsFeedById(FOR_EVENT_ONE);
        NewsFeed eventTwo = NFDao.getNewsFeedById(FOR_EVENT_TWO);
        model.addAttribute("education", education);
        model.addAttribute("health", health);
        model.addAttribute("humanRight", humanRight);
        model.addAttribute("PPA", PPA);
        model.addAttribute("eventOne", eventOne);
        
        List<NewPost> displayLatestPost = new ArrayList<>();
        displayLatestPost = NPDao.getLatestPost();
        model.addAttribute("displayLatestPost", displayLatestPost);        
        return "HomePage";
    }

    //return to home page
    @RequestMapping(value = "/displayHomePage", method = RequestMethod.GET)
    public String homePage() {
        return "redirect:/";
    }

    //display about us page
    @RequestMapping(value = "/displayAboutUsPage", method = RequestMethod.GET)
    public String aboutUsPage() {
        return "AboutUsPage";
    }

    //display all content page
    @RequestMapping(value = "/displayContentsPage", method = RequestMethod.GET)
    public String contentsPage() {
        return "ContentsPage";
    }

    //Get lates newsfeed from DB to display in home page.
    @RequestMapping(value = "/displayNewsFeedPage", method = RequestMethod.GET)
    public String displayNewsFeed(Model model) {
        List<NewsFeed> allNews = new ArrayList<>();
        allNews = NFDao.getAllNews();
        model.addAttribute("allNews", allNews);
        return "NewsFeedPage";
    }

    //Get lates post from DB.
    @RequestMapping(value = "/displayBlogPage", method = RequestMethod.GET)
    public String displayLatesPost(Model model) {
        List<NewPost> displayAllPost = new ArrayList<>();
        displayAllPost = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);
        return "NewPostPage";
    
    }

    //for add Post form
    @RequestMapping(value = "/newPost", method = RequestMethod.POST)
    public String createPost(HttpServletRequest rq) {
        LocalDateTime timeStamp = LocalDateTime.now();
        String getUserID = rq.getParameter("userId");
//        int userId = Integer.parseInt(getUserID);
        User setUserId = userDao.getUserbyId(2);
        NewPost newPost = new NewPost();
        newPost.setTitle(rq.getParameter("title"));
        newPost.setContent(rq.getParameter("comment"));
        newPost.setImagePath(rq.getParameter("photo"));
        newPost.setPublishDate(timeStamp);
        newPost.setExpireDate(timeStamp);
        newPost.setUser(setUserId);
        NPDao.addNewPost(newPost);
        return "redirect:displayBlogPage";
    }


}
