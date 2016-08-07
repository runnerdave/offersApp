package com.runnerdave.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.runnerdave.spring.web.dao.Offer;
import com.runnerdave.spring.web.dao.OffersDao;

@Service("offersService")
public class OffersService {
	
	private OffersDao offersDao;
	
	@Autowired
	public void setOffersDao(OffersDao offersDao) {
		this.offersDao = offersDao;
	}

	public List<Offer> getCurrent() {		
		return offersDao.getOffers();
	}
	
	public List<Offer> getOffersByUsername(String username) {		
		return offersDao.getOffersByUsername(username);
	}

	@Secured({"ROLE_USER","ROLE_ADMIN"})
	public void create(Offer offer) {
		offersDao.saveOrUpdate(offer);
		
	}

	public boolean hasOffer(String name) {
		if (name == null) return false;
		List<Offer> offers = offersDao.getOffersByUsername(name);
		if (offers.size() > 0) {
			return true;
		}
		
		return false;
	}

	public Offer getSingleOfferByUsername(String username) {
		if (username == null) {
			return null;
		}
		List<Offer> offers = offersDao.getOffersByUsername(username);
		
		if (offers.size() == 0) {
			return null;
		}
		return offers.get(0);
	}

	public void saveOrUpdate(Offer offer) {
		offersDao.saveOrUpdate(offer);
	}

	public void delete(Offer offer) {
		offersDao.delete(offer.getId());
		
	}
}
