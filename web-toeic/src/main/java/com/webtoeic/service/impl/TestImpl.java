package com.webtoeic.service.impl;

import java.util.List;

import com.webtoeic.entities.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.TestRespository;
import com.webtoeic.service.TestService;

@Service
public class TestImpl implements TestService {

	@Autowired
	TestRespository testRespository;

	@Override
	public void save(Test test) {
		testRespository.save(test);
	}

	@Override
	public List<Test> getTest(int id){
		return testRespository.findBytestId(id);
	}

	@Override
	public Page<Test> getTest(int page, int size){
		return testRespository.findAll(PageRequest.of(page, size));

	}

	@Override
	public List<Test>getAllTest(){
		return testRespository.findAll();
	}

	@Override
	public void delete(int id) {
		testRespository.deleteById(id);
	}
}
