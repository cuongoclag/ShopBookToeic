package com.webtoeic.api.client;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.VocabularyExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.entities.CommentVocabulary;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.VocabularyExercisesService;
import com.webtoeic.service.CommentVocabularyService;
import com.webtoeic.service.NguoiDungService;

@RestController
@RequestMapping("api/client/vocab")
public class VocabularyContentApi {

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private CommentVocabularyService commentTuVungService;
	@Autowired
	private VocabularyExercisesService baitaptuvungService;

	@ModelAttribute("loggedInUser")
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@RequestMapping("/testAjax")
	String index() {

		return "Hello from ajax";
	}

	@GetMapping("/ajaxCmtVocab")
	public String getAjax(@RequestParam int id, @RequestParam String contentComment) {

		return contentComment;

	}

	@RequestMapping(value = "/ajaxCmtVocab/{contentComment}/{baitaptuvungId}", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getAjax(@PathVariable("contentComment") String contentComment,
			@PathVariable("baitaptuvungId") int id) {

		List<String> response = new ArrayList<String>();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung currentUser = nguoiDungService.findByEmail(auth.getName());

		List<VocabularyExercises> baitaptuvung = baitaptuvungService.getVocabularyExercises(id);

		// save comment
		CommentVocabulary cmt = new CommentVocabulary();
		cmt.setVocabularyExercises(baitaptuvung.get(0));
		cmt.setUsers(currentUser);
		cmt.setCmtVocabularyContent(contentComment);
		commentTuVungService.save(cmt);
		// get all comment by baituvung
//		List<CommentTuVung> listCmt = commentTuVungService.findByBaiTapTuVung(baitaptuvung.get(0));
//		int last_cmt = listCmt.size()-1;
//		System.out.println(cmt.toString());
//    	return listCmt.get(last_cmt);
		response.add(cmt.toString());
		return response;
	}

}
