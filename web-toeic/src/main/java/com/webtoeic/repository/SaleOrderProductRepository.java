package com.webtoeic.repository;

import com.webtoeic.entities.SaleOrderProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleOrderProductRepository extends JpaRepository<SaleOrderProducts, Integer> {
}
