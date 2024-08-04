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
public class ProductDao {
	@Autowired
	EntityManagerFactory emf;
	@Autowired
	EntityManager em;
	@Autowired
	EntityTransaction et;
	
	@Autowired
	HotelDao hotelDao; 
	public  void saveProduct(Product product) {
		et.begin();
		em.persist(product);
		et.commit();
		
	}
	public void updateProduct(Product product)
	{
		et.begin();
		em.merge(product);
		et.commit();
	}
	public void deleteById(int id)
	{
		et.begin();
		em.remove(em.find(Product.class, id));
		et.commit();
	}
	public Product findById(int id)
	{
		return em.find(Product.class, id);
	}
	
	public List<Product> findAllProducts()
	{
		Query q= em.createQuery("select p from Product p" );
		try 
		{
			List<Product> p= q.getResultList();
			return p;
		}
		catch(NoResultException e)
			{
				return null;
			}
	}
	
	public List<Product> fetchProductsByHotel(String hotelName) 
	{
		Query q= em.createQuery("select h from Hotel h where h.name=?1");
          q.setParameter(1, hotelName);
          
          Hotel hotel= (Hotel)q.getSingleResult();
          return hotel.getProducts();
	}
	
	public List<Product> fetchProductsBetweenPriceRange(double minCost, double maxCost)
	{
	   Query q=	em.createQuery("select p from Product p where p.cost between ?1 and ?2");
		q.setParameter(1, minCost);
		q.setParameter(2,maxCost);
		List<Product>	products= q.getResultList();
		return products;
		
	}
}
