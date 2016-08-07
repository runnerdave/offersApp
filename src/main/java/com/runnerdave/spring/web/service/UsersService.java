package com.runnerdave.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.runnerdave.spring.web.dao.Message;
import com.runnerdave.spring.web.dao.MessagesDao;
import com.runnerdave.spring.web.dao.User;
import com.runnerdave.spring.web.dao.UsersDao;

@Service("usersService")
public class UsersService {
	
	
	@Autowired
	private UsersDao usersDao;
	
	@Autowired
	private MessagesDao messagesDao;
	
	public void create(User user) {
		usersDao.create(user);
		
	}

	public boolean exists(String username) {
		return usersDao.exists(username);
	}


	@Secured("ROLE_ADMIN")
	public List<User> getAllUsers() {
		
		return usersDao.getAllUsers();
	}
	
	public void sendMessage(Message message) {
		messagesDao.saveOrUpdate(message);
	}
	
	public User getUser(String username) {
		return usersDao.getUserByUsername(username);
	}
	
	public List<Message> getMessagesByUsername(String username) {
		return messagesDao.getMessagesByUsername(username);
	}
}
