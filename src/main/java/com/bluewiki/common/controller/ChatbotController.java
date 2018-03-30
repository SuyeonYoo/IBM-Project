package com.bluewiki.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.watson.developer_cloud.conversation.v1.Conversation;
import com.ibm.watson.developer_cloud.conversation.v1.model.Context;
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
	 * getFirstOutput
	 * @param 
	 * @return
	 */
	@PostMapping("/getFirstOutput")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> getFirstOutput(@RequestParam Map<String, Object> paramMap) throws Exception{
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		Context context = null;
		String answer = "";
		
		if ("true".equals((String)paramMap.get("isFirst"))) {
			// conversation 기본정보
			conversation = new Conversation("2018-02-16");
			conversation.setUsernameAndPassword("6aea7c6e-ff85-469c-97bf-c0faaa28584c", "rsnbc5VGuz5K");
			String workspaceId = "7d07f499-2c31-43d1-9095-0c9d7c964bc9";

			InputData input = new InputData.Builder("").build();
			MessageOptions options = new MessageOptions.Builder(workspaceId).input(input).build();
			MessageResponse response = conversation.message(options).execute();
			
			List<String> textList = new ArrayList<String>();
			textList = response.getOutput().getText();			// 답변 얻기
			
			for (int i=0; i < textList.size(); i++) {
				answer += textList.get(i) + "\n";
			}
			
			context = response.getContext();	// 다음을 위한 context
			
			result.put("answer", answer);		// 답변
			result.put("context", context);		// context
		}
		
		return new ResponseEntity<HashMap<String, Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * getNext
	 * @param 
	 * @return
	 */
	@PostMapping("/getNext")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> getNext(@RequestParam Map<String, Object> paramMap) throws Exception{
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		Context context = null;		// Watson context
		String stringContext = (String)paramMap.get("context");
		String question = (String)paramMap.get("question");		// 사용자의 질문
		String answer = ""; 									// Watson 새로운 대답 
		
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(stringContext);
		
		System.out.println("gg" + json);
		
		System.out.println("input context" + context);
		System.out.println("input question" + question);
		System.out.println("string context" + stringContext);
		
		// conversation 기본정보
		conversation = new Conversation("2018-02-16");
		conversation.setUsernameAndPassword("6aea7c6e-ff85-469c-97bf-c0faaa28584c", "rsnbc5VGuz5K");
		String workspaceId = "7d07f499-2c31-43d1-9095-0c9d7c964bc9";

		InputData input = new InputData.Builder(question).build();
		MessageOptions options = new MessageOptions.Builder().workspaceId(workspaceId)
								.input(input)
								.context(context) // output context from the first message
								.build();
		MessageResponse response = conversation.message(options).execute();
		
		System.out.println(response);
		
		List<String> textList = new ArrayList<String>();
		textList = response.getOutput().getText();			// 답변 얻기
		
		for (int i=0; i < textList.size(); i++) {
			answer += textList.get(i) + "\n";
		}
		
		context = response.getContext();	// 다음을 위한 context
		System.out.println("컨"+context);
		
		result.put("answer", answer);		// 답변
		result.put("context", context);		// context
		
		return new ResponseEntity<HashMap<String, Object>>(result,HttpStatus.OK);
	}
	
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

		InputData input = new InputData.Builder("").build();
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
		
		Context context = null;

		// first message
		MessageOptions newMessageOptions = new MessageOptions.Builder()
				.workspaceId(workspaceId)
				.input(input)
				.context(context)
				.build();

		response = conversation.message(newMessageOptions).execute();
		
		System.out.println(" 두번째 response" + response );

		// second message
		newMessageOptions = new MessageOptions.Builder()
		  .workspaceId(workspaceId)
		  .input(new InputData.Builder("good song music").build())
		  .context(response.getContext()) // output context from the first message
		  .build();

		response = conversation.message(newMessageOptions).execute();

		System.out.println(" 세번째 response" + response);
		
		return mv;
	}
}
