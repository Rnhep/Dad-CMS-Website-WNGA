/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.wnga.Controller;

import com.sg.wnga.DAO.GetCountDao;
import com.sg.wnga.DAO.NewPostDao;
import com.sg.wnga.DAO.NewsFeedDao;
import com.sg.wnga.DAO.UserDao;
import com.sg.wnga.Model.NewPost;
import com.sg.wnga.Model.NewsFeed;
import com.sg.wnga.Model.User;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class PostController {

   private final UserDao userDao;
   private final NewPostDao NPDao;
   private final NewsFeedDao NFDao;
   private final  GetCountDao getCountDao;
   private  String titleField;
   private  String commentOut;

    @Inject
    public PostController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao, GetCountDao getCountDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;
        this.getCountDao = getCountDao;
    }

    //Get lates newsfeed from DB to display in home page.
    @RequestMapping(value = "/newsFeed", method = RequestMethod.GET)
    public String displayNewsFeed(Model model) {
        List<NewsFeed> allNews = NFDao.getAllNews();
        model.addAttribute("allNews", allNews);
        return "NewsFeed";
    }

    //Get lates post from DB.
    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String displayLatesPost(HttpServletRequest rq, Model model) {
        List<NewPost> displayAllPost  = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);
        return "NewPost";

    }
// resubmit post form

    @RequestMapping(value = "/repostForm", method = RequestMethod.GET)
    public String repostForm(HttpServletRequest rq, Model model) {
        String message = "Required field is empty";
        model.addAttribute("message", message);
        model.addAttribute("titleField", titleField);
        model.addAttribute("commentOut", commentOut);
        List<NewPost> displayAllPost = new ArrayList<>();
        displayAllPost = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);

        return "redirect:post";
    }
//add post form

    @RequestMapping(value = "/newPost", method = RequestMethod.POST)
    public String createPost(HttpServletRequest rq, Model model) {
        //check for empty fields
        String userName = rq.getParameter("userName");
        String title = rq.getParameter("title");
        String comment = rq.getParameter("comment");
        if (title == null || title.trim().length() == 0
                || comment == null || comment.trim().length() == 0) {
            titleField = title;
            commentOut = comment;
            return "redirect:repostForm";
        }
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM-dd-yyyy'T'HH:mm:ss");
        LocalDateTime today= LocalDateTime.now();
        String time= today.format(formatter);
        LocalDateTime timeStamp= LocalDateTime.parse(time, formatter);
        
        NewPost newPost = new NewPost();
        int userId=0;
        List<User> allUsers = userDao.getAllUsers();
        for (User currentUser : allUsers) {
            boolean findUser = false;
            
            if(currentUser.getUserName().equalsIgnoreCase(userName))
                    userId = currentUser.getUserId();
            findUser= true;
        } 
        
        User setUserId = userDao.getUserbyId(userId);
        newPost.setTitle(title);
        newPost.setContent(comment);
        newPost.setImagePath(rq.getParameter("photo"));
        newPost.setImagePathTwo(rq.getParameter("photoTwo"));
        newPost.setPublishDate(timeStamp);
        newPost.setUser(setUserId);
        NPDao.addNewPost(newPost);
        return "redirect:post";

    }

}
