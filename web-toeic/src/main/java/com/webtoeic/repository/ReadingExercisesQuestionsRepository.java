package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.ReadingExercisesQuestions;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReadingExercisesQuestionsRepository extends JpaRepository<ReadingExercisesQuestions, Long> {

	Page<ReadingExercisesQuestions> findByReadingExercisesId(long readingExerciseId, Pageable pageable);
	List<ReadingExercisesQuestions> findByReadingExercisesId(long readingExerciseId);
}
