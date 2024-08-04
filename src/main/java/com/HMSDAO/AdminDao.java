package com.HMSDAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HMS.entities.Admin;

@Repository
public class AdminDao {
     @Autowired
    EntityManagerFactory emf;
	
     @Autowired
	EntityManager em;
	
	@Autowired
	EntityTransaction et;
	
	public void saveAdmin(Admin admin) {
		et.begin();
		em.persist(admin);
		et.commit();
	}
	
	public Admin findById(int id)
	{
		return em.find(Admin.class, id);
	}
	public void updateAdmin(Admin admin)
	{
		et.begin();
		em.merge(admin);
		et.commit();
	}
	public void deleteById(int id)
	{
		et.begin();
		em.remove(em.find(Admin.class, id));
	}
	public Admin login(String email,String password)
	{
		Query q=em.createQuery("select a from Admin a where a.email=?1 and a.password=?2");
		q.setParameter(1, email);
		q.setParameter(2, password);
		try {
			Admin a=(Admin)q.getSingleResult();
			return a;
		}
		catch (NoResultException e) {
			return null;
			// TODO: handle exception
		}
	}
}
