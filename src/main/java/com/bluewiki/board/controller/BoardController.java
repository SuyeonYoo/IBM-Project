package com.bluewiki.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
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
	 * load main page
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject selectBoardById(@PathVariable int id) throws Exception{
		JSONObject result = new JSONObject();
		
		try {
			result.put("result", boardService.selectBoard(id));
			result.put("rsltMsg", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			result.put("rsltMsg", "fail");
		}
		
		return result;
	}

}
