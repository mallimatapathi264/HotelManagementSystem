package com.HMS.controllers;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.entities.Admin;
import com.HMSDAO.AdminDao;

//controlleradvice is used to handle the global Exceptions
@Controller
public class AdminController {
	@Autowired
	AdminDao dao;
	@RequestMapping("/addadmin")
	public ModelAndView addAdmin()
	{
		Admin admin = new Admin();
		ModelAndView mav= new ModelAndView();
		mav.addObject("adminobj",admin);
		mav.setViewName("Adminform");
		return mav;
	}
	@RequestMapping("/saveadmin")
	//handler used to save admin details into database
	public ModelAndView saveAdmin(@ModelAttribute("adminobj") Admin admin) {
		dao.saveAdmin(admin);
		ModelAndView mav= new ModelAndView();
		mav.addObject("message","account created successfully");
		mav.setViewName("Adminlogin");
		return mav;	
	}
	@RequestMapping("/adminloginvalidate")// it is method level and class level annotation
	//handler used to perform login validation for admin
	public ModelAndView loginVlaidation(ServletRequest request,HttpSession session) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Admin admin= dao.login(email, password);
		if(admin!= null)
		{
			session.setAttribute("admininfo", admin);
			ModelAndView mav= new ModelAndView();
			mav.addObject("message","loggedin successfully");
			mav.setViewName("adminoptions");
			return mav;
		}else
		{
			ModelAndView mav= new ModelAndView();
			mav.addObject("message","invalid credentials");
			mav.setViewName("Adminlogin");
			return mav;
		}
	}

	@RequestMapping("/adminlogout")
		//handler is used to delete the admin data in HttpSession
	public ModelAndView logout(HttpSession session)
		{
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "logged out successfully");
		mav.setViewName("Adminhome");
		return mav;
	}
}
