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
import com.sg.wnga.Model.NewPost;
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
    public String admin(HttpServletRequest rq, Model model) {
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
        List<User> userList = new ArrayList<>();
        userList = userDao.getAllUsers();
        model.addAttribute("userList", userList);
        //name and user name
        String name = " Name: ";
        String userName = " UserName: ";
        model.addAttribute("name", name);
        model.addAttribute("userName", userName);
        //pushing out message for photo link
        String message = "Please indicate number 1 or 3 for your photo to be updated."
                + " This number correspond to photo for your home page.";
        String linkOut = "Link to your image. Waring! this form is only for the link to your photo."
                + "(File upload is not available)";
        model.addAttribute("message", message);
        model.addAttribute("linkOut", linkOut);
        return "Admin";
    }

    @RequestMapping(value = "/editContent", method = RequestMethod.GET)
    public String editContent(HttpServletRequest rq, Model model) {
        String contentOneIdParameter = rq.getParameter("newsFeedId");
        int newsfeedId = Integer.parseInt(contentOneIdParameter);
        NewsFeed newsFeed = NFDao.getNewsFeedById(newsfeedId);
        model.addAttribute("newsFeed", newsFeed);
        LocalDate date = LocalDate.now();
        model.addAttribute("date", date);
        return "EditContent";
    }

    @RequestMapping(value = "/updateContent", method = RequestMethod.POST)
    public String updateContent(@Valid @ModelAttribute("newsFeed") NewsFeed newsFeed,
            BindingResult result) {
        if (result.hasErrors()) {
            return "customError";
        }
        NFDao.updateNewsFeed(newsFeed);
        return "redirect:admin";
    }

    @RequestMapping(value = "/enabledUser", method = RequestMethod.POST)
    public String enabledUser(HttpServletRequest rq) {
        String userIdParameter = rq.getParameter("userId");
        int userId = Integer.parseInt(userIdParameter);
        User enabled = userDao.getUserbyId(userId);
        enabled.setEnable(true);
        userDao.updateUser(enabled);
        return "redirect:admin";
    }

    @RequestMapping(value = "/disabledUser", method = RequestMethod.POST)
    public String disabledUser(HttpServletRequest rq) {

        String userIdParameter = rq.getParameter("userId");
        int userId = Integer.parseInt(userIdParameter);
        User enabled = userDao.getUserbyId(userId);
        enabled.setEnable(false);
        userDao.updateUser(enabled);
        return "redirect:admin";
    }

    @RequestMapping(value = "/editNewsForm", method = RequestMethod.GET)
    public String editNews(HttpServletRequest rq, Model model) {
        String contentOneIdParameter = rq.getParameter("newsFeedId");
        int newsfeedId = Integer.parseInt(contentOneIdParameter);
        NewsFeed newsFeed = NFDao.getNewsFeedById(newsfeedId);
        model.addAttribute("newsFeed", newsFeed);
        LocalDate date = LocalDate.now();
        model.addAttribute("date", date);

        return "EditNewsFeed";
    }
  
    @RequestMapping(value = "/updateNews", method = RequestMethod.POST)
    public String updateNews(@Valid @ModelAttribute("newsFeed") NewsFeed newsFeed,
            BindingResult result) {
        if (result.hasErrors()) {
            return "customError";
        }
        NFDao.updateNewsFeed(newsFeed);
        return "redirect:newsFeed";
    }
      @RequestMapping(value = "/deleteNews", method = RequestMethod.GET)
    public String deleteNewsFeed(HttpServletRequest rq, Model model) {
        String newsFeedIdParameter = rq.getParameter("newsFeedId");
        int newsFeedId = Integer.parseInt(newsFeedIdParameter);
         NFDao.deleteNewsFeed(newsFeedId);
         return  "redirect:newsFeed";
        
    }
 

    @RequestMapping(value = "/updateHomeImg", method = RequestMethod.POST)
    public String updateImgOne(HttpServletRequest rq) {
        String imgLink = rq.getParameter("imgLink");
        String idInput = rq.getParameter("idInput");
        int id = Integer.parseInt(idInput);
        NewsFeed img1 = NFDao.getNewsFeedById(id);
        img1.setLink(imgLink);
        NFDao.updateNewsFeed(img1);
        return "redirect:/";

    }

}
