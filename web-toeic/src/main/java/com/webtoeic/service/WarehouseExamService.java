package com.webtoeic.service;

import com.webtoeic.entities.WarehouseExam;
import org.springframework.data.domain.Page;

import java.util.List;

public interface WarehouseExamService {

    void save(WarehouseExam warehouseExam);

    List<WarehouseExam> getWarehouseExam(int id);

    Page<WarehouseExam> getWarehouseExam(int page, int limit);

    List<WarehouseExam> getAllWarehouseExam();

    void delete(int id);
}
