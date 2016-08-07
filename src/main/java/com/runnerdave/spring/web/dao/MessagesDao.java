package com.runnerdave.spring.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
@Component("messagesDao")
public class MessagesDao extends BaseDao {

	public MessagesDao() {
		System.out.println("Succesfully loaded Messages DAO");
	}

	@SuppressWarnings("unchecked")
	public List<Message> getMessages() {

		Criteria crit = session().createCriteria(Message.class);
		return crit.list();

	}

	@SuppressWarnings("unchecked")
	public List<Message> getMessagesByUsername(String username) {

		Criteria crit = session().createCriteria(Message.class);
		crit.add(Restrictions.eq("username", username));
		return crit.list();
	}

	public void saveOrUpdate(Message message) {
		System.out.println("saving message" + message.toString());
		session().saveOrUpdate(message);
	}

	@Transactional
	public void create(List<Message> messages) {

		for (Message message : messages) {
			this.saveOrUpdate(message);
		}
	}

	public boolean delete(int id) {

		Query query = session().createQuery("delete from Message where id=:id");

		query.setLong("id", id);
		return query.executeUpdate() == 1;
	}

	public Message getMessage(int id) {
		Criteria crit = session().createCriteria(Message.class);
		crit.add(Restrictions.idEq(id));
		return (Message) crit.uniqueResult();
	}
}
