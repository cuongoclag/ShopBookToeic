package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;

public interface TestQuestionsService {
	void  save(TestQuestions testQuestions);
	List<TestQuestions> getListQuestions(Test test);
}
