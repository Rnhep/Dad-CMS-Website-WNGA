/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sg.sophacms.DAO.NewPostDao;
import com.sg.sophacms.DAO.UserDao;
import com.sg.sophacms.Model.NewPost;
import com.sg.sophacms.Model.User;
import java.time.LocalDateTime;
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
public class UserAndNewPostTest {

    private UserDao userDao;
    private NewPostDao newPostDao;
    LocalDateTime timeStamp = LocalDateTime.now();

    public UserAndNewPostTest() {
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

        userDao = ctx.getBean("userDao", UserDao.class);
        newPostDao = ctx.getBean("newPostDao", NewPostDao.class);
//        locationDao = ctx.getBean("locationDao", LocationDao.class);
//        sightingDao = ctx.getBean("sightingDao", SightingDao.class);
        List<NewPost> posts = newPostDao.getAllPost();
        for (NewPost currentPost : posts) {
            newPostDao.deletePost(currentPost.getPostId());
        }

        List<User> users = userDao.getAllUsers();
        for (User currentUser : users) {
            userDao.deleteUser(currentUser.getUserName());
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
//    @Test
    public void testAddGetUser() {

        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, user);
    }

    @Test
    public void testDeleteUser() {

        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, user);
        userDao.deleteUser(user.getUserName());
        assertNull(userDao.getUserByUserName(user.getUserName()));
    }

    @Test
    public void testUpdateUser() {

        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        String firstName = "Rithee";
        User fromDB = userDao.getUserbyId(user.getUserId());
        fromDB.setFirstName(firstName);
        userDao.updateUser(fromDB);
        User updateName = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, updateName);
    }

    @Test
    public void testGetUserById() {

        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, user);
    }

    @Test
    public void testGetUserByUserName() {

        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("Rithee");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserByUserName(user.getUserName());
        assertEquals("Rithee", fromDB.getUserName());
    }

    @Test
    public void testGetAllUsers() {

        User user = new User();
        user.setFirstName("Rithee1");
        user.setLastName("Nhep1");
        user.setUserName("Rithee");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);

        User user1 = new User();
        user1.setFirstName("Rithee");
        user1.setLastName("Nhep");
        user1.setUserName("RitheeN");
        user1.setPassWord("password");
        user1.setEmail("user.user");
        user1.setPhoto("test");
        userDao.addUser(user1);
        List<User> allUsers = new ArrayList<>();
        allUsers = userDao.getAllUsers();
        assertEquals(2, allUsers.size());
    }

