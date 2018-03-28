package com.bluewiki.common.controller;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.bluewiki.common.vo.MemberVo;

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
	@GetMapping("/first")
	public ModelAndView loadFirstPage() throws Exception{
		ModelAndView mv = new ModelAndView("/common/first");
		return mv;
	}

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
	 * sign up 
	 * @param 
	 * @return
	 */
	@PostMapping("/signup_member")
	@ResponseBody
	public ResponseEntity<String> signup_member(@RequestParam Map<String, Object> paramMap) throws Exception{
		String resultData = "";
		
		String passWord = (String)paramMap.get("pwd");
		String memberId = (String)paramMap.get("memberId");
		
		Pattern wordPattern = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");
		Matcher wordMatcher = wordPattern.matcher(passWord);
		
		Pattern samePattern = Pattern.compile("(\\w)\\1\\1\\1");
		Matcher sameMatcher = samePattern.matcher(passWord);
		
		Pattern samePattern2 = Pattern.compile("([\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"])\\1\\1\\1");
		Matcher sameMatcher2 = samePattern2.matcher(passWord);
		
		if(spaceCheck(passWord)){	//패스워드 공백 문자열 체크
			
			resultData = "비밀번호에 공백문자를 허용하지 않습니다.";
		} else if (!wordMatcher.find()){	//정규식 이용한 패턴 체크
			
			resultData = "비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를\n조합하여 10~16자로 구성하세요.";
		} else if (sameMatcher.find() || sameMatcher2.find()){	// 동일 문자 4번 입력 시 패턴 체크
			
			resultData = "비밀번호에 동일문자를 4번 이상 사용할 수 없습니다.";
		} else if (continueNumberCheck(passWord)){	// 비밀번호 연속 숫자 4자리 체크
			
			resultData = "비밀번호에 연속된 숫자를 4자 이상 사용 할 수 없습니다.";
		} else if (passWord.equals(memberId)) {
			
			resultData = "비밀번호와 아이디는 같을 수 없습니다.";
		} else {
			
			try {
				
				memberService.insertNewMember(paramMap);
				resultData = "success";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<String>(resultData,HttpStatus.OK);
	}
	
	/**
	 * 공백 문자 체크
	 *
	 * @param spaceCheck
	 * @return
	 */
	public boolean spaceCheck(String spaceCheck) throws Exception {
		
		for(int i = 0 ; i < spaceCheck.length() ; i++) {
			
			if(spaceCheck.charAt(i) == ' ') {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * 연속된 숫자 체크
	 *
	 * @param numberCheck
	 * @return
	 */
	public boolean continueNumberCheck(String numberCheck) throws Exception {
		
		int lastVal = 0;		// currentVal 의 이전상태 백업, 이전문자의 아스키 코드가 된다. 
		int minusVal = 0;		// currentVal와 lastVal의 아스키 코드 차이값으로 이값이 -1, 0, 1이면 이웃한 두 문자가 연속이라는 의미
		int chkContinue = 0;	// p의 이전상태 백업 p와 d가 동일하다면 연속이 계속된다는 의미임으로 카운트한다.
		int cntNum = 0;		
		int limit = 4;
	  
		for(int i = 0 ; i < numberCheck.length() ; i++) {
			
			char currentVal = numberCheck.charAt(i);
			if (i > 0 && (chkContinue = lastVal - currentVal) > -2 && chkContinue < 2 && (cntNum = chkContinue == minusVal ? cntNum + 1 : 0) > limit - 3) {
				return true;
			}
			minusVal = chkContinue;
		    lastVal = currentVal;
		}
		
		return false;
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
	
	/**
	 * sign in member
	 * @param 
	 * @return
	 */
	@PostMapping("/signin_member")
	@ResponseBody
	public ResponseEntity<String> signin(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		String resultData = "";
		
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		
		try {
			member = memberService.selectMemberInfo(paramMap);		// member 정보 가져오기
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (member != null) {
			String inputId = (String)paramMap.get("memberId");
			String inputPwd = (String)paramMap.get("pwd");
			
			if (member.getMember_id().equals(inputId) && member.getPwd().equals(inputPwd)) {
				resultData = "success";
				session.setAttribute("member_id", member.getMember_id());
			} else {
				resultData = "fail";
			}
		} else {
			resultData = "fail";
		}
		
		return new ResponseEntity<String>(resultData,HttpStatus.OK);
	}
}
