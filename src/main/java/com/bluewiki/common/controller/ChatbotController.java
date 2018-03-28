package com.bluewiki.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.watson.developer_cloud.conversation.v1.Conversation;
import com.ibm.watson.developer_cloud.conversation.v1.model.InputData;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;
import com.ibm.watson.developer_cloud.conversation.v1.model.OutputData;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {

	@Autowired
	protected Conversation conversation;
	
	/**
	 * load search main page
	 * @param 
	 * @return
	 */
	@GetMapping("/first")
	public ModelAndView loadFirstPage() throws Exception{
		ModelAndView mv = new ModelAndView("/common/welcome");
		
		conversation = new Conversation("2017-05-26");
		conversation.setUsernameAndPassword("6aea7c6e-ff85-469c-97bf-c0faaa28584c", "rsnbc5VGuz5K");
		String workspaceId = "7d07f499-2c31-43d1-9095-0c9d7c964bc9";

		InputData input = new InputData.Builder("Hi").build();
		MessageOptions options = new MessageOptions.Builder(workspaceId).input(input).build();
		MessageResponse response = conversation.message(options).execute();
		
		System.out.println(response);
		
		OutputData output = response.getOutput();
		List<String> textList = new ArrayList<String>();
		
		textList = response.getOutput().getText();
		String finalAnswer = "";
		
		for (int i=0; i < textList.size(); i++) {
			finalAnswer += textList.get(i) + "\n";
			finalAnswer += "헤헤";
		}
		
		System.out.println("아웃풋 : " + output);
		System.out.println("대답 : " + finalAnswer);
		
		return mv;
	}
}
