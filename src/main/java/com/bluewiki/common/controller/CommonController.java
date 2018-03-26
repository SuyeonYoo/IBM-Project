package com.bluewiki.common.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluewiki.common.service.MemberService;
import com.bluewiki.common.service.SearchService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	SearchService searchService;
	
	@Autowired
	MemberService memberService;

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
	 * load signin page
	 * @param 
	 * @return
	 */
	@GetMapping("/signin")
	public ModelAndView loadSignInPage() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signin");
		return mv;
	}
	
	/**
	 * load signup page
	 * @param 
	 * @return
	 */
	@GetMapping("/signup")
	public ModelAndView loadSignUpPage() throws Exception{
		ModelAndView mv = new ModelAndView("/common/signup");
		return mv;
	}
	
	/**
	 * check Id 
	 * @param 
	 * @return
	 */
	@PostMapping("/checkExistedId")
	@ResponseBody
	public ResponseEntity<Boolean> checkExistedId(@RequestParam Map<String, Object> paramMap) throws Exception{
		Boolean isExistedId = false;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		int usrCnt = memberService.selectExistedId((String)paramMap.get("usrId"));
		
		if (usrCnt == 1) {
			isExistedId = false;
		} else {
			isExistedId = true;
		}
		
		return new ResponseEntity<Boolean>(isExistedId,responseHeaders,HttpStatus.OK);
	}
	
	/**
	 * load welcome page
	 * @param 
	 * @return
	 */
	@GetMapping("/welcome")
	public ModelAndView loadWelcomePage() throws Exception{
		ModelAndView mv = new ModelAndView("/common/welcome");
		return mv;
	}
}
