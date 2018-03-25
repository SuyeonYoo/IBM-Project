package com.bluewiki.board.controller;

import java.net.URLEncoder;

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
		ModelAndView mainPageMv = new ModelAndView("/board/main");
		
		return mainPageMv;
	}
	
	/**
	 * load search box
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/searchtxt")
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
	@SuppressWarnings("unchecked")
	@GetMapping("/main/{title}")
	@ResponseBody
	public ModelAndView selectMatchTitle(@PathVariable String title) throws Exception{
		ModelAndView mainPageMv = new ModelAndView("/board/main");
		JSONObject result = new JSONObject();
		try {
			mainPageMv.addObject("result", boardService.selectMatchTitle(title));
			mainPageMv.addObject("indexList", boardService.selectIndexList(boardService.selectMatchTitle(title).getNo()));
			System.out.println(">>>>>>>>>>>>>>>>>>>" + boardService.selectIndexList(boardService.selectMatchTitle(title).getNo()));
			mainPageMv.addObject("rsltMsg", "success");
			
			return mainPageMv;
		} catch (Exception e) {
			// TODO: handle exception
			
			title = URLEncoder.encode(title,"UTF-8");
			
			String url = "redirect:/board/noResult/"+title;
			System.out.println(url);
			return new ModelAndView(url);
		}
		
	}
	
	/**
	 * load no result page
	 * @param 
	 * @return
	 */
	@GetMapping("/noResult/{title}")
	public ModelAndView noResultPage(@PathVariable String title) throws Exception{
		ModelAndView noResultPageMv = new ModelAndView("/board/noResult");
		noResultPageMv.addObject("title", title);
		
		return noResultPageMv;
	}
	
	
	/**
	 * load create page
	 * @param 
	 * @return
	 */
	@GetMapping("/create/{title}")
	public ModelAndView createPage(@PathVariable String title) throws Exception{
		ModelAndView createPageMv = new ModelAndView("/board/create");
		createPageMv.addObject("title",title);
		
		
		return createPageMv;
	}
	

}
