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

}
