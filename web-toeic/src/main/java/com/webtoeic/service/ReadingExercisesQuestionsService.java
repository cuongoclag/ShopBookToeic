package com.webtoeic.service;

import java.io.IOException;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.repository.ReadingExercisesQuestionsRepository;

@Service
public class ReadingExercisesQuestionsService {
	@Autowired
	private ReadingExercisesQuestionsRepository readingExercisesQuestionsRepository;

	public Page<ReadingExercisesQuestions> findListReadingExecisesQuestions(int page, int size, long baiTapDocId) {
		return readingExercisesQuestionsRepository.findByReadingExercisesId(baiTapDocId, PageRequest.of(page - 1, size));
	}

	public Optional<ReadingExercisesQuestions> findReadingQuestionsById(long id) {
		return readingExercisesQuestionsRepository.findById(id);
	}

	@Transactional
	public ReadingExercisesQuestions saveReadingExerciseQuestions(ReadingExercisesQuestions readingExercisesQuestions, HttpServletRequest request)
			throws IOException {
		return readingExercisesQuestionsRepository.save(readingExercisesQuestions);
	}

	public void deleteCauHoiBaiTapDoc(long id) {
		readingExercisesQuestionsRepository.deleteById(id);
	}

}
