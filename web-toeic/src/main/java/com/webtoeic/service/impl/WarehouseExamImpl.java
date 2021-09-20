package com.webtoeic.service.impl;

import com.webtoeic.entities.Product;
import com.webtoeic.entities.WarehouseExam;
import com.webtoeic.repository.WarehouseExamRepository;
import com.webtoeic.service.WarehouseExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service
public class WarehouseExamImpl implements WarehouseExamService {
    @Autowired
    WarehouseExamRepository wExamRepository;

    @PersistenceContext
    protected EntityManager entityManager;

    @Override
    public void save(WarehouseExam warehouseExam) {
        wExamRepository.save(warehouseExam);
    }

    @Override
    public List<WarehouseExam> getWarehouseExam(int id) {
        return wExamRepository.findByidQuestion(id);
    }

    @Override
    public Page<WarehouseExam> getWarehouseExam(int page, int size) {
        return wExamRepository.findAll(PageRequest.of(page, size));
    }

    @Override
    public List<WarehouseExam> getAllWarehouseExam() {
        return wExamRepository.findAll();
    }

    @Override
    public void delete(int id) {
        wExamRepository.deleteById(id);
    }

    public List<WarehouseExam> randomPart1() {
        String sql = "select * from warehouse_exam where part = 1 ORDER BY RAND() LIMIT 25";
        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
        return  query.getResultList();
    }

    public List<WarehouseExam> randomPart2() {
        String sql = "select * from warehouse_exam where part = 2 ORDER BY RAND() LIMIT 25";
        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
        return  query.getResultList();
    }

    public List<WarehouseExam> randomPart3() {
        String sql = "select * from warehouse_exam where part = 3 ORDER BY RAND() LIMIT 25";
        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
        return  query.getResultList();
    }

    public List<WarehouseExam> randomPart4() {
        String sql = "select * from warehouse_exam where part = 4 ORDER BY RAND() LIMIT 25";
        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
        return  query.getResultList();
    }
//
//    public List<WarehouseExam> randomPart5() {
//        String sql = "select * from warehouse_exam where part = 5 ORDER BY RAND() LIMIT 15";
//        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
//        return  query.getResultList();
//    }
//
//    public List<WarehouseExam> randomPart6() {
//        String sql = "select * from warehouse_exam where part = 6 ORDER BY RAND() LIMIT 8";
//        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
//        return  query.getResultList();
//    }
//
//    public List<WarehouseExam> randomPart7() {
//        String sql = "select * from warehouse_exam where part = 7 ORDER BY RAND() LIMIT 26";
//        Query query = entityManager.createNativeQuery(sql, WarehouseExam.class);
//        return  query.getResultList();
//    }
}
