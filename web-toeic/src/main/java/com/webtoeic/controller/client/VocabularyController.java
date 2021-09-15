package com.webtoeic.controller.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webtoeic.entities.VocabularyExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.VocabularyContent;
import com.webtoeic.service.VocabularyExercisesService;
import com.webtoeic.service.NguoiDungService;
import com.webtoeic.service.VocabularyContentService;

@Controller
public class VocabularyController {

	@Autowired
    VocabularyExercisesService baitaptuvungService;

	@Autowired
    VocabularyContentService noidungbaitaptuvungService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@GetMapping("/listVocab")
	public String getPage(@RequestParam(defaultValue = "1") int page, Model model) {

		// default value lấy từ kết quả đầu tiên

		Page<VocabularyExercises> list = baitaptuvungService.getVocabularyExercises(page - 1, 4);
		int totalPage = list.getTotalPages();
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listData", list.getContent());
		model.addAttribute("currentPage", page);

		List<Integer> pagelist = new ArrayList<Integer>();

		// Lap ra danh sach cac trang
		if (page == 1 || page == 2) {
			for (int i = 2; i <= 3 && i <= totalPage; i++) {
				pagelist.add(i);
			}
		} else if (page == totalPage) {
			for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		} else {
			for (int i = page; i <= page + 1 && i <= totalPage; i++) {
				pagelist.add(i);
			}
			for (int i = page - 1; i >= page - 1 && i > 1; i--) {
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		}
		model.addAttribute("pageList", pagelist);

		return "client/hocTuVung";
	}

	@RequestMapping(value = "/detailVocab/{id}", method = RequestMethod.GET)
	public String DetalVocab(@PathVariable("id") int id, ModelMap model, final HttpServletRequest request,
							 final HttpServletResponse response) throws Exception {

		Optional<VocabularyExercises> bttuvung = baitaptuvungService.getVocabularyExercisesById(id);
		List<VocabularyContent> list = noidungbaitaptuvungService.getListVocabularyExercises(bttuvung.get());
		List<VocabularyExercises> baitaptuvung = baitaptuvungService.getVocabularyExercises(id);

		model.addAttribute("idBaiTuVung", list.get(0).getVocabularyExercises().getId());
		model.addAttribute("bttuvung", bttuvung.get());
		model.addAttribute("listCauHoi", list);


		return "client/chiTietHocTuVung";

	}

	@RequestMapping(value = "/searchVocab/{search}", method = RequestMethod.POST)
	public String searchVocab(Model model, @PathVariable("search") String search,
			@RequestParam(defaultValue = "1") int page) {

		// default value lấy từ kết quả đầu tiên
		
		if (search.equals("all"))
		{		Page<VocabularyExercises> list = baitaptuvungService.getVocabularyExercises(page - 1, 4);
				int totalPage = list.getTotalPages();
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("listData", list.getContent());
				model.addAttribute("currentPage", page);
		
				List<Integer> pagelist = new ArrayList<Integer>();
		
				// Lap ra danh sach cac trang
				if (page == 1 || page == 2) {
					for (int i = 2; i <= 3 && i <= totalPage; i++) {
						pagelist.add(i);
					}
				} else if (page == totalPage) {
					for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
						pagelist.add(i);
					}
					Collections.sort(pagelist);
				} else {
					for (int i = page; i <= page + 1 && i <= totalPage; i++) {
						pagelist.add(i);
					}
					for (int i = page - 1; i >= page - 1 && i > 1; i--) {
						pagelist.add(i);
					}
					Collections.sort(pagelist);
				}
				model.addAttribute("pageList", pagelist);
				model.addAttribute("search",search);
		}
		else
		{
			List<VocabularyExercises> list = baitaptuvungService.searchListVocabularyExercises(search);
			model.addAttribute("listData", list);
			model.addAttribute("search",search);
		}
		return "client/resultSearchVocab";
	}

}
