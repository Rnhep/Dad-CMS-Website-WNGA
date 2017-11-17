/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sg.sophacms.DAO.NewPostDao;
import com.sg.sophacms.DAO.UserDao;
import com.sg.sophacms.Model.NewPost;
import com.sg.sophacms.Model.User;
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
public class UserTest {

    private UserDao userDao;
    private NewPostDao newPostDao;

    public UserTest() {
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
    @Test
    public void testAddGetUser() {
        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhone("123465");
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
        user.setPhone("123465");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, user);
        userDao.deleteUser(user.getUserName());
        assertNull(userDao.getUserByUserName(user.getUserName()));
    }

    @Test
    public void TestUpdateUser() {
        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhone("123465");
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
    public void TestGetUserById() {
        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("person1");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhone("123465");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserbyId(user.getUserId());
        assertEquals(fromDB, user);

    }

    @Test
    public void TestGetUserByUserName() {
        User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("Rithee");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhone("123465");
        user.setEnable(true);
        userDao.addUser(user);
        User fromDB = userDao.getUserByUserName(user.getUserName());
        assertEquals("Rithee", fromDB.getUserName());

    }
    
    @Test
    public void TestGetAllUsers(){
         User user = new User();
        user.setFirstName("person1");
        user.setLastName("person1");
        user.setUserName("Rithee");
        user.setPassWord("password");
        user.setEmail("user.user");
        user.setPhone("123465");
        user.setEnable(true);
        userDao.addUser(user);
        
        User user1 = new User();
        user1.setFirstName("person2");
        user1.setLastName("person1");
        user1.setUserName("Rithee2");
        user1.setPassWord("password");
        user1.setEmail("user.user");
        user1.setPhone("123465");
        user1.setEnable(true);
        userDao.addUser(user1);
        
       List<User> allUsers = new ArrayList<>(); 
       allUsers = userDao.getAllUsers(); 
       assertEquals(2, allUsers.size());
        
    }
}
