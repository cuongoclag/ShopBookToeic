package com.webtoeic.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.repository.ReadingExercisesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.webtoeic.entities.QReadingExercises;
import com.webtoeic.util.ExcelUtilDoc;

@Service
public class ReadingExercisesService {

	@Autowired
	private ReadingExercisesRepository readingExercisesRepository;

	@Autowired
	private ReadingExercisesQuestionsService readingExercisesQuestionsService;

	@Autowired
	private ExcelUtilDoc excelUtilDoc;


	public Page<ReadingExercises> findAllListReadingExercisesByPartAndDifficult(int page, int size, int part, int ifficult) {
		return readingExercisesRepository.findByPartAndAndDifficult(part, ifficult, PageRequest.of(page-1, size));
	};

	public Page<ReadingExercises> findAllListReadingExercisesByPartAndDifficultAdmin(int page, int size, String part, String doKho) {
		BooleanBuilder builder = new BooleanBuilder();

		if (!part.equals("")) {
			builder.and(QReadingExercises.readingExercises.part.eq(Integer.parseInt(part)));
		}

		if (!doKho.equals("")) {
			builder.and(QReadingExercises.readingExercises.difficult.eq(Integer.parseInt(doKho)));
		}

		return readingExercisesRepository.findAll(builder, PageRequest.of(page - 1, size));
	}

	public Optional<ReadingExercises> findReadingExercisesById(long id) {
		return readingExercisesRepository.findById(id);
	}

	@Transactional
	public ReadingExercises saveReadindExercises(ReadingExercises readingExercises, HttpServletRequest request) {
		List<ReadingExercisesQuestions> listQuestions = new ArrayList<>();
		ReadingExercises currentReading = readingExercisesRepository.save(readingExercises);
		try {
			for (ReadingExercisesQuestions questions : excelUtilDoc
					.getListQuestionsFromFileExcel(readingExercises.getFileExcelQuestions().getInputStream())) {
				questions.setReadingExercises(currentReading);
				listQuestions.add(readingExercisesQuestionsService.saveReadingExerciseQuestions(questions, request));
			}
//			currentBaiDoc.setDanhSachCauHoi(listCau);
			return currentReading;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public void deleteReadingExercises(long id) {
		readingExercisesRepository.deleteById(id);
	}

}
