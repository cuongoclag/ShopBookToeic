package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.entities.Test;
import com.webtoeic.entities.TestQuestions;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ListeningExercisesQuestionsRepository extends JpaRepository<ListeningExercisesQuestions, Integer> {
}
