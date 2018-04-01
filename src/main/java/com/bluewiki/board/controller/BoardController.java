package com.bluewiki.board.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		if("체크포인트".equals(title)) {
			return new ModelAndView("/board/main_checkpoint");
		}
		
		try {
			mainPageMv.addObject("result", boardService.selectMatchTitle(title));
			mainPageMv.addObject("indexList", boardService.selectIndexList(boardService.selectMatchTitle(title).getNo()));
			mainPageMv.addObject("rsltMsg", "success");
			
			return mainPageMv;
		} catch (Exception e) {
			// TODO: handle exception
			
			title = URLEncoder.encode(title,"UTF-8");
			
			String url = "redirect:/board/noResult/"+title;
			System.out.println(url.replace("+", " "));
			return new ModelAndView(url.replace("+", " "));
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
	
	/**
	 * saveBoardFinish
	 * @param 
	 * @return 
	 * @return
	 */
	@GetMapping("/saveFinish/{title}")
	public ModelAndView saveFinish(@PathVariable String title) throws Exception{
		ModelAndView finishPageMv = new ModelAndView("/board/saveFinish");
		finishPageMv.addObject("title",title);
		
		return finishPageMv;
	}
	
	@RequestMapping("/changeSts")
	@ResponseBody
	public String changeSts(@RequestParam int brdNo) {
		
		boardService.changeSts(brdNo);
		
		return "1";
	}
	
	@RequestMapping("/retrieveBrdDetail")
	public String retrieveBrdDetail(@RequestParam int brdNo) {
		
		return "";
	} /////////////////////////해당 게시글로 이동

	@RequestMapping("/ban")
	@ResponseBody
	public String banBoard(@RequestParam(required=false, defaultValue="0") int no, @RequestParam String reason, @RequestParam(required=true) String id) {
				
		boardService.banBoard(no, reason, id);
		return "1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	/**
	 * load debate page
	 * @param 
	 * @return
	 */
	@GetMapping("/debate")
	public ModelAndView debatePage() throws Exception{
		ModelAndView debatePageMv = new ModelAndView("/board/debate");
		
		return debatePageMv;
	}

	
	
}
