package com.webtoeic.service.impl;

import com.webtoeic.entities.ResultTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.ResultTestRepository;
import com.webtoeic.service.ResultTestService;

@Service
public class ResultTestImpl implements ResultTestService {
	@Autowired
	ResultTestRepository resultTestRepository;
	
	@Override
	public void save(ResultTest resultTest) {
		resultTestRepository.save(resultTest);
	}
}
