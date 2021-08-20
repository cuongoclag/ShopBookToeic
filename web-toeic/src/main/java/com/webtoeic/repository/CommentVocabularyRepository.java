package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.CommentVocabulary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.VocabularyExercises;


@Repository
public interface CommentVocabularyRepository extends JpaRepository<CommentVocabulary,Integer> {
	List<CommentVocabulary> findByVocabularyExercises(VocabularyExercises vocabularyExercises);
}
