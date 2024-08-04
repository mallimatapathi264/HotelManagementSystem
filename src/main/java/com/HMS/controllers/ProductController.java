package com.HMS.controllers;

import java.rmi.server.RMIClassLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.hql.internal.ast.tree.MapValueNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.entities.Hotel;
import com.HMS.entities.Product;
import com.HMSDAO.HotelDao;
import com.HMSDAO.ProductDao;
//whenever we are  adding products initially we should set that product to the hotel because of easy to identify
@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;
	@Autowired
	HotelDao hotelDao;
	
	@RequestMapping("/addproduct")
	public ModelAndView addProduct()
	{
		Product p= new Product();
		ModelAndView mav= new ModelAndView();
		mav.addObject("productobj",p);
		mav.setViewName("productform");
		return mav;
	}
	
	@RequestMapping("/saveproduct")
	//handler is used to save product entity object to database
		public ModelAndView saveProduct(@ModelAttribute("productobj") Product p, HttpSession session) 
		{
		Integer hotel_id= (Integer)session.getAttribute("hotelinfo");
		Hotel hotel=hotelDao.findHotelById(hotel_id);
		List<Product> products = hotel.getProducts();
		if(products.size()>0)
		{
			products.add(p);
			hotel.setProducts(products);
		}
		else {
			List<Product> productList = new ArrayList<Product>();
			productList.add(p);
			hotel.setProducts(productList);
		}
		productDao.saveProduct(p);
		hotelDao.updateHotel(hotel);
		ModelAndView mav= new ModelAndView();
		mav.addObject("message","added successfully");
		mav.setViewName("hoteloptions");
		return mav;
	}
	
	@RequestMapping("/fetchallhotelproducts")
	//this handler is used to  fetch all the products of particualr hotel and submit to displayproductstohotel.jsp
	public ModelAndView fetchAllHotelProducts(HttpSession session)
	{
		Integer hotel_id= (Integer)session.getAttribute("hotelinfo");
		Hotel  hotel =hotelDao.findHotelById(hotel_id);
		List<Product> products = hotel.getProducts();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("products",products);
		mav.setViewName("displayproductstohotel");
		return mav;
	}
	@RequestMapping("/updateproduct")
	public ModelAndView updateProduct(@RequestParam("id") int id) //rp is used to fetch information from query parameter
	{
		Product product= productDao.findById(id);
		ModelAndView mav= new ModelAndView();
		mav.addObject("existingProductInfo",product);
		mav.setViewName("updateproductform");
		return mav;
	}
	
	@RequestMapping("/updateproductinfo")
	public ModelAndView updateProductInformation(@ModelAttribute("existingProductInfo") Product p)
	{
		productDao.updateProduct(p);
		ModelAndView mav= new ModelAndView();
		mav.addObject("message"," Product updated Successfully");
		mav.setViewName("redirect://fetchallhotelproducts");
		return mav;
	}
	@RequestMapping("/delete")
	public ModelAndView deleteProduct(@RequestParam("id")int id, HttpSession session) 
	{
		Integer hotel_id= (Integer)session.getAttribute("hotelinfo");
		Hotel hotel= hotelDao.findHotelById(hotel_id);
		List<Product> products= hotel.getProducts();
		
		List<Product> productList =products.stream().filter(product->product.getId()!=id).collect(Collectors.toList());
		hotel.setProducts(productList);
		hotelDao.updateHotel(hotel); 
		productDao.deleteById(id);
		ModelAndView mav= new ModelAndView();
		mav.addObject("message","product deleted Successfully");
		mav.setViewName("redirect://fetchallhotelproducts");
		return mav;
	}
	
	@RequestMapping("/fetchproductsbyhotel")
	public ModelAndView fetchProductByHotel(ServletRequest request)
	{
		String hotelName= request.getParameter("hotelname");
		List<Product> products= productDao.fetchProductsByHotel(hotelName);
		ModelAndView mav= new ModelAndView();
		mav.addObject("productList",products);
		mav.setViewName("displayproductstocustomer");
		return mav;
	}
	
	@RequestMapping("/fetchallproducts")
	public ModelAndView fetchAllProducts() {
		List<Product> products= productDao.findAllProducts();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList",products);
		mav.setViewName("displayproductstocustomer");
		return mav;
	}
	@RequestMapping("/fetchproductsbetweenpricerange")
	public ModelAndView fetchProductsBetweenPriceRange(ServletRequest request) 
	{
		String minPrice = request.getParameter("minprice");
		String maxPrice= request.getParameter("maxprice");
		List<Product> products=productDao.fetchProductsBetweenPriceRange(Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
		ModelAndView mav= new ModelAndView();
		mav.addObject("productList",products);
		mav.setViewName("displayproductstocustomer");
		return mav;
	}
	
	@RequestMapping("/updateproductsbyId")
	public ModelAndView updateProductById(ServletRequest request) {
		Integer id=Integer.parseInt(request.getParameter("id"));
		Product productid= productDao.findById(id);
		ModelAndView mav= new ModelAndView();
		mav.addObject("existingProductinfobyId",productid);
		mav.setViewName("updateproductformbyId");
		return mav;
	}
	@RequestMapping("/updateproductinfobyid")
	public ModelAndView updateproductinfobyid(@ModelAttribute("existingProductById") Product p)
	{
		productDao.updateProduct(p);
		ModelAndView mav= new ModelAndView();
		mav.addObject("message", "updated successfully");
		mav.setViewName("hoteloptions");
		return mav;
	}
}



