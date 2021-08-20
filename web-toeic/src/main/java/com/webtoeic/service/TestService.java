package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.Test;
import org.springframework.data.domain.Page;

public interface TestService {
	void save(Test baithithu);
	List<Test> getTest(int id);

	Page<Test> getTest(int page, int limit);

	List<Test> getAllTest();
	void delete(int id);
}
