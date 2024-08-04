package com.HMSDAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HMS.entities.Hotel;
import com.HMS.entities.Product;

@Repository
public class HotelDao {
	@Autowired
	   EntityManagerFactory emf;
		
	    @Autowired
		EntityManager em;
		
		@Autowired
		EntityTransaction et;
		
		public void saveHotel(Hotel hotel) {
			et.begin();
			em.persist(hotel);
			et.commit();
		}
		
		public Hotel findHotelById(int id)
		{
			return em.find(Hotel.class, id);
		}
		public void updateHotel(Hotel hotel)
		{
			et.begin();
			em.merge(hotel);
			et.commit();
		}
		public void deleteById(int id)
		{
			et.begin();
			em.remove(em.find(Hotel.class, id));
		}
		public Hotel login(String email,String password)
		{
			Query q=em.createQuery("select h from Hotel h where h.email=?1 and h.password=?2");
			q.setParameter(1, email);
			q.setParameter(2, password);
			try {
				
				return (Hotel)q.getSingleResult();
			}
			catch (NoResultException e) {
				return null;
				
			}
		}
		public List<Hotel> findUnapprovedHotels()
		{

		Query query= em.createQuery("select h from Hotel h where h.status = 'Not approved'");
		return query.getResultList();
		}
		
		public List<Hotel> findapprovedHotels()
		{
		    Query q = em.createQuery("select h from Hotel h where h.status = 'approved' or h.status = 'UnBlocked'");
			return q.getResultList();
		}

		public List<Hotel> finBlockHotel() {
			Query q = em.createQuery("select h from Hotel h where h.status='Blocked'");
			return q.getResultList();
		}
}
				
