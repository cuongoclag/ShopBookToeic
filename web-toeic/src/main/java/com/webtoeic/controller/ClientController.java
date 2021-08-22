package com.webtoeic.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webtoeic.entities.Product;
import com.webtoeic.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.VocabularyExercisesService;
import com.webtoeic.service.NguoiDungService;
import com.webtoeic.service.SlideBannerService;

import java.util.List;

@Controller
@SessionAttributes("loggedInUser")
public class ClientController {
	@Autowired
	private SlideBannerService slideBannerService;
	@Autowired
	private VocabularyExercisesService baitaptuvungService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private ProductService productService;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung nguoiDung = new NguoiDung();
		if (auth.getClass().isAssignableFrom(OAuth2AuthenticationToken.class)) {
			String principal = auth.getPrincipal().toString();
			String[] part = principal.split(",");
			String name = part[2].split("=")[1];
			nguoiDung.setFullName(name);
			nguoiDung.setLoginOauth2(true);
			return nguoiDung;
		} else {
			return nguoiDungService.findByEmail(auth.getName());
		}
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		NguoiDung nguoiDung = (NguoiDung) request.getSession().getAttribute("loggedInUser");
		return nguoiDung;
	}

	@GetMapping(value = { "/"})
	public String home(Model model, @AuthenticationPrincipal OAuth2User oauth2User, HttpServletRequest request) {
		model.addAttribute("listslidebanner", slideBannerService.findAll());
		return "client/home";
	}
	//Trả về trang listBook
	@GetMapping(value = "/listBook")
	public String listBook(Model model){
		List<Product> productList = productService.findAllProduct();
		model.addAttribute("listProduct", productList);
		return "client/listBook";
	}

	@RequestMapping(value = { "/bookDetails/{id}" }, method = RequestMethod.GET)
	public String detailsBook(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
								  final HttpServletResponse response) throws Exception {
		List<Product> list = productService.findProductById(id);
		model.addAttribute("list", list);
		return "client/detailBook";
	}



	@GetMapping(value = "test")
	public String testmarkdown() {
		return "client/testMardown";
	}

	@GetMapping(value = "/profile")
	public String profilePage(Model model, HttpServletRequest request, @AuthenticationPrincipal OAuth2User oauth2User) {
		model.addAttribute("user", getSessionUser(request));
		return "client/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setAddress(nd.getAddress());
		currentUser.setFullName(nd.getFullName());
		currentUser.setPhone(nd.getPhone());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/profile";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

}
