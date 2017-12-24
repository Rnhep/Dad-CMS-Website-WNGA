/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.sophacms.Controller;

import static com.sg.sophacms.Controller.Contents.*;
import static com.sg.sophacms.Controller.Contents.FOR_CONTENT_ONE;
import com.sg.sophacms.DAO.GetCountDao;
import com.sg.sophacms.DAO.NewPostDao;
import com.sg.sophacms.DAO.NewsFeedDao;
import com.sg.sophacms.DAO.UserDao;
import com.sg.sophacms.Model.NewsFeed;
import java.time.LocalDate;
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

    @RequestMapping(value = "/displayAdminPage", method = RequestMethod.GET)
    public String editForm(HttpServletRequest rq, Model model) {
        NewsFeed contentOne = NFDao.getNewsFeedById(FOR_CONTENT_ONE);
        NewsFeed contentTwo = NFDao.getNewsFeedById(FOR_CONTENT_TWO);
        NewsFeed contentThree = NFDao.getNewsFeedById(FOR_CONTENT_THREE);
        NewsFeed contentFour = NFDao.getNewsFeedById(FOR_CONTENT_FOUR);
        model.addAttribute("contentOne", contentOne);
        model.addAttribute("contentTwo", contentTwo);
        model.addAttribute("contentThree", contentThree);
        model.addAttribute("contentFour", contentFour);

//String contentOneIdParameter = rq.getParameter("newsFeedId");
//           int newsfeedId = Integer.parseInt(contentOneIdParameter);
//           NewsFeed newsFeed = NFDao.getNewsFeedById(newsfeedId);
//           model.addAttribute("newsFeed", newsFeed);
        return "AdminPage";
    }

    @RequestMapping(value = "/displayEditPostForm", method = RequestMethod.GET)
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
             return "redirect:displayAdminPage";
         }
    
}