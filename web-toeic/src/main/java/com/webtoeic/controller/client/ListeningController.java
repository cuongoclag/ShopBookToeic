package com.webtoeic.controller.client;

import com.webtoeic.entities.ListeningExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtoeic.service.ListeningExercisesService;

@Controller
@RequestMapping("/listening")
public class ListeningController {

	@Autowired
	private ListeningExercisesService listeningExercisesService;

	@GetMapping("/part-{partNumber}/{id}")
	public String baiNghePart1(@PathVariable long id, @PathVariable int partNumber, Model model) {
		ListeningExercises listeningExercises = listeningExercisesService.findBaiTapNgheById(id).get();
		model.addAttribute("baiTapNghe", listeningExercises);
		return "client/baiTapNghe/baiTapNghePart" + partNumber;
	}

	@GetMapping("")
	public String getAllBaiNgheBy(Model model) {
		model.addAttribute("listBaiNghe", listeningExercisesService.findAll());
		return "client/baiTapNghe/danhSachBaiNghe";
	}
}
