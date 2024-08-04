package com.HMS.ConfgCls;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class ConfigCls {
		@Bean
		public EntityManagerFactory getEMF()
		{
			return Persistence.createEntityManagerFactory("dev");
		}
		
		@Bean 
		public EntityManager getEM() {
			
			EntityManagerFactory emf= getEMF();
			EntityManager em=emf.createEntityManager();
			return em;
		}
		
		@Bean
		public EntityTransaction getET()
		{
			EntityManager em=getEM();
			EntityTransaction et= em.getTransaction();
			return et;
		}
	}
