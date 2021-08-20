package com.webtoeic.api.client;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.TestQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.TestService;
import com.webtoeic.service.TestQuestionsService;
import com.webtoeic.service.ResultTestService;
import com.webtoeic.service.NguoiDungService;

@RestController
@RequestMapping("api/client/exam")
public class TestListeningApi {

	@Autowired
	ResultTestService ketquabaitestService;

	@Autowired
	TestQuestionsService testQuestionsService;
	@Autowired
	TestService testService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@ModelAttribute("loggedInUser")
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}


	@RequestMapping(value="/ajaxTestListening/{baithithuId}/{socaudung}", method = RequestMethod.POST)
	public @ResponseBody
	List<String>  AjaxListening(@RequestBody String[] jsonAnswerUser,
								@PathVariable("baithithuId") int id,
								@PathVariable("socaudung") String socaudung) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung currentUser = nguoiDungService.findByEmail(auth.getName());

		List<TestQuestions> list = testQuestionsService.getListQuestions(testService.getTest(id).get(0));

		// save ketqua bai test
//		Date time = new Date();
//		KetQuaBaiTest ketquabaitest = new KetQuaBaiTest();
//		ketquabaitest.setNgaythi(time);
//		ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(id).get(0));
//		ketquabaitest.setCorrectlisten(socaudung);
//		ketquabaitest.setNguoidung(currentUser);
//		
//		ketquabaitestService.save(ketquabaitest);




		List<String> response = new ArrayList<String>();

		return response;
	}


}
