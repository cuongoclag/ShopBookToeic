package com.webtoeic.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ListeningExercisesQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.webtoeic.entities.QListeningExercises;
import com.webtoeic.repository.ListeningExercisesRepository;
import com.webtoeic.util.ExcelUtil;

@Service
public class ListeningExercisesService {

	@Autowired
	private ListeningExercisesRepository baiTapNgheRepo;

	@Autowired
	private ListeningExercisesQuestionsService listeningExercisesQuestionsService;

	@Autowired
	private ExcelUtil excelUtil;

	public List<ListeningExercises> findAll(){
		return baiTapNgheRepo.findAll();
	}
	public Page<ListeningExercises> findAllListBaiTapNgheByPartAndDoKho(int page, int size, int part, int doKho) {
		return baiTapNgheRepo.findByPartAndDifficult(part, doKho, PageRequest.of(page-1, size));
	}

	public Page<ListeningExercises> findAllListBaiTapNgheByPartAndDoKhoAdmin(int page, int size, String part, String doKho) {
		BooleanBuilder builder = new BooleanBuilder();

		if (!part.equals("")) {
			builder.and(QListeningExercises.listeningExercises.part.eq(Integer.parseInt(part)));
		}

		if (!doKho.equals("")) {
			builder.and(QListeningExercises.listeningExercises.difficult.eq(Integer.parseInt(doKho)));
		}

		return baiTapNgheRepo.findAll(builder, PageRequest.of(page - 1, size));
	}

	public Optional<ListeningExercises> findBaiTapNgheById(long id) {
		return baiTapNgheRepo.findById(id);
	}

	@Transactional
	public ListeningExercises saveBaiTapNghe(ListeningExercises listeningExercises, HttpServletRequest request) {
		List<ListeningExercisesQuestions> listQuestions = new ArrayList<>();
		ListeningExercises currentBaiNghe = baiTapNgheRepo.save(listeningExercises);
		try {
			for (ListeningExercisesQuestions questions : excelUtil
					.getListQuestionsFromFileExcel(listeningExercises.getFileExcelQuestions().getInputStream())) {
				questions.setListeningExercises(currentBaiNghe);
				listQuestions.add(listeningExercisesQuestionsService.saveListeningExercisesQuestions(questions, request));
			}
//			currentBaiNghe.setDanhSachCauHoi(listCau);
			return currentBaiNghe;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void deleteBaiTapNghe(long id) {
		baiTapNgheRepo.deleteById(id);
	}
}
