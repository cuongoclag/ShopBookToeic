package com.webtoeic.controller.admin;

import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.SaleOrder;
import com.webtoeic.repository.ProductRepository;
import com.webtoeic.repository.ReviewRepository;
import com.webtoeic.repository.SaleOrderRepository;
import com.webtoeic.service.*;
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

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {
	@Autowired
	ProductRepository productRepo;

	@Autowired
	SaleOrderRepository saleOrderRepo;

	@Autowired
	ReviewRepository reviewRepository;

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
	@GetMapping({"/admin/", ""})
	public String AdminIndex(Model model) {
		model.addAttribute("lengthProducts", productRepo.findAll());
		model.addAttribute("lengthOrders", saleOrderRepo.findAll());
		model.addAttribute("lengthUsers", nguoiDungService.findAll());
		model.addAttribute("lengthReviews", reviewRepository.findAll());


		List<SaleOrder> saleOrders = saleOrderRepo.findAll();
		Map<String, Integer> saleOrder = new LinkedHashMap<>();
		int sum1 = 0,sum2 = 0,sum3 = 0,sum4 = 0,sum5 = 0,sum6 = 0,sum7 = 0,sum8 = 0,sum9 = 0,sum10 = 0,sum11 = 0,sum12 =0 ;
		int sum = 0;
		int quantity = 0;
		for (SaleOrder saleOrder1 : saleOrders) {

			LocalDateTime date =  saleOrder1.getCreatedDate();
			Date in = new Date();
			Date out = Date.from(date.atZone(ZoneId.systemDefault()).toInstant());  // chuyển từ localdatetime về date

			SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
			String dateFormat = formatter.format(out);                             // chuyển từ date về string
			sum = sum + saleOrder1.getTotal().intValue();
			for (int i = 0; i < saleOrder1.getSaleOrderProducts().size(); i++) {
				quantity =quantity +saleOrder1.getSaleOrderProducts().get(i).getQuantity();
			}
			String month =  (String) dateFormat.subSequence(4, 7);
			if(month.equals("Jan")) {
				sum1 = sum1 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Feb")) {
				sum2 = sum2 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Mar")) {
				sum3 = sum3 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Apr")) {
				sum4 = sum4 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("May")) {
				sum5 = sum5 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Jun")) {
				sum6 = sum6 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Jul")) {
				sum7 = sum7 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Aug")) {
				sum8 = sum8 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Sep")) {
				sum9 = sum9 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Oct")) {
				sum10 = sum10 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Nov")) {
				sum11 = sum11 + saleOrder1.getTotal().intValue();
			}
			if(month.equals("Dec")) {
				sum12 = sum12 + saleOrder1.getTotal().intValue();
			}

			String day = (String) dateFormat.subSequence(8, 10);
			System.out.println(dateFormat);
			System.out.println(month);
		}

		saleOrder.put("1", sum1);
		saleOrder.put("2", sum2);
		saleOrder.put("3", sum3);
		saleOrder.put("4", sum4);
		saleOrder.put("5", sum5);
		saleOrder.put("6", sum6);
		saleOrder.put("7", sum7);
		saleOrder.put("8", sum8);
		saleOrder.put("9", sum9);
		saleOrder.put("10", sum10);
		saleOrder.put("11", sum11);
		saleOrder.put("12", sum12);
		model.addAttribute("saleOrder", saleOrder);

		Locale locale = new Locale("vi", "VN");
		NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
		String sums = fmt.format(sum);

		model.addAttribute("sum", sums);

		model.addAttribute("quantity", quantity);
		return "admin/AdminIndex";
	}
	@GetMapping({"/CreateToeic"})
	public String CreateToeic() {
		return "admin/CreateToeicQuestion";
	}

	@GetMapping({"/createExamToeic"})
	public String CreateExamToeic() {
		return "admin/CreateExamToeic";
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
		return "redirect:/admin/profile";
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
		
	}

}
