package com.HMS.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.entities.Item;
import com.HMS.entities.Product;
import com.HMSDAO.ItemDao;
import com.HMSDAO.ProductDao;

@Controller
public class ItemController {
	@Autowired
	ItemDao itemdao;

	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/additem")
	public ModelAndView addItem(@RequestParam("id") int productId){
	Product product = productDao.findById(productId);
	Item item = new Item();
	item.setName(product.getName());
	item.setType(product.getType());
	item.setCost(product.getCost());
	
	ModelAndView mav = new ModelAndView();
	mav.addObject("itemobj",item);
	mav.setViewName("itemform");
	return mav;
	}
	
	@RequestMapping("/saveItemtoorder")
	public ModelAndView saveItemtoOrder(@ModelAttribute("itemobj") Item item, HttpSession session)
	{	
		item.setCost(item.getQuantity()*item.getCost());
		
		if(session.getAttribute("itemlist")== null)
		{
			List<Item> items= new ArrayList<>();
			items.add(item);

			session.setAttribute("itemlist", items);
		}
		else
		{
			List<Item> items =(List<Item>)session.getAttribute("itemlist");
			items.add(item);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("message","added successfully");
		mav.setViewName("redirect://fetchallproducts");
		return mav;
	}
	@RequestMapping("/removeItem")
    public ModelAndView removeItem(@RequestParam("id") String removeName, HttpSession session) 
	{
        List<Item> itemslist = (List<Item>) session.getAttribute("itemslist");

        if (itemslist != null) {
            itemslist = itemslist.stream().filter(item->!item.getName().equals(removeName)).collect(Collectors.toList());

            session.setAttribute("itemslist", itemslist);
        }

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "Item deleted Successfully!");
        mav.setViewName("viewaddeditemstocustomer");
        return mav;
    }
}