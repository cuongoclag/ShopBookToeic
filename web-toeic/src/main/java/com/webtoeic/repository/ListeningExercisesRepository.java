package com.webtoeic.repository;

import com.webtoeic.entities.ListeningExercises;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

public interface ListeningExercisesRepository extends JpaRepository<ListeningExercises, Long>, QuerydslPredicateExecutor<ListeningExercises> {

	Page<ListeningExercises> findByPartAndDifficult(int part, int difficult, Pageable pageable);
}
