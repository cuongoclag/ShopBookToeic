package com.webtoeic.service.impl;

import com.webtoeic.entities.ResultTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.ResultTestRepository;
import com.webtoeic.service.ResultTestService;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service
public class ResultTestImpl implements ResultTestService {
	@Autowired
	ResultTestRepository resultTestRepository;

	@PersistenceContext
	protected EntityManager entityManager;
	
	@Override
	public void save(ResultTest resultTest) {
		resultTestRepository.save(resultTest);
	}

	public List<ResultTest> findResultTestByUserId(int id) {
		String sql = "select * from result_test where user_id = " + id;
		Query query = entityManager.createNativeQuery(sql, ResultTest.class);
		return query.getResultList();
	}
}
