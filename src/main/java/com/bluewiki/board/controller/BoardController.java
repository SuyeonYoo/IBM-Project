package com.bluewiki.board.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluewiki.board.service.BoardService;
import com.bluewiki.board.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	String localPath = "C:/attachments/";
	
	/**
	 * load search result page
	 * @param 
	 * @return
	 */
	@GetMapping("/main")
	public ModelAndView mainPage() throws Exception{
		ModelAndView mainPage = new ModelAndView("/board/main");
		
		return mainPage;
	}
	
	/**
	 * load search box
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/search")
	@ResponseBody
	public JSONObject selectBoardByTitle(String title) throws Exception{
		JSONObject result = new JSONObject();
		try {
			result.put("resultList", boardService.selectBaordByTitle(title));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		return result;
	}
	
	/**
	 * load search result page
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/{no}", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject selectBoardByNo(@PathVariable int no) throws Exception{
		JSONObject result = new JSONObject();
		
		try {
			result.put("result", boardService.selectBaordByNo(no));
			result.put("rsltMsg", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			result.put("rsltMsg", "fail");
		}
		
		return result;
	}

}
