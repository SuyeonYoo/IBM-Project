package com.bluewiki.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bluewiki.common.service.SearchService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	SearchService searchService;

	/**
	 * load search main page
	 * @param 
	 * @return
	 */
	@GetMapping("/searchPage")
	public ModelAndView search() throws Exception{
		ModelAndView mv = new ModelAndView("/search/search_main_page");
		return mv;
	}
	
	/**
	 * load login page
	 * @param 
	 * @return
	 */
	@GetMapping("/login")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView("/common/login");
		return mv;
	}
	
	/**
	 * load login page
	 * @param 
	 * @return
	 */
	@GetMapping("/signUp")
	public ModelAndView signUp() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signUp");
		return mv;
	}
}
