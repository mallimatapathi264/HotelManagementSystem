package com.HMS.controllers;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.entities.Hotel;
import com.HMSDAO.HotelDao;
//here account status decided by the admin that's why we are not provide account status here
@Controller
public class HotelController {
	
	@Autowired
	HotelDao dao;
	
	@RequestMapping("/addhotel")
	//handler used  to create hotel class object and pass it to HotelForm.jsp
	public ModelAndView addHotel()
	{
		Hotel hotel = new Hotel();
		ModelAndView mav= new ModelAndView();
		mav.addObject("hotelobj",hotel);
		mav.setViewName("HotelForm");
		return mav;
	}
	@RequestMapping("/savehotel")
	//handler used to save hotel information in database
	public ModelAndView saveHotel(@ModelAttribute("hotelobj") Hotel hotel) {
		hotel.setStatus("Not Approved");
		dao.saveHotel(hotel);
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("message", "your account is in review, please wait for some time");
		mav.setViewName("Hotellogin");
		return mav;
	}
	@RequestMapping("/hotelloginvalidate")
	// perform hotel lognvalidation and return approrpriate response
	public ModelAndView hotelLoginValidate(ServletRequest request,HttpSession session )
	{
		String email= request.getParameter("email");
		String password=request.getParameter("password");
		
		Hotel hotel=dao.login(email, password);
		if(hotel!=null)
		{
			if(hotel.getStatus().equals("Not Approved")) 
			{
				ModelAndView mav= new ModelAndView();
				mav.addObject("message","your account is in review, please wait for some time");
				mav.setViewName("displaymessage");
				return mav;
			}
			else if(hotel.getStatus().equals("blocked"))
			{
				ModelAndView mav= new ModelAndView();
				mav.addObject("message", "your account is blocked");
				mav.setViewName(("displaymessage"));
				return mav;
			}
		
			else {
				//storing hotel entity object into session
				//storing the logged in hotel into session
				session.setAttribute("hotelinfo",hotel.getId());//overcome the more usage of servertime
				ModelAndView mav= new ModelAndView();
				mav.addObject("message", "logged in succesfully");
				mav.setViewName("hoteloptions");
				return mav;
			}
	}
		else
		{
			ModelAndView mav= new ModelAndView();
			mav.addObject("message", "invalid Credentials");
			mav.setViewName("Hotellogin");
			return mav;
		}
	}
	@RequestMapping("/fetchunapprovedhotels")
	//handler is used to find uapproved hotels
	public ModelAndView fetchUnapprovedHotels()
	{
		List<Hotel> hotels= dao.findUnapprovedHotels();
		ModelAndView mav= new ModelAndView();
		mav.addObject("unapprovedhotels",hotels);
		mav.setViewName("displayunapprovedhotels");
		return mav;
	}
	@RequestMapping("/approvehotel")
	//handler is used to modify the hotel status as approved
	public ModelAndView approveHotel(@RequestParam("id") int id) {
		Hotel h = dao.findHotelById(id);
		h.setStatus("approved");
		dao.updateHotel(h);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("redirect://fetchunapprovedhotels");
		return mav;
	}
	
	//fetch 
	@RequestMapping("/fetchunblockedhotels")		
	public ModelAndView fetchUnblockedHotel()
	{
		List<Hotel> hotels= dao.findapprovedHotels();
		ModelAndView mav= new ModelAndView();
		mav.addObject("approvedhotels",hotels);
		mav.setViewName("displayunblck_aproved");
		return mav;
	}
	@RequestMapping("/blockhotel")
	//handler is used to modify the hotel status as approved
	public ModelAndView blockHotel(@RequestParam("id") int id) {
		Hotel h = dao.findHotelById(id);
		h.setStatus("Blocked");
		dao.updateHotel(h);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("redirect://fetchunblockedhotels");
		return mav;
	}
	
	//fetch 
		@RequestMapping("/fetchblockedhotels")		
		public ModelAndView fetchblockedHotel()
		{
			List<Hotel> hotels= dao.finBlockHotel();
			ModelAndView mav= new ModelAndView();
			mav.addObject("blockedhotels",hotels);
			mav.setViewName("displayblockedhotels");
			return mav;
		}
		@RequestMapping("/unblockhotel")
		//handler is used to modify the hotel status as approved
		public ModelAndView unBlockHotel(@RequestParam("id") int id) {
			Hotel h = dao.findHotelById(id);
			h.setStatus("UnBlocked");
			dao.updateHotel(h);
			
			ModelAndView mav= new ModelAndView();
			mav.setViewName("redirect://fetchunblockedhotels");
			return mav;
		}
	
	
	@RequestMapping("/hotellogout")
	//handler is used to delete the Hotel data in HttpSession
	public ModelAndView Hotellogout(HttpSession session)
	{
	ModelAndView mav = new ModelAndView();
	mav.addObject("message", "logged out successfully");
	mav.setViewName("HotelHomepage");
	return mav;
	}
}


