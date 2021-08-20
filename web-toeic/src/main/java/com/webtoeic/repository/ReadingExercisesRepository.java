package com.webtoeic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.webtoeic.entities.ReadingExercises;

public interface ReadingExercisesRepository extends JpaRepository<ReadingExercises, Long>, QuerydslPredicateExecutor<ReadingExercises> {
	Page<ReadingExercises> findByPartAndAndDifficult(int part, int difficult, Pageable pageable);
}
