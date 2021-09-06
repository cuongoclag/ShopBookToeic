package com.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;
import com.webtoeic.repository.TestQuestionsRespository;
import com.webtoeic.service.TestQuestionsService;
@Service
public class TestQuestionsImpl implements TestQuestionsService {

	@Autowired
	TestQuestionsRespository testQuestionsRespository;

	@Override
	public void  save(TestQuestions cauhoibaithithu) {

		testQuestionsRespository.save(cauhoibaithithu);
	}

	@Override
	public List<TestQuestions> getListQuestions(Test test){
		return testQuestionsRespository.findByTest(test);
	}

}
