package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;
@Repository
public interface TestQuestionsRespository extends JpaRepository<TestQuestions,Integer>{

	List<TestQuestions> findByTest(Test test);

}
