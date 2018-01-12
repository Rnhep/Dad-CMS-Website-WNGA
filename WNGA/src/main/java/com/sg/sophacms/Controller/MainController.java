/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Controller;
import static com.sg.sophacms.Controller.Contents.*;
import com.sg.sophacms.DAO.GetCountDao;
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
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
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
    GetCountDao getCountDao;
    String titleField;
    String commentOut;

    @Inject
    public MainController(UserDao userDao, NewPostDao NPDao, NewsFeedDao NFDao, GetCountDao getCountDao) {
        this.userDao = userDao;
        this.NPDao = NPDao;
        this.NFDao = NFDao;
        this.getCountDao= getCountDao;
    }

    
    @RequestMapping(value = "/", method = RequestMethod.GET)
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
       
        return "HomePage";
    }
   
    //return to home page
    @RequestMapping(value = "/homePage", method = RequestMethod.GET)
    public String homePage() {
        return "redirect:/";
    }

    //display about us page
    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public String aboutUsPage() {
        return "AboutUsPage";
    }

    
    //Get lates newsfeed from DB to display in home page.
    @RequestMapping(value = "/newsFeedPage", method = RequestMethod.GET)
    public String displayNewsFeed(Model model) {
        List<NewsFeed> allNews = new ArrayList<>();
        allNews = NFDao.getAllNews();
        model.addAttribute("allNews", allNews);
        return "NewsFeedPage";
    }

    //Get lates post from DB.
    @RequestMapping(value = "/postPage", method = RequestMethod.GET)
    public String displayLatesPost(HttpServletRequest rq, Model model) {
        List<NewPost> displayAllPost = new ArrayList<>();
        displayAllPost = NPDao.getAllPost();
        model.addAttribute("displayAllPost", displayAllPost);
        return "NewPostPage";

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

        return "redirect:postPage";
    }
//add post form

    @RequestMapping(value = "/newPost", method = RequestMethod.POST)
    public String createPost(HttpServletRequest rq, Model model, User user) {
        //check for empty fields
        String title = rq.getParameter("title");
        String comment = rq.getParameter("comment");
        if (title == null || title.trim().length() == 0
                || comment == null || comment.trim().length() == 0) {
            titleField = title;
            commentOut = comment;
            return "redirect:repostForm";
        }
        LocalDateTime timeStamp = LocalDateTime.now();
        String getUserID = rq.getParameter("userId");
//       int userId = Integer.parseInt(getUserID);
        NewPost newPost = new NewPost();
        User setUserId = userDao.getUserbyId(1);
        newPost.setTitle(title);
        newPost.setContent(comment);
        newPost.setImagePath(rq.getParameter("photo"));
        newPost.setImagePathTwo(rq.getParameter("photoTwo"));
        newPost.setPublishDate(timeStamp);
        newPost.setUser(setUserId);
        NPDao.addNewPost(newPost);
        return "redirect:postPage";

    }

}
