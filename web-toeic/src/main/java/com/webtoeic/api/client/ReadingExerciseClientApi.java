package com.webtoeic.api.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.service.ReadingExercisesService;
import com.webtoeic.service.ReadingExercisesQuestionsService;

@RestController
@RequestMapping("api/client/bai-doc")
public class ReadingExerciseClientApi {
	@Autowired
	private ReadingExercisesService readingExerciseService;

	@Autowired
	private ReadingExercisesQuestionsService readingExercisesQuestionsService;

	@GetMapping("/all")
	public ResponseEntity<Page<ReadingExercises>> findAllByPartToeic(@RequestParam(defaultValue = "1") int page,
																	 @RequestParam(required = true) int part, @RequestParam(required = true) int doKho) {
		return new ResponseEntity<>(readingExerciseService.findAllListReadingExercisesByPartAndDifficult(page, 10, part, doKho),
				HttpStatus.OK);
	}
}
