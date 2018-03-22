package com.bluewiki.common.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewiki.common.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
    MailService mailService;

	/**
	 * send auth mail
	 * @param 
	 * @return
	 */
	@PostMapping("/sendAuthMail")
	@ResponseBody
	public ResponseEntity<String> sendAuthMail(@RequestParam Map<String, Object> paramMap) throws Exception{
		
		String resultData = "";
		
		String userEmail = (String)paramMap.get("userEmail");

        try {
            resultData = mailService.sendAuthMail(userEmail);
        } catch (MailException e) {
            e.printStackTrace();
        }
		
		return new ResponseEntity<String>(resultData,HttpStatus.OK);
	}
}
