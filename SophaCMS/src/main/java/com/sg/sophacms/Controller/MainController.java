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
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) {
        NewsFeed education = NFDao.getNewsFeedById(FOR_EDUCATION);
        NewsFeed health = NFDao.getNewsFeedById(FOR_HEALTH);
        NewsFeed humanRight = NFDao.getNewsFeedById(FOR_HUMAN_RIGHT);
        NewsFeed PPA = NFDao.getNewsFeedById(FOR_PARIS_PEACE_AGREEMENT);
        model.addAttribute("education", education);
        model.addAttribute("health", health);
        model.addAttribute("humanRight", humanRight);
        model.addAttribute("PPA", PPA);

        return "Home";
    }
    //Get lates newsfeed from DB to display in home page

    @RequestMapping(value = "/displayNewsFeed", method = RequestMethod.GET)
    public String displayNewsFeed(Model model) {
        List<NewsFeed> allNews = new ArrayList<>();
        allNews = NFDao.getAllNews();
        model.addAttribute("allNews", allNews);
        return "/";
    }
    //Get lates post from DB to display in home page

    @RequestMapping(value = "/displayLatestPost", method = RequestMethod.GET)
    public String displayLatesPost(Model model) {
        List<NewPost> displayLatestPost = new ArrayList<>();
        displayLatestPost = NPDao.getLatestPost();
        model.addAttribute("displayLatestPost", displayLatestPost);
        return "/";
    }

}
