package com.webtoeic.repository;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.Test;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ListeningExercisesRepository extends JpaRepository<ListeningExercises, Integer> {
	List<ListeningExercises> findById(int id);
	Page<ListeningExercises> findByPartAndDifficult(int part, int difficult, Pageable pageable);
}
