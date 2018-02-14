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
import java.time.LocalDate;
import java.time.LocalDateTime;
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
public class PostController {

    private final UserDao userDao;
    private final NewPostDao NPDao;
    private final NewsFeedDao NFDao;

    private String commentOut;

    @Inject
    public PostController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao, GetCountDao getCountDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;

    }

    //Get lates post from DB.
    @RequestMapping(value = "/displayPost", method = RequestMethod.GET)
    public String displayLatesPost(HttpServletRequest rq, Model model) {
        String newPost = "Latest Posts";
        String logIn = "To start your post please ";
        List<NewPost> displayAllPost = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);
        model.addAttribute("newPost", newPost);
        model.addAttribute("logIn", logIn);

        return "NewPost";

    }
// resubmit post form

    @RequestMapping(value = "/repostForm", method = RequestMethod.GET)
    public String repostForm(HttpServletRequest rq, Model model) {
        String message = "Required field is empty";
        model.addAttribute("message", message);
        model.addAttribute("commentOut", commentOut);
        List<NewPost> displayAllPost = new ArrayList<>();
        displayAllPost = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);
        return "redirect:displayPost";
    }
//add post form

    @RequestMapping(value = "/creatNewPost", method = RequestMethod.POST)
    public String createPost(HttpServletRequest rq, Model model) {
        //check for empty fields
        String userName = rq.getParameter("userName");
        String title = rq.getParameter("title");
        String comment = rq.getParameter("comment");
        if (comment == null || comment.trim().length() == 0) {
            commentOut = comment;
            return "redirect:repostForm";
        }
        LocalDateTime timeStamp = LocalDateTime.now();
        NewPost newPost = new NewPost();
        User setUserId = userDao.getUserByUserName(userName);
        newPost.setTitle(title);
        newPost.setContent(comment);
        newPost.setImagePath(rq.getParameter("photo"));
        newPost.setImagePathTwo(rq.getParameter("photoTwo"));
        newPost.setPublishDate(timeStamp);
        newPost.setUser(setUserId);
        NPDao.addNewPost(newPost);
        return "redirect:displayPost";

    }

    @RequestMapping(value = "/createNewsFeed", method = RequestMethod.POST)
    public String createNewsFeed(HttpServletRequest rq, Model model) {
        String name = rq.getParameter("name");
        String link = rq.getParameter("link");
        String content = rq.getParameter("content");

        NewsFeed newsFeed = new NewsFeed();
        LocalDate datePost = LocalDate.now();
        newsFeed.setName(name);
        newsFeed.setDate(datePost);
        newsFeed.setLink(link);
        newsFeed.setContent(content);
        NFDao.addNewsFeed(newsFeed);
        return "redirect:newsFeed";

    }

    @RequestMapping(value = "/editPostForm", method = RequestMethod.GET)
    public String editPostForm(HttpServletRequest rq, Model model) {
        String postIdParameter = rq.getParameter("postId");
        int postId = Integer.parseInt(postIdParameter);
        NewPost newPost = NPDao.getPostById(postId);
        model.addAttribute("newPost", newPost);
        model.addAttribute("commentOut", commentOut);
        return "EditPost";
    }
//work left here
    @RequestMapping(value = "/updatePost", method = RequestMethod.POST)
    public String updatePost(HttpServletRequest rq, NewPost newPost,
            BindingResult result) {
        String content = rq.getParameter("content");
        if (content == null || content.isEmpty() || content.trim().length() == 0) {
            return "customError";
        }
        String userIdParameter = rq.getParameter("userId");
        int userId = Integer.parseInt(userIdParameter);
        User user = userDao.getUserbyId(userId);
        newPost.setUser(user);
        NPDao.updatePost(newPost);
        return "redirect:displayPost";
    }

    @RequestMapping(value = "/deletePost", method = RequestMethod.GET)
    public String deletePost(HttpServletRequest rq, Model model) {
        String newsFeedIdParameter = rq.getParameter("postId");
        int newsFeedId = Integer.parseInt(newsFeedIdParameter);
        NPDao.deletePost(newsFeedId);
        return "redirect:newsFeed";

    }
}
