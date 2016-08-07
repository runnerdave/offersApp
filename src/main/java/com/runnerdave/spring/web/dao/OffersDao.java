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
@Component("offersDao")
public class OffersDao extends BaseDao {

	public OffersDao() {
		System.out.println("Succesfully loaded Offers DAO");
	}

	@SuppressWarnings("unchecked")
	public List<Offer> getOffers() {

		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u").add(Restrictions.eq("u.enabled", true));
		return crit.list();

	}

	@SuppressWarnings("unchecked")
	public List<Offer> getOffersByUsername(String username) {

		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u");
		crit.add(Restrictions.eq("u.enabled", true));
		crit.add(Restrictions.eq("u.username", username));
		return crit.list();
	}

	public void saveOrUpdate(Offer offer) {

		session().saveOrUpdate(offer);
	}

	@Transactional
	public void create(List<Offer> offers) {

		for (Offer offer : offers) {
			this.saveOrUpdate(offer);
		}
	}

	public boolean delete(int id) {

		Query query = session().createQuery("delete from Offer where id=:id");

		query.setLong("id", id);
		return query.executeUpdate() == 1;
	}

	public Offer getOffer(int id) {
		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u");
		crit.add(Restrictions.eq("u.enabled", true));
		crit.add(Restrictions.idEq(id));
		return (Offer) crit.uniqueResult();
	}
}
