package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.Test;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TestRespository extends JpaRepository<Test,Integer>{
	List<Test> findBytestId(int id);

}
