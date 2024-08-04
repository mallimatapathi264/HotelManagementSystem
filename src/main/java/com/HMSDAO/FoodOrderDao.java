package com.HMSDAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.HMS.entities.FoodOrder;

@Repository
public class FoodOrderDao {
	@Autowired
	EntityManagerFactory emf;
	@Autowired
	EntityManager em;
	@Autowired
	EntityTransaction et;
	
	public void saveFoodOrder(FoodOrder foodOrder)
	{
		et.begin();
		em.persist(foodOrder);
		et.commit();
	}
	
	public void updateFoodOrder(FoodOrder foodOrder) 
	{
		et.begin();
		em.merge(foodOrder);
		et.commit();
	}
	
	public void deleteById(int id)
	{
		et.begin();
		em.remove(em.find(FoodOrder.class, id));
		et.commit();
	}
	
	public FoodOrder findById(int id)
	{
		return em.find(FoodOrder.class, id);
	}
	

}
