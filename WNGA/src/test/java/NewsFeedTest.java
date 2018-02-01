/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sg.wnga.DAO.NewsFeedDao;
import com.sg.wnga.Model.NewsFeed;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author ritheenhep
 */
public class NewsFeedTest {

    private NewsFeedDao newsFeedDao;

    public NewsFeedTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        ApplicationContext ctx
                = new ClassPathXmlApplicationContext("test-applicationContext.xml");
        newsFeedDao = ctx.getBean("newsFeedDao", NewsFeedDao.class);

        List<NewsFeed> news = newsFeedDao.getAllNews();
        for (NewsFeed currentNews : news) {
            newsFeedDao.deleteNewsFeed(currentNews.getNewsFeedId());
        }

    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void testAddGetNews() {
        NewsFeed NF = new NewsFeed();
        NF.setName("Today News");
        NF.setDate(LocalDate.now());
        NF.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF);
        NewsFeed fromDB = newsFeedDao.getNewsFeedById(NF.getNewsFeedId());
        assertEquals(fromDB, NF);

    }

    @Test
    public void testDeleteNews() {
        NewsFeed NF = new NewsFeed();
        NF.setName("Today News");
        NF.setDate(LocalDate.now());
        NF.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF);
        NewsFeed fromDB = newsFeedDao.getNewsFeedById(NF.getNewsFeedId());
        assertEquals(fromDB, NF);
        newsFeedDao.deleteNewsFeed(NF.getNewsFeedId());
        assertNull(newsFeedDao.getNewsFeedById(NF.getNewsFeedId()));
    }

    @Test
    public void testUpdateNews() {
        NewsFeed NF = new NewsFeed();
        NF.setName("Today News");
        NF.setDate(LocalDate.now());
        NF.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF);
        NewsFeed fromDB = newsFeedDao.getNewsFeedById(NF.getNewsFeedId());
        assertEquals(fromDB, NF);
        String Title = "Tomorrow";
        fromDB.setName(Title);
        newsFeedDao.updateNewsFeed(fromDB);
        NewsFeed updateNews = newsFeedDao.getNewsFeedById(NF.getNewsFeedId());
        assertEquals(updateNews, fromDB);
    }

    @Test
    public void testGetAll() {
        NewsFeed NF = new NewsFeed();
        NF.setName("Today News");
        NF.setDate(LocalDate.now());
        NF.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF);
        NewsFeed NF1 = new NewsFeed();
        NF1.setName("Today News");
        NF1.setDate(LocalDate.now());
        NF1.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF1);
        List<NewsFeed> allNews = new ArrayList<>();
        allNews = newsFeedDao.getAllNews();
        assertEquals(2, allNews.size());
    }
    
   @Test
   public void testGetNewsById(){
        NewsFeed NF = new NewsFeed();
        NF.setName("Today News");
        NF.setDate(LocalDate.now());
        NF.setContent("something is fun");
        newsFeedDao.addNewsFeed(NF);
       NewsFeed fromDB = newsFeedDao.getNewsFeedById(NF.getNewsFeedId());
       assertEquals(NF.getNewsFeedId(), fromDB.getNewsFeedId());
   }
}
