package com.webtoeic.repository;

import com.webtoeic.entities.WarehouseExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WarehouseExamRepository extends JpaRepository<WarehouseExam, Integer> {
    List<WarehouseExam> findByidQuestion(int id);
}
