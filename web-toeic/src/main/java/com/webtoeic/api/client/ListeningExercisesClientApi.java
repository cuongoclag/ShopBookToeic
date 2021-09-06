package com.webtoeic.api.client;

import com.webtoeic.entities.ListeningExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.service.ListeningExercisesService;
import com.webtoeic.service.ListeningExercisesQuestionsService;

@RestController
@RequestMapping("api/client/bai-nghe")
public class ListeningExercisesClientApi {

//	@Autowired
//	private ListeningExercisesService baiNgheService;
//
//	@Autowired
//	private ListeningExercisesQuestionsService cauHoiService;
//
//	@GetMapping("/baiNgheId={baiNgheId}")
//	public ResponseEntity<Page<ListeningExercisesQuestions>> getListCauHoiByBaiTapNgheId(
//			@RequestParam(defaultValue = "1") int page, @PathVariable long baiNgheId) {
//		return new ResponseEntity<>(cauHoiService.(page, 3, baiNgheId), HttpStatus.OK);
//	}
//
//	@GetMapping("/all")
//	public ResponseEntity<Page<ListeningExercises>> findAllByPartToeic(@RequestParam(defaultValue = "1") int page,
//                                                                       @RequestParam(required = true) int part, @RequestParam(required = true) int doKho) {
//		return new ResponseEntity<>(baiNgheService.findAllListBaiTapNgheByPartAndDoKho(page, 10, part, doKho),
//				HttpStatus.OK);
//	}
}
