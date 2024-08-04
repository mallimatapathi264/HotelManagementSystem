package com.HMS.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.entities.Customer;
import com.HMS.entities.FoodOrder;
import com.HMS.entities.Item;
import com.HMSDAO.CustomerDao;
import com.HMSDAO.FoodOrderDao;

@Controller
public class FoodOrderController {
	
	@Autowired
	CustomerDao customerDao;
	
	@Autowired
	FoodOrderDao foodorderDao;
	
	@RequestMapping("/addfoodorder")
	public ModelAndView addFoodOrder(HttpSession session)
	{
		FoodOrder foodorder = new FoodOrder();
		ModelAndView  mav= new ModelAndView();
		mav.addObject("foodOrderObj",foodorder);
		mav.setViewName("foodorderform");
		return mav;
	}
		
		@RequestMapping("/saveFoodOrder")
		public ModelAndView saveFoodOrder(@ModelAttribute("foodOrderObj") FoodOrder foodorder, HttpSession session)
		{
			List<Item> items = (List)session.getAttribute("itemlist");
			foodorder.setItems(items);
			double totalprice=items.stream().map(i->i.getCost()).mapToDouble(Double::new).sum();
			foodorder.setTotalprice(totalprice);
			Integer customerId= (Integer)session.getAttribute("customerinfo");
			Customer customer = customerDao.findById(customerId);
			List<FoodOrder> foodorders = customer.getFoodorders();
			if(foodorders.size()>0)
			{
				foodorders.add(foodorder);
				customer.setFoodorders(foodorders);
			}
			else
			{
				List<FoodOrder> foodorderslist = new ArrayList<>();
				foodorderslist.add(foodorder);
				customer.setFoodorders(foodorderslist);
			}
			foodorderDao.saveFoodOrder(foodorder);
			customerDao.updateCustomer(customer);
			
			session.removeAttribute("itemlist");
			
			ModelAndView mav= new ModelAndView();
			mav.addObject("message","orderd Successfully");
			mav.addObject("foodOrderInfo",foodorder);
			mav.setViewName("displaybilltocustomer");
			return mav;
		}
		
		
		
		
}