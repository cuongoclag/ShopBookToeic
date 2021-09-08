package com.webtoeic.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.webtoeic.entities.VocabularyExercises;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.Roles;
import com.webtoeic.service.ListeningExercisesService;
import com.webtoeic.service.VocabularyExercisesService;
import com.webtoeic.service.ListeningExercisesQuestionsService;
import com.webtoeic.service.NguoiDungService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
    VocabularyExercisesService baitaptuvungService;
	
	@Autowired
	NguoiDungService nguoiDungService;

	@Autowired
    ListeningExercisesService listeningExercisesService;
	
	@Autowired
    ListeningExercisesQuestionsService cauHoiBaiNgheService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}
	@GetMapping({"/AdminIndex", ""})
	public String AdminIndex() {
		return "admin/AdminIndex";
	}

	@GetMapping({"/bai-nghe"})
	public String quanLyBaiNghePage() {
		return "admin/Listening";
	}

	@GetMapping("/bai-doc")
	public String quanLyBaiDocPage() {
		return "admin/Reading";
	}

	@GetMapping("/grammar")
	public String quanLyGrammar() {
		return "admin/Grammar";
	}

	@GetMapping("/vocab")
	public String quanLyVocab(Model model) {
		model.addAttribute("listVocab", baitaptuvungService.findAll());
		model.addAttribute("baitaptuvung", new VocabularyExercises());

		return "admin/Vocabulary";
	}
	
	@GetMapping("/exam")
	public String quanLyExam(Model model) {
		model.addAttribute("baithithu", new VocabularyExercises());
		return "admin/Exam";
	}
	
	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoan(Model model) {
	    model.addAttribute("listVaiTro", Roles.values());
	    model.addAttribute("listAll", nguoiDungService.findAll());
		return "admin/Account";
	}
	
	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "admin/Profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setAddress(nd.getAddress());
		currentUser.setFullName(nd.getFullName());
		currentUser.setPhone(nd.getPhone());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/Profile";
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
		
	}

}
