package com.webtoeic.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.TestQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.TestService;
import com.webtoeic.service.TestQuestionsService;
import com.webtoeic.service.ResultTestService;
import com.webtoeic.service.NguoiDungService;

@Controller
public class FullTestListeningController {
	
	@Autowired
	TestService baithithuServie;
	
	@Autowired
	TestQuestionsService cauhoibaithithuService;
	
	@Autowired
    ResultTestService ketquabaitestService;
	
	@Autowired
	TestService baithithuService;
	
	@Autowired
	private NguoiDungService nguoiDungService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	@RequestMapping(value="/showResultListening/{examId}/{socaudung}",method=RequestMethod.POST)
	public String showResult(Model model,@RequestBody String[] jsonAnswerUser,
							@PathVariable("examId") int examId,
							@PathVariable("socaudung") String socaudung) {
	List<TestQuestions> list = cauhoibaithithuService.getListQuestions(baithithuServie.getTest(examId).get(0));
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	NguoiDung currentUser = nguoiDungService.findByEmail(auth.getName());
	
	 for (int i = 0;i<50;i++) {
		 list.get(i).setAnswerUser(jsonAnswerUser[i]);
		
     }
	 
	// save so cau dung vao db
//	 	Date time = new Date();
//		KetQuaBaiTest ketquabaitest = new KetQuaBaiTest();
//		ketquabaitest.setNgaythi(time);
//		ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(examId).get(0));
//		ketquabaitest.setCorrectlisten(socaudung);
//		ketquabaitest.setNguoidung(currentUser);
//		
//		ketquabaitestService.save(ketquabaitest);
	 
	 //
	 
	 model.addAttribute("socaudung",socaudung);
	 model.addAttribute("listQuestion",list);
		
		return "client/listeningResult";
	}
	
	
	

	
	

}
