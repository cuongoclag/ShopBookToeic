package com.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.ResultTest;

@Repository
public interface ResultTestRepository extends JpaRepository<ResultTest,Integer> {
	
}
