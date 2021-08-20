package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.ListeningExercisesQuestions;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ListeningExercisesQuestionsRepository extends JpaRepository<ListeningExercisesQuestions, Long> {

	Page<ListeningExercisesQuestions> findByListeningExercisesId(long listeningExercisesId, Pageable pageable);
	List<ListeningExercisesQuestions> findByListeningExercisesId(long listeningExercisesId);
}
