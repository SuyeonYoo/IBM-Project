package com.bluewiki.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluewiki.board.service.BoardService;
import com.bluewiki.board.vo.InqBoardVo;
import com.bluewiki.common.service.MemberService;
import com.bluewiki.common.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/adminMain")
	public ModelAndView loadSignInPage() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/adminMain");
		return mv;
	}
	
	@RequestMapping("/rptMember")
	public String rptMemberList(ModelMap map) {
		
		List<MemberVo> result = new ArrayList<>();
		result = memberService.getRptMember();
		
		for(MemberVo mem : result) {
			if(mem.getAuthority().equals("01")) {
				mem.setAuthority("회원");
			}
			else{
				mem.setAuthority("관리자");
			}
			
		}
		
		
		map.addAttribute("result", result);
		
		return "/admin/rptMemberList";
	}
	
	@RequestMapping("/changeSts")
	@ResponseBody
	public String changeSts(@RequestParam String memberId) {
		
		memberService.changeSts(memberId);
		
		return "1";
	}
	
	@RequestMapping("/rptPost")
	public String rptPost(ModelMap map) {
		
		List<InqBoardVo> result = new ArrayList<>();
		result = boardService.getRptPostList();
		
		map.addAttribute("result", result);
		
		return "/admin/rptPostList";
	}
	
	
	
	
}
