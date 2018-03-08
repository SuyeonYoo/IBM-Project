package com.bluewiki.common.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bluewiki.common.search.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
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
}
