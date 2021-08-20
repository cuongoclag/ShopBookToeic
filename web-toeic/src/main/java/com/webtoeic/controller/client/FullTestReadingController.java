package com.webtoeic.controller.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webtoeic.entities.TestQuestions;
import com.webtoeic.service.TestService;
import com.webtoeic.service.TestQuestionsService;

@Controller
public class FullTestReadingController {
	@Autowired
	TestService baithithuServie;
	
	@Autowired
	TestQuestionsService cauhoibaithithuService;
	
	@RequestMapping(value="/reading/{examId}/{socaudung}",method=RequestMethod.POST)
	public String DetailReading(Model model,@RequestBody String[] jsonAnswerUser,
			@PathVariable("examId") int id,@PathVariable("socaudung") String socaudung) {
	
		
		List<TestQuestions> list = cauhoibaithithuService.getListQuestions(baithithuServie.getTest(id).get(0));
		model.addAttribute("listQuestion",list);
		model.addAttribute("socauListeningCorrect",socaudung);
		 return "client/fullTestReading";
	}
	
	@RequestMapping(value="/showResultReading/{examId}/{socaudung}",method=RequestMethod.POST)
	public String showResult(Model model,@RequestBody String[] jsonAnswerUser,
							@PathVariable("examId") int examId,
							@PathVariable("socaudung") int socaudung) {
	
	List<TestQuestions> list = cauhoibaithithuService.getListQuestions(baithithuServie.getTest(examId).get(0));
	
	// list có 100 câu hỏi, phần reading từ câu 51 đến 100
	 for (int i = 0;i<50;i++) {
		 list.get(i+50).setAnswerUser(jsonAnswerUser[i]);
     }
	 
	model.addAttribute("listQuestion",list);
	model.addAttribute("socaudung",socaudung);
	model.addAttribute("socauListeningCorrect",socaudung);
		return "client/readingResult";
	}

}
