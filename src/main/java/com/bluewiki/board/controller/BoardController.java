package com.bluewiki.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@GetMapping("/index")
	public ModelAndView board() throws Exception{
		ModelAndView mv = new ModelAndView("/board/index");
		List<BoardVo> resultList = new ArrayList<>();
		resultList = boardService.selectBoardList();
		mv.addObject("boardList", resultList);
		return mv;
	}
	
	@PostMapping("/create")
	public String newPost(BoardVo boardDomain) throws Exception{
		
		boardService.insertBoard(boardDomain);
		
		return "redirect:/board/index";
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String, Object> updatePost(BoardVo boardDomain) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		try {
			boardService.updateBoard(boardDomain);
			resultMap.put("message", "success");
		} catch(Exception E) {
			System.out.print(E);
			resultMap.put("message", "fail");
		}
		return resultMap;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String, Object> deletePost(BoardVo boardDomain) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		try {
			boardService.deleteBoard(boardDomain.getId());
			resultMap.put("message", "success");
		} catch(Exception E) {
			resultMap.put("message", "fail");
		}
		return resultMap;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> read(@PathVariable int id) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		try {
			BoardVo result = boardService.selectBaord(id);
			resultMap.put("result", result);
			
			resultMap.put("localPath", localPath);
			
			resultMap.put("message", "success");
		} catch(Exception E) {
			resultMap.put("message", "fail");
		}
		return resultMap;
	}

}