//    @Test
//    public void testAddGetNewPost() {
//
//        User user1 = new User();
//        user1.setFirstName("Rithee");
//        user1.setLastName("Nhep");
//        user1.setUserName("RitheeN");
//        user1.setPassWord("password");
//        user1.setEmail("user.user");
//        user1.setPhone("123465");
//        user1.setEnable(true);
//        userDao.addUser(user1);
//        NewPost np = new NewPost();
//        np.setTitle("UnitTest");
//        np.setContent("Tommorow is the Future");
//        np.setImagePath("test");
//        np.setPublishDate(timeStamp);
//        np.setExpireDate(timeStamp);
//        np.setUser(user1);
//        newPostDao.addNewPost(np);
//        NewPost fromDB = newPostDao.getPostById(np.getPostId());
//        assertEquals(fromDB.getPublishDate(), np.getPublishDate());
//    }
    @Test
    public void testDeleteNewPost() {

        User user1 = new User();
        user1.setFirstName("Rithee");
        user1.setLastName("Nhep");
        user1.setUserName("RitheeN");
        user1.setPassWord("password");
        user1.setEmail("user.user");
        user1.setPhoto("test");
        user1.setEnable(true);
        userDao.addUser(user1);
        NewPost np = new NewPost();
        np.setTitle("UnitTest");
        np.setContent("Tommorow is the Future");
        np.setImagePath("test");
        np.setPublishDate(timeStamp);
        np.setUser(user1);
        newPostDao.addNewPost(np);
        newPostDao.deletePost(np.getPostId());
        assertNull(newPostDao.getPostById(np.getPostId()));
    }

    @Test
    public void testUpdatePost() {

        User user = new User();
        user.setFirstName("Rithee");
        user.setLastName("Nhep");
        user.setUserName("RitheeN");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        NewPost np = new NewPost();
        np.setTitle("UnitTest");
        np.setContent("Tommorow is the Future");
        np.setImagePath("test");
        np.setImagePathTwo("test2");
        np.setPublishDate(timeStamp);
        np.setUser(user);
        newPostDao.addNewPost(np);
        String Title = "updateUnitTest";
        NewPost toUpdate = newPostDao.getPostById(np.getPostId());
        toUpdate.setTitle(Title);
        newPostDao.updatePost(toUpdate);
        NewPost fromDB = newPostDao.getPostById(np.getPostId());
        assertEquals(toUpdate, fromDB);
    }

    @Test
    public void testGetPostById() {
        LocalDateTime timeStamp = LocalDateTime.now();
        User user1 = new User();
        user1.setFirstName("Rithee");
        user1.setLastName("Nhep");
        user1.setUserName("RitheeN");
        user1.setPassWord("password");
        user1.setPhoto("test");
        user1.setEmail("user.user");

        user1.setEnable(true);
        userDao.addUser(user1);
        NewPost np = new NewPost();
        np.setTitle("UnitTest");
        np.setContent("Tommorow is the Future");
        np.setImagePath("test");
        np.setImagePathTwo("test2");
        np.setPublishDate(timeStamp);
        np.setUser(user1);
        newPostDao.addNewPost(np);
        NewPost fromDB = newPostDao.getPostById(np.getPostId());
        assertEquals(fromDB.getPostId(), np.getPostId());
    }
//

    @Test
    public void testGetAllPost() {

        User user = new User();
        user.setFirstName("Rithee");
        user.setLastName("Nhep");
        user.setUserName("RitheeN");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        NewPost np = new NewPost();
        np.setTitle("UnitTest");
        np.setContent("Tommorow is the Future");
        np.setImagePath("test");
//        np.setImagePathTwo("test2");
        np.setPublishDate(timeStamp);
        np.setUser(user);
        newPostDao.addNewPost(np);

        User user1 = new User();
        user1.setFirstName("Rithee");
        user1.setLastName("Nhep");
        user1.setUserName("RitheeN");
        user1.setPassWord("password");
        user1.setPhoto("test");
        user1.setEmail("user.user");

        user1.setEnable(true);
        userDao.addUser(user1);
        NewPost np1 = new NewPost();
        np1.setTitle("UnitTest");
        np1.setContent("Tommorow is the Future");
        np1.setImagePath("test");
//        np.setImagePathTwo("test2");
        np1.setPublishDate(timeStamp);
        np1.setUser(user1);
        newPostDao.addNewPost(np1);
        List<NewPost> allPosts = new ArrayList();
        allPosts = newPostDao.getAllPost();
        assertEquals(2, allPosts.size());
    }

    @Test
    public void testGetUserNameByPostId() {

        User user = new User();
        user.setFirstName("Rithee");
        user.setLastName("Nhep");
        user.setUserName("RitheeN");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhoto("test");
        user.setEnable(true);
        userDao.addUser(user);
        NewPost np = new NewPost();
        np.setTitle("UnitTest");
        np.setContent("Tommorow is the Future");
        np.setImagePath("test");
//        np.setImagePathTwo("test2");
        np.setPublishDate(timeStamp);
        np.setUser(user);
        newPostDao.addNewPost(np);

        NewPost fromDB = newPostDao.getUserByPostId(np.getPostId());
        assertEquals("RitheeN", fromDB.getUser().getUserName());
    }

}
