package com.runnerdave.spring.web.test.tests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.runnerdave.spring.web.dao.Message;
import com.runnerdave.spring.web.dao.MessagesDao;
import com.runnerdave.spring.web.dao.Offer;
import com.runnerdave.spring.web.dao.User;
import com.runnerdave.spring.web.dao.UsersDao;

@ActiveProfiles("dev")
@ContextConfiguration(locations = { "classpath:com/runnerdave/spring/web/test/config/datasource.xml",
		"classpath:com/runnerdave/spring/web/config/security-context.xml",
		"classpath:com/runnerdave/spring/web/config/dao-context.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class MessageDaoTests {

	@Autowired
	private MessagesDao messagesDao;

	@Autowired
	private UsersDao userDao;

	@Autowired
	private DataSource dataSource;

	private User user1 = new User("johnwpurcell", "John Purcell", "hellothere", "john@caveofprogramming.com", true,
			"ROLE_USER");
	private User user2 = new User("richardhannay", "Richard Hannay", "the39steps", "richard@caveofprogramming.com",
			true, "ROLE_ADMIN");
	private User user3 = new User("suetheviolinist", "Sue Black", "iloveviolins", "sue@caveofprogramming.com", true,
			"ROLE_USER");
	private User user4 = new User("rogerblake", "Rog Blake", "liberator", "rog@caveofprogramming.com", false, "user");
	
	private Message message1 = new Message("subject","content","name","my@email.com",user1.getUsername());
	private Message message2 = new Message("subject2","content2","name2","my2@email.com",user2.getUsername());
	private Message message3 = new Message("subject3","content3","name3","my3@email.com",user3.getUsername());

	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);

		jdbc.execute("delete from messages");
		jdbc.execute("delete from users");
	}

	@Test
	public void testCreateRetrieve() {
		userDao.create(user1);
		userDao.create(user2);
		userDao.create(user3);
		userDao.create(user4);

		messagesDao.saveOrUpdate(message1);

		List<Message> messages1 = messagesDao.getMessages();
		assertEquals("Should be one message.", 1, messages1.size());

		assertEquals("Retrieved message should equal inserted message.", message1, messages1.get(0));

		messagesDao.saveOrUpdate(message2);
		messagesDao.saveOrUpdate(message3);

		List<Message> messages2 = messagesDao.getMessages();
		assertEquals("Should be six messages for enabled users.", 3, messages2.size());
	}

	@Test
	public void testUpdate() {
		userDao.create(user1);
		userDao.create(user2);
		userDao.create(user3);
		userDao.create(user4);
		messagesDao.saveOrUpdate(message2);
		messagesDao.saveOrUpdate(message3);

		message3.setContent("this message has new text");
		messagesDao.saveOrUpdate(message3);

		Message messageRetrieved = messagesDao.getMessage(message3.getId());
		assertEquals("Retrieved message should be updated.", message3, messageRetrieved);
	}

	@Test
	public void testDelete() {
		userDao.create(user1);
		userDao.create(user2);
		userDao.create(user3);
		userDao.create(user4);
		messagesDao.saveOrUpdate(message2);
		messagesDao.saveOrUpdate(message3);

		Message messageRetrieved1 = messagesDao.getMessage(message3.getId());
		assertNotNull("Retrieved message should not be null.", messageRetrieved1);

		messagesDao.delete(message3.getId());

		Message messageRetrieved2 = messagesDao.getMessage(message3.getId());
		assertNull("Retrieved message should be null.", messageRetrieved2);
	}

	@Test
	public void testCreateMessage() {

		userDao.create(user1);

		messagesDao.saveOrUpdate(message1);

		List<Message> messages = messagesDao.getMessages();

		assertEquals("Should be one message in database.", 1, messages.size());

		assertEquals("Retrieved message should match created message.", message1, messages.get(0));

		// Get the message with ID filled in.
		message1 = messages.get(0);

		message1.setContent("Updated message text.");
		messagesDao.saveOrUpdate(message1);

		Message updated = messagesDao.getMessage(message1.getId());

		assertEquals("Updated message should match retrieved updated message", message1, updated);

		messagesDao.delete(message1.getId());

		List<Message> empty = messagesDao.getMessages();

		assertEquals("Messages lists should be empty.", 0, empty.size());
	}

	@Test
	public void testGetMessagesByUsername() {
		userDao.create(user1);

		messagesDao.saveOrUpdate(message1);

		List<Message> messagesByUsername = messagesDao.getMessagesByUsername(user1.getUsername());

		assertTrue("Messages lists should not be empty.", messagesByUsername.size() == 1);
	}

	@After
	public void cleanup() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		jdbc.execute("delete from messages");
		jdbc.execute("delete from users");

	}

}
