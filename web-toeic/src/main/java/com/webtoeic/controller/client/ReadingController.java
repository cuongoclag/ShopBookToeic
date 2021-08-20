package com.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.service.ReadingExercisesService;

@Controller
@RequestMapping("/reading")
public class ReadingController {
	
	@Autowired
	private ReadingExercisesService readingExercisesService;

	@GetMapping("/part-{partNumber}/{id}")
	public String baiDocPart(@PathVariable long id, @PathVariable int partNumber, Model model) {
		ReadingExercises readingExercises = readingExercisesService.findReadingExercisesById(id).get();
		model.addAttribute("baiTapDoc", readingExercises);
		return "client/baiTapDoc/baiTapDocPart" + partNumber;
	}

	@GetMapping("")
	public String getAllBaiDocBy(Model model) {
		return "client/baiTapDoc/danhSachBaiDoc";
	}

}
