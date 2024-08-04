package com.HMSDAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HMS.entities.Customer;

@Repository
public class CustomerDao {
	@Autowired
   EntityManagerFactory emf;
	
    @Autowired
	EntityManager em;
	
	@Autowired
	EntityTransaction et;
	
	public void saveCustomer(Customer customer) {
		et.begin();
		em.persist(customer);
		et.commit();
	}
	
	public Customer findById(int id)
	{
		return em.find(Customer.class, id);
	}
	public void updateCustomer(Customer customer)
	{
		et.begin();
		em.merge(customer);
		et.commit();
	}
	public void deleteById(int id)
	{
		et.begin();
		em.remove(em.find(Customer.class, id));
	}
	public Customer login(String email,String password)
	{
		Query q=em.createQuery("select c from Customer c where c.email=?1 and c.password=?2");
		q.setParameter(1, email);
		q.setParameter(2, password);
		try {
			
			return (Customer)q.getSingleResult();
		}
		catch (NoResultException e) {
			return null;
			
		}
	}
}